import 'package:flutter/material.dart';

import '../../../../utils/paths/img_paths.dart';
import '../services_list_screen.dart';

class CatGridViewBuilder extends StatelessWidget {
  final void Function()? onTap;
  const CatGridViewBuilder({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      AppImages.homeCleanImg,
      AppImages.homeAcImg,
      AppImages.homeSolarImg,
      AppImages.homePaintmg,
      AppImages.homeElecImg,
      AppImages.homePlumberImg,
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: onTap ??
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServicesListScreen(),
                  ),
                );
              },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(40),
                  blurRadius: 6,
                  offset: Offset(0, 1),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(imageList[index]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
