import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/app/medias.dart';
import 'package:e_needs/src/core/states/states.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/cart_screen.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/add_order_cubit/add_order_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/get_order_cubit/get_orders_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/order_success_screen.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../utils/custom_toasts.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        paymentCODMethodSelectedNotifier.value = false;
        paymentKhaltiMethodSelectedNotifier.value = false;
      },
      child: BlocListener<AddOrderCubit, AddOrderState>(
        listener: (context, state) {
          if (state.status == AddOrderStatus.loading) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state.status == AddOrderStatus.failure) {
            Navigator.pop(context);
            errorToast(msg: state.message);
          }
          if (state.status == AddOrderStatus.success) {
            sl.get<GetOrdersCubit>().getOrders();
            sl.get<GetCartCubit>().getCart();
            Navigator.pop(context);
            successToast(msg: state.message);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderSuccessScreen(),
                ),
                (route) => false);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Payment Methods",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            // actions: [
            //   IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         CupertinoIcons.delete,
            //         color: Colors.black,
            //       )),
            // ],
          ),
          body: Padding(
            padding: screenLeftRightPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                Text(
                  "Select any payment method to continue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.kMain,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder(
                  valueListenable: paymentCODMethodSelectedNotifier,
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      paymentCODMethodSelectedNotifier.value = true;
                      paymentKhaltiMethodSelectedNotifier.value = false;
                    },
                    child: CustomShadowContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash on Delivery",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (paymentCODMethodSelectedNotifier.value ==
                              true) ...[
                            Icon(
                              CupertinoIcons.check_mark_circled_solid,
                              color: Colors.green,
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                ValueListenableBuilder(
                  valueListenable: paymentKhaltiMethodSelectedNotifier,
                  builder: (context, value, child) => GestureDetector(
                    onTap: () {
                      paymentKhaltiMethodSelectedNotifier.value = true;
                      paymentCODMethodSelectedNotifier.value = false;
                    },
                    child: CustomShadowContainer(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                kKhaltiLogoSvg,
                                height: 26,
                              ),
                            ],
                          ),
                          if (paymentKhaltiMethodSelectedNotifier.value ==
                              true) ...[
                            Icon(
                              CupertinoIcons.check_mark_circled_solid,
                              color: Colors.green,
                            ),
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                TotalSection(isFromPaymentScreen: true),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
