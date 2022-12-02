import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_text_theme.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_constants.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';

class CHeader extends StatelessWidget {
  final String? text;
  final Widget? child;
  const CHeader({Key? key, this.text, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: lPrimaryColor,
      padding: EdgeInsets.only(top: context.statusBarHeight),
      child: child ??
          Row(
            children: [
              if (navigator?.canPop() ?? false) ...[
                CCoreButton(
                  onPressed: () => Get.back(),
                  child: const Icon(
                    CupertinoIcons.chevron_left_circle,
                    color: pureWhiteColor,
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Text(
                text ?? '',
                style: TextThemeX.text20.copyWith(color: pureWhiteColor),
              ),
            ],
          ).symmentric(h: horizontalPadding),
    );
  }
}
