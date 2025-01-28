import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int? maxLines;
  final InputBorder? border;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
    this.border,
    this.onChanged,
    this.onSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText;
  }

  void toggleObscureText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: toggleObscureText,
        )
            : null,
        border: widget.border ?? const OutlineInputBorder(),
      ),
    );
  }
}
