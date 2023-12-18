// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:tubitak_2/product/utility/constants/color_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.buttonText, super.key, required this.buttonFunction});
  final String buttonText;
  final void Function() buttonFunction;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryColor,
        ),
        onPressed: buttonFunction,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorConstants.white),
        ),
      ),
    );
  }
}
