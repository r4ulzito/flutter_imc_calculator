import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/bmi_form.dart';
import 'package:flutter_imc_calculator/bmi_result.dart';
import 'package:flutter_imc_calculator/gender_select.dart';

class HomePage extends StatelessWidget {
  final TextEditingController weightInputController = TextEditingController();
  final TextEditingController heightInputController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 54, right: 18, left: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "BMI Calculator",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                ),
                Icon(Icons.error)
              ],
            ),
          ),
          GenderSelect(),
          SizedBox(height: 32),
          BMIForm(
            heightInputController: heightInputController,
            weightInputController: weightInputController,
          ),
          BMIResult(
            callback: () {
              heightInputController.clear();
              weightInputController.clear();
            },
          )
        ]),
      ),
    );
  }
}
