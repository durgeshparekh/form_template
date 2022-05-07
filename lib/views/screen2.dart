import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_template/constants.dart';
import 'package:form_template/controllers/screen2_controller.dart';
import 'package:form_template/custom_suffix_icon.dart';
import 'package:get/get.dart';

import '../form_error.dart';
import '../size_config.dart';
import 'screen3.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>();
  var screen2Controller = Get.put(Screen2Controller());
  List<DropdownMenuItem<String>> _dropdownMenuItems = [];
  String? selectedItem;
  final List<String> _dropdownItems = [
    '2018-19',
    '2019-20',
    '2020-21',
    '2021-22'
  ];

  @override
  Widget build(BuildContext context) {
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    if (_dropdownMenuItems.isNotEmpty) {
      selectedItem = _dropdownMenuItems[0].value;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Company Analysis',
          style: TextStyle(color: kPrimaryColor),
        ),
        leading: const SizedBox(),
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
              ListTile(
                title: const Text(
                  'Select Financial Year',
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 0.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                trailing: DropdownButton<String>(
                  value: selectedItem,
                  items: _dropdownMenuItems,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: buildRevenueFormField(),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              const FormError(screenType: "screen2"),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.navigate_before,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    title: const Text(
                      '2 / 2',
                      textAlign: TextAlign.center,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // if all are valid then go to next screen
                          formData['financialYear'] = selectedItem;
                          formData['annualRevenue1'] = screen2Controller
                              .revenueController.text
                              .toString();
                          Get.to(() => const Screen3());
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

  TextFormField buildRevenueFormField() {
    return TextFormField(
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      maxLength: 10,
      controller: screen2Controller.revenueController,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      onSaved: (newValue) =>
          screen2Controller.revenueController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          screen2Controller.removeError(error: kAnnualRevenueNullError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          screen2Controller.addError(error: kAnnualRevenueNullError);
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

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<String>> items = [];
    for (String listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(listItem),
          ),
          value: listItem,
        ),
      );
    }
    return items;
  }
}
