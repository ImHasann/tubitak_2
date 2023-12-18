// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ModernTextField extends StatelessWidget {
  const ModernTextField({required this.hintText, required this.prefixIcon, super.key});
  final String hintText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: context.border.lowBorderRadius),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        prefixIcon: const Icon(Icons.mail_outline_outlined),
      ),
    );
  }
}
