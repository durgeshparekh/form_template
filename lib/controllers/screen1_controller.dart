import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Screen1Controller extends GetxController {
  TextEditingController companyNameController = TextEditingController();
  TextEditingController revenueController = TextEditingController();
  List<String> errors = <String>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    companyNameController.clear();
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
