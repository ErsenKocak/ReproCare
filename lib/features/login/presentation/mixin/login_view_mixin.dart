import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/common/router/app_routes.dart';
import 'package:reprocare/core/utils/formatter/text_input_formatter.dart';
import 'package:reprocare/core/utils/validator/text_input_validator/text_input_validator.dart';
import 'package:reprocare/features/login/presentation/view/login_view.dart';
import 'package:reprocare/generated/locale_keys.g.dart';

mixin LoginViewMixin on State<LoginView> {
  late GlobalKey<FormState> formKey;
  late TextEditingController phoneNumberTextController;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    formKey = GlobalKey<FormState>();
    phoneNumberTextController = TextEditingController();
  }

  bool validateInputs() {
    bool isValid = formKey.currentState?.validate() ?? false;
    log('validateInputs -- $isValid');
    log(AppTextInputFormatter.phoneNumberFormatter.getUnmaskedText());
    AppRouter.goNamed(AppRoutes.Notification.path);
    return isValid;
  }
}
