import 'package:logger/logger.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reprocare/common/base/cubit/base_state.dart';
import 'package:reprocare/common/logger/app_logger.dart';
import 'package:reprocare/common/widgets/bottom_sheets/bottom_sheet/app_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/error_bottom_sheet/error_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/success_bottom_sheet/success_bottom_sheet.dart';
import 'package:reprocare/common/widgets/bottom_sheets/warning_bottom_sheet/warning_bottom_sheet.dart';

mixin BaseCubit<S extends BaseState> on Cubit<S> {
  bool isLoading = false;

  changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> initialize();

  Future<void> dispose() async {
    await close();
  }

  safeEmit(S state) {
    if (!isClosed) {
      emit(state);
    } else {
      AppLogger.call(
        logLevel: Level.error,
        title: 'State is Closed!',
        value: state.toString(),
      );
    }
  }

  showSuccessBottomSheet({
    String? headerMessage,
    String? bodyMessage,
    Function()? onLaterPop,
    bool? isViewPop = false,
  }) {
    AppBottomSheet.show(
      child: (bottomSheetContext) => SuccessBottomSheetWidget(
        headerMessage: headerMessage,
        bodyMessage: bodyMessage,
        onLaterPop: onLaterPop,
        isViewPop: isViewPop,
      ),
    );
  }

  showWarningBottomSheet({
    String? headerMessage,
    String? bodyMessage,
    Function()? onLaterPop,
  }) {
    AppBottomSheet.show(
      child: (bottomSheetContext) => WarningBottomSheetWidget(
        headerMessage: headerMessage,
        bodyMessage: bodyMessage,
      ),
    );
  }

  showErrorBottomSheet({
    required String exceptionMessage,
    String? bodyMessage,
  }) {
    AppBottomSheet.show(
      child: (bottomSheetContext) => ErrorBottomSheet(
        headerMessage: exceptionMessage,
        bodyMessage: bodyMessage,
      ),
    );
  }
}
