import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surefix/utils/paths/colors_paths.dart';

import '../../provider/sliders/home_img_slider_provider.dart';

class CustomImageSlider extends StatelessWidget {
  final double height;
  final bool autoPlay;
  final Duration autoPlayInterval;
  final bool enlargeCenterPage;

  const CustomImageSlider({
    super.key,
    this.height = 200.0,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
    this.enlargeCenterPage = true,
  });

  bool isLocalAsset(String imagePath) {
    return imagePath.startsWith('assets/');
  }

  @override
  Widget build(BuildContext context) {
    final sliderProvider = Provider.of<HomeImgSliderProvider>(context);
    final images = sliderProvider.images;

    PageController pageController = PageController(
      viewportFraction: enlargeCenterPage ? 0.8 : 1.0,
    );

    if (autoPlay) {
      Future.delayed(autoPlayInterval, () {
        int nextPage = (sliderProvider.currentPage + 1) % images.length;
        if (pageController.hasClients) {
          pageController.animateToPage(nextPage,
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          sliderProvider.updatePage(nextPage);
        }
      });
    }

    return Column(
      children: [
        SizedBox(
          height: height,
          child: PageView.builder(
            itemCount: images.length,
            controller: pageController,
            onPageChanged: (index) {
              sliderProvider.updatePage(index);
            },
            itemBuilder: (context, index) {
              final image = images[index];
              return AnimatedContainer(
                height: 150,
                width: double.maxFinite,
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: isLocalAsset(image)
                        ? AssetImage(
                            image,
                          ) as ImageProvider
                        : NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return Container(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: sliderProvider.currentPage == index ? 12.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: sliderProvider.currentPage == index
                      ? AppColors.kBlackC
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
