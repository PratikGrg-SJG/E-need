import 'package:e_needs/di_injection.dart';
import 'package:e_needs/src/core/app/dimensions.dart';
import 'package:e_needs/src/features/user/main/presentation/screens/components/search/bloc/search_bloc.dart';
import 'package:e_needs/src/utils/throttle_debouncer%20copy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../home/home_screen.dart';
import '../product/product_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvoked: (didPop) {
          sl.get<SearchBloc>().searchController.clear();
          sl.get<SearchBloc>().state.products?.clear();
        },
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                height: 44,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CupertinoSearchTextField(
                        autofocus: true,
                        controller: sl.get<SearchBloc>().searchController,
                        onChanged: (value) {
                          Debouncer(
                            delay: throttleDuration,
                          ).call(() {
                            sl.get<SearchBloc>().add(SearchEvent());
                          });
                        },
                        suffixMode: OverlayVisibilityMode.never,
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(height: 16),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  return Expanded(
                    child: (state.products ?? []).isEmpty
                        ? Center(
                            child: Text("No products found"),
                          )
                        : Padding(
                            padding: screenLeftRightPadding,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Search Resuts: ${state.products?.length}"),
                                  SizedBox(height: 16),
                                  GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 25,
                                      mainAxisExtent: 230,
                                    ),
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductScreen(
                                                      product: state
                                                          .products?[index]),
                                            ));
                                      },
                                      child: ProductCard(
                                          product: state.products?[index]),
                                    ),
                                    itemCount: state.products?.length ?? 0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
