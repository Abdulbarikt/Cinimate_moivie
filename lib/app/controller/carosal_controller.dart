import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselCntrl extends GetxController {
  var currentIndex = 0.obs;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }
}
