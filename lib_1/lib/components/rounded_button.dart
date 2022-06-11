import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.color, required this.textLabel, required this.id});
  final Color color;
  final String textLabel;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            if (id != 'none') {
              Navigator.pushNamed(context, id);
            }
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            textLabel,
          ),
        ),
      ),
    );
  }
}
