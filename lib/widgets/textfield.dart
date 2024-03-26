import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom(
      {super.key,
      this.hintText,
      this.enabled,
      this.suffixIcon,
      this.controller,
      this.validator,
      this.obscuretext,
      this.keyboardtype});
  final String? hintText;
  final bool? enabled;
  final bool? obscuretext;
  final TextInputType? keyboardtype;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.025),
      child: Container(
        height: height * 0.07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.22),
              blurRadius: 8, // changes position of shadow
            ),
          ],
        ),
        child: TextFormField(
          validator: validator,
          obscureText: obscuretext ?? false,
          keyboardType: keyboardtype,
          enabled: enabled ?? true,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
      ),
    );
  }
}
