
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reprocare/common/base/model/request/pagination_request_param/pagination_request_param.dart';
import 'package:reprocare/common/base/result/base_result.dart';
import 'package:reprocare/common/widgets/empty/empty_widget.dart';
import 'package:reprocare/common/widgets/refresh_indicator/app_refresh_indicator.dart';
import 'package:reprocare/core/constants/colors/app_light_colors.dart';

class AppPagination<ItemType> extends StatefulWidget {
  AppPagination({
    super.key,
    required this.pagingController,
    required this.getItemsFunction,
    required this.paginationRequest,
    required this.itemBuilder,
    // required this.items,
    this.loadingWidget,
    this.emptyWidget,
  });

  final PagingController<int, ItemType> pagingController;

  PaginationRequestParam paginationRequest;
  final Widget? loadingWidget;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, ItemType item, int index)
      itemBuilder;
  final Future<Result<List<ItemType>, AppException>> Function(
      PaginationRequestParam paginationRequest) getItemsFunction;

  @override
  State<AppPagination<ItemType>> createState() =>
      _AppPaginationState<ItemType>();
}

class _AppPaginationState<ItemType> extends State<AppPagination<ItemType>> {
  List<ItemType> items = [];

  @override
  void initState() {
    super.initState();
    widget.pagingController.addPageRequestListener((pageKey) {
      _getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      onRefresh: () async {
        widget.paginationRequest = widget.paginationRequest.copyWith(page: 0);
        widget.pagingController.refresh();
      },
      child: PagedListView(
        pagingController: widget.pagingController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        builderDelegate: PagedChildBuilderDelegate<ItemType>(
          firstPageProgressIndicatorBuilder: _buildLoadingWidget,
          firstPageErrorIndicatorBuilder: _buildEmptyWidget,
          noItemsFoundIndicatorBuilder: _buildEmptyWidget,
          itemBuilder: widget.itemBuilder,
        ),
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
    widget.paginationRequest = widget.paginationRequest
        .copyWith(page: widget.paginationRequest.page + 1);
    widget.pagingController.appendPage(items, widget.paginationRequest.page);
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
    return widget.emptyWidget ?? AppEmptyWidget();
  }
}
