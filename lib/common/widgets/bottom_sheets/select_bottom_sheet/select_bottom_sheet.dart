import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reprocare/common/router/app_router.dart';
import 'package:reprocare/core/constants/application/application.dart';
import 'package:reprocare/core/constants/colors/app_dark_colors.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/constants/font_weight/app_font_weight.dart';
import 'package:reprocare/core/constants/theme/app_themes.dart';
import 'package:reprocare/core/extensions/sized_box/sized_box_extension.dart';
import 'package:reprocare/generated/assets.gen.dart';

class AppSelectBottomSheet {
  static show<T>({
    String? title,
    required List<T> items,
    T? selectedItem,
    required Function(T item) onChange,
    required String Function(T item) renderItemName,
  }) {
    showModalBottomSheet(
      context: Application.applicationContext,
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      constraints: BoxConstraints(maxHeight: 0.75.sh),
      isDismissible: true,
      backgroundColor: AppThemes.brightness == Brightness.light
          ? AppLightColors.white
          : AppDarkColors.secondaryDarkColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return _SelectWidget<T>(
          title: title,
          selectedItem: selectedItem,
          items: items,
          renderItemName: renderItemName,
          onChange: onChange,
        );
      },
    );
  }
}

class _SelectWidget<T> extends StatefulWidget {
  _SelectWidget({
    this.selectedItem,
    required this.onChange,
    required this.renderItemName,
    required this.items,
    this.title,
  });

  final T? selectedItem;
  final String? title;
  final List<T> items;
  final Function(T value) onChange;
  final String Function(T value) renderItemName;

  @override
  State<_SelectWidget<T>> createState() => _SelectWidgetState<T>();
}

class _SelectWidgetState<T> extends State<_SelectWidget<T>> {
  late ValueNotifier<T?> selectedItemNotifier;

  @override
  void initState() {
    super.initState();
    selectedItemNotifier = ValueNotifier<T?>(widget.selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedItemNotifier,
      builder: (context, value, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBottomSheetHeader(title: widget.title),
            5.h.sbxh,
            _buildList,
          ],
        );
      },
    );
  }

  Widget _buildBottomSheetHeader({
    final String? title,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: 15.h,
        right: 16.w,
        left: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppLightColors.strokeGrey,
              borderRadius: BorderRadius.circular(2),
            ),
            width: 28.w,
            height: 4.h,
          ),
          15.0.h.sbxh,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title != null
                  ? Assets.icons.bottomSheet.iconClose
                      .svg(color: Colors.transparent, height: 25.h)
                  : const SizedBox(),
              title != null
                  ? Text(
                      title,
                      style: AppThemes.currentTheme.textTheme.bodyMedium
                          ?.copyWith(fontWeight: AppFontWeight.medium.value),
                    )
                  : const SizedBox(),
              GestureDetector(
                onTap: () => AppRouter.pop(),
                child: Assets.icons.bottomSheet.iconClose.svg(
                  color: AppThemes.brightness == Brightness.light
                      ? AppLightColors.black
                      : null,
                  height: 25.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _buildList {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 8.h,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (context, index) => _buildItem(widget.items[index]),
        ),
      ),
    );
  }

  Widget _buildItem(T item) {
    return GestureDetector(
      onTap: () {
        selectedItemNotifier.value = item;
        widget.onChange(item);
        AppRouter.pop();
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.h),
        padding: EdgeInsets.only(left: 20.w),
        constraints: BoxConstraints(
          minHeight: 40.h,
        ),
        decoration: BoxDecoration(
          color: selectedItemNotifier.value == item
              ? AppThemes.brightness == Brightness.light
                  ? AppLightColors.pink100
                  : AppDarkColors.primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppThemes.brightness == Brightness.light
                ? AppLightColors.darkWhite
                : AppDarkColors.grey2,
            width: 1.5,
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.renderItemName(item),
            style: AppThemes.currentTheme.textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
