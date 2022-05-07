import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_template/controllers/screen1_controller.dart';
import 'package:form_template/form_error.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../custom_suffix_icon.dart';
import '../size_config.dart';
import 'screen2.dart';

final _formKey = GlobalKey<FormState>();
final screen1Controller = Get.put(Screen1Controller());

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Company Analysis',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: SizedBox(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Expanded(
                child: ListTile(
                  title: Text(
                    'Company Details',
                    style: TextStyle(
                      fontSize: 20,
                      wordSpacing: 0.1,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildCompanyNameFormField(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: buildRevenueFormField(),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Obx(
                () => screen1Controller.errors.isNotEmpty
                    ? const FormError(screenType: "screen1")
                    : const SizedBox(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    leading: const SizedBox(),
                    title: const Text(
                      '1 / 2',
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // if all are valid then go to next screen
                          formData['companyName'] = screen1Controller
                              .companyNameController.text
                              .toString();
                          formData['annualRevenue'] = screen1Controller
                              .revenueController.text
                              .toString();
                          Get.to(() => const Screen2());
                        }
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    // title: Text('hello'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildCompanyNameFormField() {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: 100,
      controller: screen1Controller.companyNameController,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) =>
          screen1Controller.companyNameController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          screen1Controller.removeError(error: kCompanyNameNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          screen1Controller.addError(error: kCompanyNameNullError);
          return '';
        }
        return null;
      },
      autofocus: false,
      decoration: const InputDecoration(
        labelText: 'Company Name',
        hintText: 'Enter your company name',
        counterText: '',
        floatingLabelStyle: TextStyle(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(iconData: Icons.work),
      ),
    );
  }

  TextFormField buildRevenueFormField() {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: 10,
      controller: screen1Controller.revenueController,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      autofocus: false,
      onSaved: (newValue) =>
          screen1Controller.revenueController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          screen1Controller.removeError(error: kAnnualRevenueNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          screen1Controller.addError(error: kAnnualRevenueNullError);
          return '';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Annual Revenue(In Rs.)',
        hintText: 'Enter annual revenue',
        counterText: '',
        floatingLabelStyle: TextStyle(color: kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(iconData: Icons.money),
      ),
    );
  }
}
