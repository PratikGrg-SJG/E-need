part of '../home_screen.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: carouselIndexNotifier,
      builder: (context, value, child) => Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 140,
              width: double.infinity,
              child: CarouselSlider(
                items: [kBanner1Image, kBanner2Image, kBanner3Image]
                    .map((item) => Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: true,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    carouselIndexNotifier.value = index;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          //dot indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [kBanner1Image, kBanner2Image, kBanner3Image]
                .asMap()
                .entries
                .map(
              (entry) {
                return Container(
                  width: carouselIndexNotifier.value == entry.key ? 22 : 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: carouselIndexNotifier.value == entry.key
                        ? Colors.black54
                        : Colors.grey.shade300,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
