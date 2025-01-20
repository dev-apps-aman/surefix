import 'package:flutter/material.dart';
import 'package:surefix/utils/paths/img_paths.dart';

class HomeImgSliderProvider with ChangeNotifier {
  int currentPage = 0;

  List<String> images = [
    AppImages.homeSliderImg,
    AppImages.homeSliderImg,
    AppImages.homeSliderImg,
    AppImages.homeSliderImg,
  ];

  void updatePage(int page) {
    currentPage = page;
    notifyListeners();
  }

  void addImage(String image) {
    images.add(image);
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < images.length) {
      images.removeAt(index);
      notifyListeners();
    }
  }
}
