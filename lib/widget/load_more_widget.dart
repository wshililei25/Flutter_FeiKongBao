import 'package:flutter/material.dart';
import 'package:fkb3_flutter/dialog/loading_dialog.dart';
import 'package:fkb3_flutter/utils/custom_widget.dart';
import 'package:fkb3_flutter/generated/i18n.dart';
import 'package:fkb3_flutter/utils/constant.dart';

typedef Future<List> OnLoadData(int targetPage, int targetPageSize);
typedef ItemBuilder = Widget Function(
    BuildContext context, int index, dynamic itemData);

class LoadMoreWidget extends StatefulWidget {
  final ItemBuilder itemBuilder;
  final OnLoadData onRefresh;
  final ScrollController controller;
  final OnLoadData onLoadMore;
  final int pageSize;

  LoadMoreWidget(
      {Key key,
      @required this.itemBuilder,
      this.onRefresh,
      this.onLoadMore,
      this.pageSize = 20,
      @required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadMoreState();
}

class LoadMoreState extends State<LoadMoreWidget> {
  int _currentPage = 1;
  ScrollController _scrollController;
  RefreshCallback _refreshCallback;
  final _idle = 0;
  final _refreshing = 1;
  final _loadingMore = 2;
  Future _refreshDataFuture;
  bool _firstLoad = true;
  bool _hasMore = false;
  var _status = 0;

  List _dataList = [];

  @override
  void initState() {
    super.initState();
    _resetStatus();
    _resetPageIndex();
    _initScrollController();
    _refreshCallback = () {
      return _initOnRefresh();
    };
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            RefreshIndicator(
              child: ListView.builder(
                //当条目过少时listview某些嵌套情况下可能不会滚动（条目多时，超出一个屏幕，不会出现此问题），RefreshIndicator是根据下拉偏移量触发onRefresh操作，不能滚动自然不能下拉刷新
                physics: AlwaysScrollableScrollPhysics(),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return widget.itemBuilder(context, index, _dataList[index]);
                },
                itemCount: _dataList == null ? 0 : _dataList.length,
              ),
              onRefresh: _refreshCallback,
            ),
            Offstage(
              offstage: !_firstLoad,
              child: LoadingDialog(),
            ),
            Offstage(
              offstage: !(_isIdle() &&
                  (_dataList == null ? 0 : _dataList.length) == 0),
              child: Center(
                child: InkWell(
                  onTap: () {
                    _clickRefresh();
                  },
                  child: Padding(
                    padding: EdgeInsets.all(M.screen),
                    child: TextSecondContent(S.of(context).noData),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _initScrollController() {
    if (widget.controller == null) {
      _scrollController = ScrollController();
    } else {
      _scrollController = widget.controller;
    }

    _scrollController.addListener(() {
      if (widget.onLoadMore != null &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        if (!_isIdle() || !_hasMore) return;
        _setLoadMore();
        widget.onLoadMore(_currentPage + 1, widget.pageSize).then((loadList) {
          if (loadList != null && loadList.length > 0) {
            _currentPage++; //加载成功后页面+1
            _dataList.addAll(loadList);
            if (loadList.length >= widget.pageSize) {
              _hasMore = true;
            } else {
              _hasMore = false;
            }
          }
          _resetStatus();
          setState(() {});
        });
      }
    });
  }

  Future _initOnRefresh() {
    _refreshDataFuture = Future.wait([
      Future(() {
        _setRefreshing(); //先设置正在刷新
      }),
      widget.onRefresh(1, widget.pageSize).then((loadList) {
        _dataList = loadList;
        if (_dataList != null && _dataList.length >= widget.pageSize) {
          _hasMore = true;
        } else {
          _hasMore = false;
        }
        _resetPageIndex(); //刷新成功后才能重置页码
        _resetStatus();
        _firstLoad = false;
      })
    ]).then((value) {
      setState(() {});
    });
    return _refreshDataFuture;
  }

  _clickRefresh() {
    _firstLoad = true;
    setState(() {});
    _refreshData();
  }

  _refreshData() {
    _initOnRefresh();
    _setRefreshing();
    _refreshDataFuture.then((value) {
      _resetStatus();
    });
  }

  _resetPageIndex() {
    _currentPage = 1;
  }

  _resetStatus() {
    _status = _idle;
  }

  _setLoadMore() {
    _status = _loadingMore;
  }

  _setRefreshing() {
    _status = _refreshing;
  }

  bool _isIdle() {
    return _status == _idle;
  }
}
