part of '../home_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.product,
  });

  final Products? product;

  @override
  Widget build(BuildContext context) {
    return CustomShadowContainer(
      bgColor: AppColor.kCardbg,
      widget: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius)),
            margin: EdgeInsets.only(top: 12),
            child: Image.network(
              "${ApiConfig.localhost}${product?.image}",
              height: 120,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: screenLeftRightPadding,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product?.name ?? '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Rs ${product?.price}",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
