// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class InfoTextAboutWidget extends StatelessWidget {
  const InfoTextAboutWidget({required this.primaryText, required this.secondaryText, super.key});
  final String primaryText;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          primaryText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        context.sized.emptySizedHeightBoxLow,
        Text(
          secondaryText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(),
        ),
      ],
    );
  }
}
