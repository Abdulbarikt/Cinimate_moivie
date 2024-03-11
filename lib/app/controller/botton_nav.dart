
import 'package:get/get.dart';

class BottomNavBarCntrl extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
