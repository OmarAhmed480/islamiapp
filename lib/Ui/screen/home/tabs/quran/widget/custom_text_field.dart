
import 'package:flutter/material.dart';



typedef Validation = void Function(String)?;
typedef Validator = String? Function(String?)?;

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.filled,
    this.labelStyle,
    this.labelText,
    this.borderSideColor,
    this.maxLines,
    this.controller,
    this.validator,
    this.onChanged,
    this.obscureText= false,
    this.obscuringCharacter="●",
    this.radius,this.boxShadow,
    this.borderSideWidth,
    this.keyboardType,
    this.textStyle,
  });
  double ?borderSideWidth;
  Color? fillColor;
  Color? borderSideColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;
  bool? filled;
  String? labelText;
  TextStyle? labelStyle;
  int? maxLines;
  TextEditingController? controller;
  Validation onChanged;
  Validator? validator;
  bool obscureText;
  String obscuringCharacter;
  double ?radius;
  List<BoxShadow>? boxShadow;
  TextInputType?keyboardType;
  TextStyle ?textStyle;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius??16),
         boxShadow:widget.boxShadow  ),
      child: TextFormField(
        style: widget.textStyle,
        keyboardType:widget.keyboardType,
        obscuringCharacter:widget.obscuringCharacter,
        obscureText: widget.obscureText ,
        validator: widget.validator,
        onChanged: widget.onChanged,
        controller: widget.controller,
        maxLines: widget.maxLines ?? 1,
        decoration: InputDecoration(
          enabledBorder: builtBorderDecoration(
            borderSideWidth: widget.borderSideWidth??1 ,
            radius:widget.radius??16,
            borderColor: widget.borderSideColor ?? Colors.transparent,
          ),
          focusedBorder: builtBorderDecoration(
            borderSideWidth: widget.borderSideWidth??1 ,
            radius:widget.radius??16,
            borderColor: widget.borderSideColor ?? Colors.transparent,
          ),
          errorBorder: builtBorderDecoration(
              borderSideWidth: widget.borderSideWidth??1 ,
              radius:widget.radius??16,
              borderColor: Colors.red),
          focusedErrorBorder: builtBorderDecoration(
            borderSideWidth: widget.borderSideWidth??1 ,
            radius:widget.radius??16,
            borderColor: Colors.red,
          ),
          filled: widget.filled,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
        ),
      ) ,);

  }

  OutlineInputBorder builtBorderDecoration({
    double borderSideWidth=1,
    double radius=16,
    Color borderColor = Colors.transparent,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(width:borderSideWidth, color: borderColor),
    );
  }
}
// final _formKey = GlobalKey<FormState>();