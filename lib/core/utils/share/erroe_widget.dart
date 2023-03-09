import 'package:flutter/material.dart';


class ErrorGetDataWidget extends StatelessWidget {
  final String text;
  const ErrorGetDataWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text,style: const TextStyle(
        color: Colors.red
    ),));
  }
}
