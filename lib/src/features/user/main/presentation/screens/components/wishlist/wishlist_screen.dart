import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:flutter/material.dart';

part 'widgets/wishlist_card.dart';

class WsishListScreen extends StatelessWidget {
  const WsishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView.separated(
            itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(height: 16),
                    WishlistCard(),
                  ],
                ),
            separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                ),
            itemCount: 7),
      ),
    );
  }
}
