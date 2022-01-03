
import 'package:get/get.dart';

import '../../controller.dart';


class P {

  static initialize() {

    Get.put(RequestController());
  }

  static RequestController get request => Get.find();
}