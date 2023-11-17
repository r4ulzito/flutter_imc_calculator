import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  const GenderSelect({super.key});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  String selectGender = "male";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18, left: 18, top: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Opacity(
              opacity: selectGender == "male" ? 1 : 0.3,
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/avatar/male_avatar.png",
                    ),
                  ),
                  SizedBox(height: 8),
                  Text("Male",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            ),
            onTap: () {
              setState(() {
                selectGender = "male";
              });
            },
          ),
          SizedBox(
            width: 68,
          ),
          GestureDetector(
            child: Opacity(
              opacity: selectGender == "female" ? 1 : 0.3,
              child: Column(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset("assets/avatar/female_avatar.png"),
                  ),
                  SizedBox(height: 8),
                  Text("Female", style: TextStyle(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            onTap: () {
              setState(() {
                selectGender = "female";
              });
            },
          )
        ],
      ),
    );
  }
}
