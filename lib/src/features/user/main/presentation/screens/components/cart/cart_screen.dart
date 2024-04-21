import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/enums/enums.dart';
import 'package:e_needs/src/core/states/states.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/update_quantity_cubit/update_quantity_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/add_order_cubit/add_order_cubit.dart';
import 'package:e_needs/src/models/common_request_model.dart';
import 'package:e_needs/src/utils/custom_toasts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

import '../../../../../../../services/local/secure_storage.dart';
import 'payments/payment_screen.dart';

part 'widgets/total_section.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
// for icon button of addong product
  int click = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateQuantityCubit, UpdateQuantityState>(
          listener: (context, state) {
            if (state.status == UpdateQuantityStatus.loading) {}
            if (state.status == UpdateQuantityStatus.failure) {
              errorToast(msg: state.message);
            }
            if (state.status == UpdateQuantityStatus.success) {
              sl.get<GetCartCubit>().getCart();
            }
          },
        ),
        BlocListener<GetCartCubit, GetCartState>(
          listener: (context, state) {
            if (state.status == GetCartStatus.failure) {
              errorToast(msg: state.message);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: screenLeftRightPadding,
          child: BlocBuilder<GetCartCubit, GetCartState>(
            builder: (context, state) {
              return (state.cartItems?.data?.productData ?? []).isEmpty
                  ? Center(
                      child: GestureDetector(
                          onTap: () {
                            sl.get<GetCartCubit>().getCart();
                          },
                          child: Text("Empty Cart")),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount:
                                  state.cartItems?.data?.productData?.length ??
                                      0,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 10),
                              itemBuilder: (context, index) {
                                var product =
                                    state.cartItems?.data?.productData?[index];
                                return SizedBox(
                                  child: Card(
                                    color: AppColor.kCardbg,
                                    shadowColor: Colors.black12,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 10, bottom: 8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/riceSack.jpg',
                                              height: 100,
                                              width: 120,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                product?.productName ?? '',
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "Rs. ${product?.price}",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton.filledTonal(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              AppColor.kWhite),
                                                      padding:
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets.zero),
                                                      minimumSize:
                                                          MaterialStatePropertyAll(
                                                        Size(34, 34),
                                                      ),
                                                      maximumSize:
                                                          MaterialStatePropertyAll(
                                                        Size(34, 34),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      var userId =
                                                          await SharedPreference
                                                              .getUserId();
                                                      sl
                                                          .get<
                                                              UpdateQuantityCubit>()
                                                          .updateQuantity(
                                                              CommonRequestModel(
                                                            isQtyIncrease:
                                                                false,
                                                            userId: userId,
                                                            productId: product
                                                                ?.productId,
                                                          ));
                                                    },
                                                    icon: Icon(Icons.remove),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    product?.quantity ?? '',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  IconButton.filledTonal(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              AppColor.kWhite),
                                                      padding:
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets.zero),
                                                      minimumSize:
                                                          MaterialStatePropertyAll(
                                                        Size(34, 34),
                                                      ),
                                                      maximumSize:
                                                          MaterialStatePropertyAll(
                                                        Size(34, 34),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      var userId =
                                                          await SharedPreference
                                                              .getUserId();
                                                      sl
                                                          .get<
                                                              UpdateQuantityCubit>()
                                                          .updateQuantity(
                                                              CommonRequestModel(
                                                            isQtyIncrease: true,
                                                            userId: userId,
                                                            productId: product
                                                                ?.productId,
                                                          ));
                                                    },
                                                    icon: Icon(Icons.add),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TotalSection(),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
