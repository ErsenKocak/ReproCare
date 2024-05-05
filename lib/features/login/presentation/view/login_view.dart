import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/widgets/app_bar/app_bar_widget.dart';
import 'package:reprocare/common/widgets/buttons/elevated_button/elevated_button.dart';
import 'package:reprocare/common/widgets/form_elements/info_item/form_info_item.dart';
import 'package:reprocare/common/widgets/scrollable_widgets/scrollable_body/scrollable_body.dart';
import 'package:reprocare/common/widgets/form_elements/text_form_field/app_text_form_field.dart';
import 'package:reprocare/core/enums/app_padding/app_padding.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/core/utils/formatter/text_input_formatter.dart';
import 'package:reprocare/core/utils/validator/text_input_validator/text_input_validator.dart';
import 'package:reprocare/features/login/presentation/mixin/login_view_mixin.dart';
import 'package:reprocare/generated/assets.gen.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      titleText: LocaleKeys.Global_LoginToReproCare.tr(),
    );
  }

  Widget get _buildBody {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
          padding: context.paddingVerticalHigh3,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              Column(
                children: [
                  _buildloginInfo,
                  20.h.sbxh,
                  _buildPhoneNumberInput,
                  20.h.sbxh,
                  _buildPasswordInput
                ],
              ),
              Spacer(flex: 2),
              _buildLoginButton
            ],
          )),
    );
  }

  Widget get _buildloginInfo {
    return FormInfoItem(
      infoText: LocaleKeys.Login_LoginInformation.tr(),
    );
  }

  Widget get _buildPhoneNumberInput {
    return Padding(
      padding: context.paddingHorizontalHigh2,
      child: AppTextFormField(
        hintText: '0 (5**) *** ** **',
        controller: phoneNumberTextController,
        keyboardType: TextInputType.phone,
        validator: (text) => AppTextInputFormatter.phoneNumberFormatter
            .getUnmaskedText()
            .minLenghtValidator(
                length: 10,
                customMessage: LocaleKeys.ErrorMessages_InvalidPhone.tr()),
        inputFormatters: [AppTextInputFormatter.phoneNumberFormatter],
      ),
    );
  }

  Widget get _buildPasswordInput {
    return Padding(
        padding: context.paddingHorizontalHigh2,
        child: ValueListenableBuilder(
          valueListenable: passwordObscureTextNotifer,
          builder: (context, value, child) {
            return AppTextFormField(
              hintText: LocaleKeys.Global_Password.tr(),
              controller: passwordTextController,
              keyboardType: TextInputType.text,
              suffixIcon:
                  _passwordSuffixIcon(onPress: () => changePasswordShowing()),
              obscureText: passwordObscureTextNotifer.value,
              validator: (text) => text?.emptyValidator(),
            );
          },
        ));
  }

  Widget get _buildLoginButton {
    return Padding(
      padding: context.paddingHorizontalHigh2,
      child: AppElevatedButton(
        buttonText: LocaleKeys.Global_Login.tr(),
        onPressed: () => validateInputs(),
      ),
    );
  }

  _passwordSuffixIcon({required Function onPress}) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: passwordObscureTextNotifer.value
          ? Assets.icons.inputs.iconEyeClose.svg()
          : Assets.icons.inputs.iconEye.svg(),
    );
  }
}
