import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myitems = [
    Image.asset("assets/images/oil.jpg"),
    Image.asset("assets/images/riceSack.jpg"),
    Image.asset("assets/images/soap.jpg"),
    Image.asset("assets/images/sugar.jpg"),
  ];
  int myCurrentindex = 0;
// list for category data
// String selectedCategory = "All"; //defult category
//   List<Map<String,dynamic>> categoryData=[
//     {"category":"All"},
//     {"category":"Flour"},
//     {"category":"Soap"},
//     {"category":"Oil"},
//     {"category":"Noodles"},
//     {"category":"Biscuits"},
//   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           
        title: Text(
          "Home",
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
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
              ),

        ],
      ),
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: 300,
                child: CupertinoSearchTextField(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 7,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayInterval: Duration(seconds: 3),
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              myCurrentindex = index;
                            });
                          }),
                      items: myitems,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: myCurrentindex,
                        count: myitems.length,
                        effect: WormEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 10,
                            dotColor: Colors.grey.shade200,
                            paintStyle: PaintingStyle.fill),
                      ),
                    )
                  ],
                ),
              ),
             
              
            ],
          ),
          Positioned(
            top: 450,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,top: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return SizedBox(
                    child: Container(
                      height: 150,
                      width: 150,
                      clipBehavior: Clip.hardEdge,
                      
                      child: InkWell(
                        splashColor: Color.fromRGBO(119, 67, 219, 1),
                        onTap: (){},
                        

                        child: Column(  
                          children: [
                            // Image.asset("images/oil.jpg",
                            // height: 150,
                            // width: 250,
                            // fit: BoxFit.cover,),
                            Padding(
                              padding: const EdgeInsets.only(left: 7,right: 7),
                              child: Column(
                                children: [
                                  Text("Sunflower Oil",
                                style:TextStyle(fontSize: 20,),
                                ),
                                  Text("Price:1000 ",
                                style:TextStyle(
                                  fontSize: 16
                                //  decoration: TextDecoration.lineThrough,fontSize: 16
                                ),
                                ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
                
              ),
            ),

         
        ],
      ),
    );
  }
}
