import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CHeader extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final List<Widget>? actions;
  const CHeader({Key? key, this.text, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          text ?? '',
          style: TextThemeX.text20.copyWith(color: pureWhiteColor),
        ),
        elevation: 0,
        centerTitle: true,
        actions: actions,
        backgroundColor: lPrimaryColor,
        leading: (navigator?.canPop() ?? false)
            ? CCoreButton(
                onPressed: () => Get.back(),
                child: const Icon(
                  CupertinoIcons.chevron_left,
                  color: pureWhiteColor,
                ),
              )
            : const SizedBox(width: 20));
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55);
}
