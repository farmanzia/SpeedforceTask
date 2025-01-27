import 'package:flutter/material.dart';
import 'package:speedforcetest/utils/app_color.dart';

class   AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final bool enable;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  String? Function(String?)? validator;
   AppTextFormField({super.key,required this.controller,required this.hintText,this.obscureText=false,this.enable=true,this.suffixIcon,this.prefixIcon,required this.validator});
  @override
  State<  AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<  AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText:widget.obscureText,
      validator:widget.validator,
      enabled: widget.enable,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 22),
        filled: true,
        fillColor:AppColor.kLightWhite ,
        border: InputBorder.none,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16.0,
        ),
        prefixIcon:widget.prefixIcon,
        suffixIcon:widget.suffixIcon,

      ),
    );
  }
}
