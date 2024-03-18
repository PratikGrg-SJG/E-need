import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 239, 229, 1),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        NavigationDestination(
          icon: Icon(Icons.list),
          label: 'order',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite),
          label: 'liked',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'cart',
        ),
      ]),
      appBar: AppBar(
        title: Text(
          "Cart",
        ),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          shadowColor: Colors.black12,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 10, bottom: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rice",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                    // Text(" 1 litter sunflower oil  ",
                                    // overflow: TextOverflow.clip,
                                    // style: TextStyle(

                                    //   fontSize: 15,
                                    //   fontWeight: FontWeight.w400,
                                    //   color: Colors.black
                                    // ),),
                                    Text(
                                      "Rs.2600",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon:
                                                Icon(Icons.add_circle_outline)),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                Icons.remove_circle_outline))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cart Total",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text("Rs. 2600",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery charge",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text("-",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      Text("Rs.2600",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 45,
              width: 190,
              child: ElevatedButton(
                
                onPressed: () {},
                child: Text(
                  "Buy",
                  style: TextStyle(color: const Color.fromARGB(255, 251, 250, 250)),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(119, 67, 219, 1),
                    textStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    elevation: 20,
                    shadowColor: Color.fromARGB(255, 186, 176, 176),
                    // side: BorderSide(color: )
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
