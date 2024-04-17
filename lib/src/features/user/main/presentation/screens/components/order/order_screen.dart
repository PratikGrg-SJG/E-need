import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/development/console.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/order/bloc/get_order_cubit/get_orders_cubit.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<GetOrdersCubit, GetOrdersState>(
        builder: (context, state) {
          console(state.orderResponseModel?.data?.length);

          return (state.orderResponseModel?.data ?? []).isEmpty
              ? Center(
                  child: Text(
                    "Empty Orders",
                  ),
                )
              : Padding(
                  padding: screenLeftRightPadding,
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        console(state.orderResponseModel?.data);

                        var orderItem = state.orderResponseModel?.data;
                        return CustomShadowContainer(
                          padding: EdgeInsets.all(16),
                          widget: Row(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 60,
                                child: Placeholder(),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              orderItem?[index].paymentMethod ??
                                                  ''),
                                          Text((DateFormat.yMMMMd().format(
                                                  orderItem?[index].createdAt ??
                                                      DateTime.now()))
                                              .toString()),
                                        ],
                                      ),
                                      Text(
                                        "Order ID: ${orderItem?[index].orderId}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                      itemCount: state.orderResponseModel?.data?.length ?? 0),
                );
        },
      ),
    );
  }
}
