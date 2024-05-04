import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/buttons/text_button/text_button.dart';
import 'package:reprocare/common/widgets/switch/app_switch.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';

class AppSwitchWithText extends StatelessWidget {
  final bool isChecked;
  final String? buttonText;
  final String? text;
  final Function()? onTapText;
  final Function() onTapSwitch;
  const AppSwitchWithText({
    super.key,
    required this.isChecked,
    this.buttonText,
    this.text,
    this.onTapText,
    required this.onTapSwitch,
  });

  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppSwitch(
          isChecked: isChecked,
          onChanged: onTapSwitch,
        ),
        8.0.w.sbxw,
        Expanded(
          child: AppTextButton(
            buttonText: buttonText ?? '',
            text: text ?? '',
            onTap: onTapText ?? () {},
          ),
        ),
      ],
    );
  }
}
