part of '../home_screen.dart';

class CarouselSection extends StatefulWidget {
  const CarouselSection({super.key});

  @override
  State<CarouselSection> createState() => _CarouselSectionState();
}

class _CarouselSectionState extends State<CarouselSection> {
  final List<String> _bannerImages = [
    "https://t4.ftcdn.net/jpg/05/97/26/83/360_F_597268323_KVAyxDzImXBcQrcKIiZUzjTCw5tPTFuw.jpg",
    "https://www.solidbackgrounds.com/images/3840x2160/3840x2160-khaki-web-solid-color-background.jpg",
    "https://www.solidbackgrounds.com/images/950x350/950x350-amber-solid-color-background.jpg",
  ];

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
                items: _bannerImages
                    .map((item) => Image.network(
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
            children: _bannerImages.asMap().entries.map(
              (entry) {
                return Container(
                  width: carouselIndexNotifier.value == entry.key ? 22 : 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: carouselIndexNotifier.value == entry.key
                        ? AppColor.kPurple
                        : AppColor.kPurpleLighter,
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
