part of '../wishlist_screen.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    super.key,
    this.wishlist,
  });

  final WishlistResponseModel? wishlist;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Image.network(
            "${ApiConfig.localhost}${wishlist?.image}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${wishlist?.name}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Rs. ${wishlist?.price}",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 37,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 140, 135, 135),
                    elevation: 5,
                    backgroundColor: AppColor.kMain,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusSecond),
                    ),
                  ),
                  onPressed: () {
                    sl
                        .get<AddToCartCubit>()
                        .addToCart(productId: wishlist?.id ?? 0);
                  },
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: null,
                  child: GestureDetector(
                    onTap: () => sl.get<UpdateWishlistCubit>().updateWishlist(
                        addToWishlist: false, productId: wishlist?.id),
                    child: Text(
                      "Remove",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
