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
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: index == 0 ? AppColor.kMain : null,
                  borderRadius: BorderRadius.circular(
                    borderRadiusSecond,
                  )),
              child: Center(
                child: Text(
                  state.categories?[index].name ?? "",
                  style: TextStyle(
                    color: index == 0 ? Colors.white : null,
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: state.categories?.length ?? 0,
          ),
        );
      },
    );
  }
}
