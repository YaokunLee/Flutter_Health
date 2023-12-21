import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class AppUtil {
  static List games = [];

  static getTo(Widget widget) {
    Get.to(widget, transition: Transition.cupertino);
  }

  static replace(Widget widget) {
    Get.offAll(widget);
  }

  static back() {
    Get.back();
  }

  static copy(String data) {
    if (data != '') {
      Clipboard.setData(ClipboardData(text: data));
    }
    EasyLoading.showSuccess("复制成功");
  }
}
