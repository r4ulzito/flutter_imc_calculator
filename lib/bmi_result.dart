import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/bmi_controller.dart';

class BMIResult extends StatefulWidget {
  const BMIResult({super.key, required this.callback});

  final VoidCallback callback;

  @override
  State<BMIResult> createState() => _BMIResultState(callback: callback);
}

class _BMIResultState extends State<BMIResult> {
  bool showResult = false;

  final VoidCallback callback;

  _BMIResultState({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: showResult ? 22 : 52),
        Center(
          child: showResult
              ? Column(
                  children: [
                    Text(
                      "Your BMI",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      BMIController.instance.getBMI(),
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 34),
                    ),
                    SizedBox(height: 4),
                    Text(BMIController.instance.getCategorie(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 16),
                    GestureDetector(
                      child: Text(
                        "Calculate BMI again",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        setState(() {
                          callback();
                          showResult = false;
                        });
                      },
                    )
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    if (BMIController.instance.validaFormulario()) {
                      _showAlertDialog();
                      return;
                    } else {
                      setState(() {
                        BMIController.instance.calculaBMI();
                        showResult = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 16, left: 74, right: 74),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Calculate your BMI",
                    textAlign: TextAlign.center,
                  )),
        ),
      ],
    );
  }

  void _showAlertDialog() {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Preencha os campos!"),
      content: Text("Existem campos vazios!"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
