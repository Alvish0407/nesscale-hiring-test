import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../utils/design_utils.dart';

class KeyValue extends StatelessWidget {
  final String key1;
  final String? value;
  const KeyValue(
    this.key1,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            '$key1:',
            style: TextThemeX.text14.copyWith(
              color: lPrimaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 9,
          child: Text(
            value ?? '-',
            textAlign: TextAlign.end,
            style: TextThemeX.text14.copyWith(
              color: lPrimaryTextColor,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ).symmentric(h: 15);
  }
}
