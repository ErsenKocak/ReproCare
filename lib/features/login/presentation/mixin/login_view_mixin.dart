import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reprocare/common/init/service_locator/service_locator_provider.dart';
import 'package:reprocare/common/widgets/app_loading/app_loading.dart';
import 'package:reprocare/core/utils/formatter/text_input_formatter.dart';
import 'package:reprocare/features/login/domain/entities/request/login_request_param/login_request_param.dart';
import 'package:reprocare/features/login/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:reprocare/features/login/presentation/view/login_view.dart';

mixin LoginViewMixin on State<LoginView> {
  late GlobalKey<FormState> formKey;
  late ValueNotifier<bool> passwordObscureTextNotifer;
  late TextEditingController phoneNumberTextController;
  late TextEditingController passwordTextController;
  late AuthCubit authCubit;

  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  Future<void> initializeMixin() async {
    formKey = GlobalKey<FormState>();
    phoneNumberTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordObscureTextNotifer = ValueNotifier<bool>(true);
    authCubit = ServiceLocatorProvider.provide<AuthCubit>();
  }

  blocStateListener(BuildContext context, AuthState state) {
    if (state == AuthState.loading()) {
      AppLoading.showLoading();
    } else {
      AppLoading.dismissLoading();
    }
  }

  bool validateInputs() {
    bool isValid = formKey.currentState?.validate() ?? false;
    log('validateInputs -- $isValid');
    log(AppTextInputFormatter.phoneNumberFormatter.getUnmaskedText());

    return isValid;
  }

  void changePasswordShowing() {
    passwordObscureTextNotifer.value = !passwordObscureTextNotifer.value;
  }

  Future<void> login() async {
    await authCubit.login(LoginRequestParam(
        phoneNumber:
            '0${AppTextInputFormatter.phoneNumberFormatter.getUnmaskedText()}',
        password: passwordTextController.text));
  }
}
