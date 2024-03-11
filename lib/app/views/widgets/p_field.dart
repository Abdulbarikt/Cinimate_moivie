import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PField extends StatelessWidget {
  const PField({
    super.key,
    this.keyboardType,
    required this.controller,
    required this.width,
    required this.height,
    this.hintTextColor,
    this.onChanged,
    this.onTapOutside,
    this.prefixIcon,
    this.prefixIconColor,
    this.inputFormatters,
    this.maxLines,
    this.hintText, // Make hintText optional
  });

  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Function(PointerDownEvent)? onTapOutside;
  final Function(String)? onChanged;
  final double width, height;
  final TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? hintText; // Make hintText optional

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    );

    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: hintTextColor ?? Colors.white,
        ),
        hintText: hintText, // Use provided hintText if available
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
    );
  }
}
