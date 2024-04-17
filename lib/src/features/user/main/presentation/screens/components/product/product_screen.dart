import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/cart/bloc/get_cart_cubit/get_cart_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/update_wishlist_cubit/update_wishlist_cubit.dart';
import 'package:e_needs/src/utils/custom_toasts.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/app/colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, this.product});

  final Products? product;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddToCartCubit, AddToCartState>(
          listener: (context, state) {
            if (state.status == AddToCartStatus.loading) {}
            if (state.status == AddToCartStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Failed to add to cart"),
                  duration: Duration(seconds: 2),
                ),
              );
            }
            if (state.status == AddToCartStatus.success) {
              sl.get<GetCartCubit>().getCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                  content: Text(state.message ?? ''),
                ),
              );
            }
          },
        ),
        BlocListener<UpdateWishlistCubit, UpdateWishlistState>(
          listener: (context, state) {
            if (state.status == UpdateWishlistStatus.loading) {}
            if (state.status == UpdateWishlistStatus.failure) {
              errorToast(msg: state.message);
            }
            if (state.status == UpdateWishlistStatus.success) {
              sl.get<GetWishlistCubit>().getWishlist();
            }
          },
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                CustomShadowContainer(
                  clipBehavior: Clip.hardEdge,
                  height: 563,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  widget: Image.network(
                    "${ApiConfig.localhost}${product?.image}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 10,
                  child: IconButton.filledTonal(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey.shade200)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                BlocBuilder<GetWishlistCubit, GetWishlistState>(
                  builder: (context, state) {
                    final wishlistItems =
                        sl.get<GetWishlistCubit>().state.wishlist ?? [];

                    var isFavorite = wishlistItems
                        .any((wishlistItem) => wishlistItem.id == product?.id);
                    return Positioned(
                      top: 50,
                      right: 10,
                      child: IconButton.filledTonal(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.grey.shade200)),
                        onPressed: () {
                          if (isFavorite == true) {
                            sl.get<UpdateWishlistCubit>().updateWishlist(
                                addToWishlist: false, productId: product?.id);
                          } else {
                            sl.get<UpdateWishlistCubit>().updateWishlist(
                                addToWishlist: true, productId: product?.id);
                          }
                        },
                        icon: Icon(
                          isFavorite == true
                              ? Icons.favorite_outlined
                              : Icons.favorite_outline,
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: screenLeftRightPadding,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.name ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Rs ${product?.price ?? ''}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Rs ${product?.description ?? ''}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: screenLeftRightPadding,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 47,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: const Color.fromARGB(255, 140, 135, 135),
                          elevation: 5,
                          backgroundColor: AppColor.kMain,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(borderRadiusSecond),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Buy",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 47,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: const Color.fromARGB(255, 140, 135, 135),
                          elevation: 5,
                          backgroundColor: AppColor.kMain,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(borderRadiusSecond),
                          ),
                        ),
                        onPressed: () {
                          final cartItems = sl.get<GetCartCubit>().cartItems;

                          var isInCart = cartItems.any((cartProduct) =>
                              int.parse(cartProduct.productId ?? '') ==
                              product?.id);

                          if (isInCart) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.orange,
                                content: Text("Item already added to cart"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          } else {
                            sl
                                .get<AddToCartCubit>()
                                .addToCart(productId: product?.id ?? 0);
                          }
                        },
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
