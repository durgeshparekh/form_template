import 'package:flutter/material.dart';
import 'package:form_template/constants.dart';
import 'package:form_template/default_button.dart';
import 'package:get/get.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Review',
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
            Text(
              formData['companyName'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                'Financial Year: ${formData['financialYear']}',
              ),
            ),
            ListTile(
              title: Text('Annual Revenue: Rs. ${formData['annualRevenue']}'),
            ),
            const Spacer(),
            DefaultButton(
              text: 'Pay',
              press: () {
                Get.close(3);
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
