part of '../cart_screen.dart';

class TotalSection extends StatelessWidget {
  const TotalSection({super.key, this.isFromPaymentScreen = false});

  final bool? isFromPaymentScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Cart Total",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Rs. 2600",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Delivery charge",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "-",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                "Discount",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "-",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 3,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                Text(
                  "Rs.2600",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        SizedBox(
          height: 45,
          width: 190,
          child: ElevatedButton(
            onPressed: isFromPaymentScreen == true
                ? () {}
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(),
                      ),
                    );
                  },
            child: Text(
              isFromPaymentScreen == true ? "Buy Now" : "Pay Now",
              style: TextStyle(color: const Color.fromARGB(255, 251, 250, 250)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.kPurple,
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              elevation: 20,
              shadowColor: Color.fromARGB(255, 186, 176, 176),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusSecond),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
