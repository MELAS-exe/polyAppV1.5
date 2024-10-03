import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polyapp/util/constante.dart';

class RectangleNumber extends StatefulWidget {
  TextEditingController? controller;
  RectangleNumber({super.key, this.controller});

  @override
  State<RectangleNumber> createState() => _RectangleNumberState();
}

class _RectangleNumberState extends State<RectangleNumber> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 40,
      color: eptLightOrange,
      child: TextField(
        expands: true,
        maxLines: null,
        style: const TextStyle(
          color: eptOrange,
        ),
        textAlign: TextAlign.center,
        controller: widget.controller,
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          isDense: true,
            border: OutlineInputBorder(
          borderSide: BorderSide.none,
        )),
      ),
    );
  }
}
