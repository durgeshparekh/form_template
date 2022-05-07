import 'package:flutter/material.dart';
import 'package:form_template/controllers/screen2_controller.dart';
import 'package:get/get.dart';

import 'controllers/screen1_controller.dart';
import 'size_config.dart';

class FormError extends StatelessWidget {
  final String screenType;

  const FormError({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (screenType == 'screen1') {
      return GetX<Screen1Controller>(builder: (controller) {
        return Column(
          children: List.generate(controller.errors.length,
              (index) => formErrorText(error: controller.errors[index])),
        );
      });
    } else {
      return GetX<Screen2Controller>(builder: (controller) {
        return Column(
          children: List.generate(controller.errors.length,
              (index) => formErrorText(error: controller.errors[index])),
        );
      });
    }
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Icon(
          Icons.cancel,
          size: getProportionateScreenWidth(14),
          color: Colors.red,
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Expanded(
          child: Text(
            error,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
