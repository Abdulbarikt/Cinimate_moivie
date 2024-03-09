import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class PassField extends StatefulWidget {
  final double width, height;
  final TextEditingController controller;
  final BorderRadiusGeometry borderRadius;

  const PassField({
    super.key,
    required this.height,
    required this.controller,
    required this.width,
    required this.borderRadius,
  });

  @override
  _PassFieldState createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool _obscureText = true; 
  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.grey),
    );

    return TextFormField(
      obscureText: _obscureText, // Set obscureText to true
      controller: widget.controller,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.kWhite,
      ).copyWith(
        color: AppColors.kGrayscaleDark100,
      ),
      decoration: InputDecoration(
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: AppColors.kGrayscaleDark100,
            size: 17,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ).copyWith(
          color: AppColors.kGrayscale40,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        enabledBorder: border,
        focusedBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
    );
  }
}
