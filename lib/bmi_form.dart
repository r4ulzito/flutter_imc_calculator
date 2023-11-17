import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_imc_calculator/bmi_controller.dart';

class BMIForm extends StatefulWidget {
  const BMIForm(
      {super.key,
      required this.weightInputController,
      required this.heightInputController});

  final TextEditingController weightInputController;
  final TextEditingController heightInputController;

  @override
  State<BMIForm> createState() => _BMIFormState(
      heightInputController: heightInputController,
      weightInputController: weightInputController);
}

class _BMIFormState extends State<BMIForm> {
  _BMIFormState(
      {required this.weightInputController,
      required this.heightInputController});

  final TextEditingController weightInputController;
  final TextEditingController heightInputController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your weight",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 2),
                Text(
                  "(kg)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: "0",
                    hintStyle: TextStyle(fontSize: 28),
                    counterText: ""),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
                controller: weightInputController,
                onChanged: (value) {
                  setState(() {
                    BMIController.instance
                        .setWeight(value == "" ? 0 : int.parse(value));
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(width: 68),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your height",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 2),
                Text(
                  "(cm)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              width: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3)
                ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintText: "0",
                    hintStyle: TextStyle(fontSize: 28),
                    counterText: ""),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
                controller: heightInputController,
                onChanged: (value) {
                  setState(() {
                    BMIController.instance
                        .setHeight(value == "" ? 0 : int.parse(value));
                  });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
