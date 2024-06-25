import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/widgets/empty/empty_widget.dart';
import 'package:reprocare/common/widgets/refresh_indicator/app_refresh_indicator.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';
import 'package:reprocare/core/extensions/null_check/null_check_extension.dart';

class AppPaginationWidget<ItemType> extends StatefulWidget {
  AppPaginationWidget({
    super.key,
    required this.pagingController,
    required this.getItemsFunction,
    required this.paginationRequest,
    required this.itemBuilder,
    this.useWidgetRefreshIndicator = true,
    this.loadingWidget,
    this.emptyWidget,
    this.scrollDirection,
    this.onRefresh,
  });

  final PagingController<int, ItemType> pagingController;
  PaginationRequestParam paginationRequest;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, ItemType item, int index)
      itemBuilder;
  final Future<Result<List<ItemType>, AppException>> Function(
      PaginationRequestParam paginationRequest) getItemsFunction;
  final Axis? scrollDirection;
  final bool? useWidgetRefreshIndicator;
  final Function()? onRefresh;

  @override
  State<AppPaginationWidget<ItemType>> createState() =>
      _AppPaginationWidgetState<ItemType>();
}

class _AppPaginationWidgetState<ItemType>
    extends State<AppPaginationWidget<ItemType>>
    with AutomaticKeepAliveClientMixin {
  List<ItemType> items = [];

  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      log('PagingController -- addPageRequestListener -- pageKey -- $pageKey');
      widget.paginationRequest =
          widget.paginationRequest.copyWith(page: pageKey);
      _getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildBody;
  }

  Widget get _buildBody {
    if (widget.useWidgetRefreshIndicator == true) {
      return _buildRefreshIndicator;
    } else {
      return _buildPagination;
    }
  }

  Widget get _buildRefreshIndicator {
    return AppRefreshIndicator(
      onRefresh: () async {
        if (widget.onRefresh.isNotNull) {
          widget.onRefresh!();
        }
        widget.paginationRequest = widget.paginationRequest.copyWith(page: 1);

        await Future.delayed(
          Duration(milliseconds: 300),
          () {
            widget.pagingController.refresh();
          },
        );
      },
      child: _buildPagination,
    );
  }

  Widget get _buildPagination {
    return PagedListView(
      pagingController: widget.pagingController,
      scrollDirection: widget.scrollDirection ?? Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      builderDelegate: PagedChildBuilderDelegate<ItemType>(
        firstPageProgressIndicatorBuilder: _buildLoadingWidget,
        firstPageErrorIndicatorBuilder: _buildEmptyWidget,
        noItemsFoundIndicatorBuilder: _buildEmptyWidget,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }

  Future<void> _getItems() async {
    final response = await widget.getItemsFunction(widget.paginationRequest);

    final value = switch (response) {
      Success(value: final List<ItemType> _itemsResponse) => {
          items = _itemsResponse,
          if (checkLastPage(items))
            {
              _appendLastPage(items),
            }
          else
            {
              _appendPage(items),
            },
        },
      Failure(exception: final AppException exception) => {},
    };
  }

  void _appendPage(List<ItemType> items) {
    log('PagingController -- _appendPage -- nextPageKey  -- ${widget.pagingController.nextPageKey}');
    widget.pagingController
        .appendPage(items, widget.paginationRequest.page + 1);
  }

  void _appendLastPage(List<ItemType> items) {
    widget.pagingController.appendLastPage(
      items,
    );
  }

  bool checkLastPage(List<ItemType> items) {
    return items.length < widget.paginationRequest.size;
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return widget.loadingWidget ??
        const Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: AppLightColors.primaryColor,
              strokeWidth: 2,
            ),
          ),
        );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return widget.emptyWidget ?? const SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}
