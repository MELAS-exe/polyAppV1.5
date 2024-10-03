import "package:flutter/material.dart";
import "package:polyapp/util/constante.dart";

class Login_TextField extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController? controller;
  final String name;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  TextInputType? inputType;

  Login_TextField(
      {super.key,
      this.validator,
      this.controller,
      required this.name,
      this.obscureText = false,
      this.textCapitalization = TextCapitalization.none,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1)),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Center(
        child: TextFormField(
          validator: validator,
          enabled: true,
          controller: controller,
          textCapitalization: textCapitalization,
          maxLength: 32,
          maxLines: 1,
          obscureText: obscureText,
          keyboardType: inputType,
          textAlign: TextAlign.start,
          style: const TextStyle(
              color: Colors.black, fontSize: 13, fontFamily: "Inter"),
          decoration: InputDecoration(
            focusColor: eptDarkGrey,
            isDense: true,
            hintText: name,
            hintStyle: const TextStyle(color: eptDarkGrey),
            counterText: "",
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 100, 99, 99)),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
