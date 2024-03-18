import 'dart:math';

import 'package:e_needs/models/models.dart';
import 'package:flutter/material.dart';
class OnBoadingScreen extends StatefulWidget {
  const OnBoadingScreen({super.key});

  @override
  State<OnBoadingScreen> createState() => _OnBoadingScreenState();
}

class _OnBoadingScreenState extends State<OnBoadingScreen> {

  late PageController _pageController;
  int _currentPage =0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage:_currentPage,viewportFraction: 0.8);
  }

  @override
  void dispose() {
  
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const Padding(
            padding: const EdgeInsets.only(top: 40.0,left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Find What's New",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 30,
                  ),
                  ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 0.85,
            child: PageView.builder(
              itemCount: dataList.length,
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              itemBuilder: (context,index){
                return carouselView(index);
          
            }),
          )

      ],),
    );
  }

  Widget carouselView(int index){
   return AnimatedBuilder(
      animation: _pageController,   
       builder: (context,child){
        double value = 0.0;
        if(_pageController.position.haveDimensions){
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1,1); //makes the side card tilted
        }
        return Transform.rotate(
          angle: pi*value, 
          child: carouselCard(dataList[index]),
          );//gives straigt card for current index 
       
       },
       );
    
  }
 

  Widget carouselCard(DataModel data){
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage(data.imageName,),
                  fit: BoxFit.fill),
                  boxShadow: const[
                    BoxShadow(
                      offset: Offset(0, 4),blurRadius: 4,color: Colors.black26
                    )
                  ]
                
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(data.title,
          style: TextStyle(color: const Color.fromARGB(221, 61, 58, 58),
          fontSize: 25,
          fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("\$${data.title}",
          style: TextStyle(color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}