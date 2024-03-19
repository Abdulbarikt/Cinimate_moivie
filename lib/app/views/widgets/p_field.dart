import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PField extends StatelessWidget {
  const PField({
    Key? key,
    this.keyboardType,
    required this.controller,
    this.width,
    this.height,
    this.hintTextColor,
    this.onChanged,
    this.onTapOutside,
    this.prefixIcon,
    this.prefixIconColor,
    this.inputFormatters,
    this.maxLines,
    this.hintText,
    this.validator,
    required this.obsecure, // Added validator parameter
  }) : super(key: key);

  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double? width, height;
  final TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none);

    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 195, 189, 189),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: hintTextColor ?? const Color.fromARGB(255, 14, 14, 14),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onTapOutside: onTapOutside,
      validator: validator, // Assigning the validator function
    );
  }
}
