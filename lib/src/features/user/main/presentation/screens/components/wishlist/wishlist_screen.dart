import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/features/user/main/data/models/wishlist/wishlist_response_model.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/wishlist/bloc/update_wishlist_cubit/update_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/configs/api_config.dart';
import '../../../../../../../utils/custom_toasts.dart';

part 'widgets/wishlist_card.dart';

class WsishListScreen extends StatelessWidget {
  const WsishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateWishlistCubit, UpdateWishlistState>(
      listener: (context, state) {
        if (state.status == UpdateWishlistStatus.loading) {}
        if (state.status == UpdateWishlistStatus.failure) {
          errorToast(msg: state.message);
        }
        if (state.status == UpdateWishlistStatus.success) {
          sl.get<GetWishlistCubit>().getWishlist();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              content: Text(state.message ?? ''),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Wishlist",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: screenLeftRightPadding,
          child: BlocBuilder<GetWishlistCubit, GetWishlistState>(
            builder: (context, state) {
              return (state.wishlist ?? []).isEmpty
                  ? Center(
                      child: Text("Empty Wishlist"),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                            children: [
                              SizedBox(height: 16),
                              WishlistCard(
                                wishlist: state.wishlist?[index],
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => Divider(
                            thickness: 2,
                          ),
                      itemCount: state.wishlist?.length ?? 0);
            },
          ),
        ),
      ),
    );
  }
}
