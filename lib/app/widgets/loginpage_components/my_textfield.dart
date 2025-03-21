import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive padding
    final textFieldPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.06,
    ); // 6% of screen width

    // Responsive font size
    final hintTextSize = screenWidth * 0.04; // 4% of screen width

    // Responsive icon size
    final iconSize = screenWidth * 0.06; // 6% of screen width

    return Padding(
      padding: textFieldPadding,
      child: TextField(
        style: GoogleFonts.acme(color: Colors.black, fontSize: 15),
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: GoogleFonts.acme(
            color: Colors.grey[500],
            fontSize: hintTextSize,
          ),
          suffixIcon:
              widget.obscureText
                  ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                      size: iconSize,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                  : null, // No icon for non-password fields
        ),
      ),
    );
  }
}
