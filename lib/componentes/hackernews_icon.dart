import 'package:flutter/material.dart';

class HackernewsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Center(
            child: Text(
              "H",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffFF6600),
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }
}
