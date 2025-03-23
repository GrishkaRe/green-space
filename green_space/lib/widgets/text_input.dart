import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String placeholder;
  final double borderRadius;

  const TextInput({
    super.key,
    required this.placeholder,
    required this.borderRadius,
    });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 12,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}