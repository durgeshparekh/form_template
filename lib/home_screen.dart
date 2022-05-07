import 'package:flutter/material.dart';
import 'package:form_template/constants.dart';
import 'package:form_template/default_button.dart';
import 'package:form_template/views/screen1.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Form',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Company Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            const Text('Company Description, company started in 2017'),
            const Expanded(
              flex: 2,
              child: Icon(
                Icons.work,
                color: kPrimaryColor,
                size: 30,
              ),
            ),
            const Spacer(),
            DefaultButton(
              text: 'Continue',
              press: () {
                Get.to(() => const Screen1());
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
