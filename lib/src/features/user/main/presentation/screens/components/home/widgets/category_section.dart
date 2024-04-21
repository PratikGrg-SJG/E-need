part of '../home_screen.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
      builder: (context, state) {
        return SizedBox(
          height: 25,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print("ypp :: $index");
                if (index == 0) {
                  console("ypp :: ");
                  showCategoryProductsNotifier.value = false;
                  sl
                      .get<GetAllCategoriesCubit>()
                      .selectedCategoryIndex(index: index);
                  sl.get<GetAllProductsCubit>().getAllProducts();
                } else {
                  sl
                      .get<GetAllCategoriesCubit>()
                      .selectedCategoryIndex(index: index);
                  sl.get<GetProductsByCategoryCubit>().getProductsByCategory(
                      categoryId: state.categories?[index].id ?? 0);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: index == state.categoryIndex ? AppColor.kMain : null,
                    borderRadius: BorderRadius.circular(
                      borderRadiusSecond,
                    )),
                child: Center(
                  child: Text(
                    state.categories?[index].name ?? "",
                    style: TextStyle(
                      color: index == state.categoryIndex ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: state.categories?.length ?? 0,
          ),
        );
      },
    );
  }
}
