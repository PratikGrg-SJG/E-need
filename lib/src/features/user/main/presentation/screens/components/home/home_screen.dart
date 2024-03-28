import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_needs/src/core/app/colors.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/core/configs/api_config.dart';
import 'package:e_needs/src/features/user/main/data/models/products/product_response_model.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/home/bloc/cubit/get_all_categories_cubit.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/product/bloc/cubit/get_all_products_cubit.dart';
import 'package:e_needs/src/widgets/custom_shadow_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/app/medias.dart';
import '../../../../../../../core/states/states.dart';
import '../cart/cart_screen.dart';
import '../product/product_screen.dart';

part 'widgets/carousel_section.dart';
part 'widgets/category_section.dart';
part 'widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ));
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50),
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: CustomShadowContainer(
              widget: CupertinoSearchTextField(
                padding: EdgeInsets.all(14),
                prefixInsets: EdgeInsets.only(left: 16),
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
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                CarouselSection(),
                SizedBox(
                  height: 30,
                ),
                CategorySection(),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
                  builder: (context, state) {
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 25,
                        mainAxisExtent: 230,
                      ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductScreen(
                                    product: state
                                        .productsResponseModel?.data?[index]),
                              ));
                        },
                        child: ProductCard(product: state.productsResponseModel?.data?[index]),
                      ),
                      itemCount: state.productsResponseModel?.data?.length ?? 0,
                    );
                  },
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
