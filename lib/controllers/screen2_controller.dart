import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2Controller extends GetxController {
  TextEditingController revenueController = TextEditingController();
  List<String> errors = <String>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    revenueController.clear();
    errors.clear();
  }

  addError({required String error}) {
    if (!errors.contains(error)) {
      errors.add(error);
      notifyChildrens();
    }
  }

  removeError({required String error}) {
    if (errors.contains(error)) {
      errors.remove(error);
      notifyChildrens();
    }
  }

  String errorValue = '';
}
