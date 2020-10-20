import 'package:XTCircle_flutter/common/global/global.config.dart';
import 'package:XTCircle_flutter/common/global/global.sugar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../widgets/index.dart';
import '../../data/index.dart';
import '../../models/index.dart';
import '../../utils/index.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bannerModel> _bannerList = [];
  List<Cate> _cateList = [];
  List<StickModel> _stickList = [];
  int _page = 1;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    _getRecomendStickData(true);
  }

  void _onLoading() async {
    _getRecomendStickData(false);
  }

//获取顶部banner 和 icons图标
  _getAdverData() async {
    print('_getAdverData start');

    ResultModel model = await Io.get(LZDAPi.API_index_getAdvertData,
        data: {'type_name': '首页广告'});

    setState(() {
      _bannerList = getbannerModelList(model.data);
    });
    // print(model.data);
  }

  //获取推荐帖子
  _getRecomendStickData(final bool onRefresh) async {
    _page = onRefresh ? 1 : ++_page;

    ResultModel resultModel = await Io.get(LZDAPi.API_GET_STICK_GETLIST, data: {
      'page': _page,
      'limit': Config.requestSize,
      'field': 'is_hot',
      'order': 'desc'
    });

    if (!ObjectUtil.isEmpty(resultModel)) {
      if (onRefresh) {
        _refreshController.refreshCompleted();
      } else {
        _refreshController.loadComplete();
      }

      stickResultModel stick =
          stickResultModel.fromJson(resultModel.data['data']);

      if (resultModel.data['data']['data'].length == 0) {
        _refreshController.loadNoData();
      } else {
        setState(() {
          if (onRefresh) {
            _stickList.clear();
          }
          _stickList.addAll(stick.data);
        });
      }
    } else {
      _refreshController.loadFailed();
    }
  }

  _getIconsData() async {
    ResultModel modelIcons = await Io.get(LZDAPi.API_GET_HOME);

    // List lis = modelIcons.data['cate'];

    // Cate ca = Cate.fromJson(lis.first);

    // print('home==${ca.toJson()}');

    homeModel homeM = homeModel.fromJson(modelIcons.data);
    // print('home==${homeModel.fromJson(modelIcons.data)}');
    // print(homeM);

    setState(() {
      _cateList = homeM.cate;
    });
  }

  @override
  void initState() {
    super.initState();

    _getAdverData();
    _getIconsData();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemCount: _stickList.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              // return Container();
              return SwiperDiy(
                swiperDataList: _bannerList,
              );
            } else if (index == 1) {
              // return Container();
              return TopNavigator(
                navigatorList: _cateList,
              );
            } else {
              if (_stickList.length == 0) {
                return Container();
              } else {
                return _item(_stickList[index - 2], context);
              }
            }
          },
        ),
      ),
    );
  }
}

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List<bannerModel> swiperDataList;
  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmptyList(swiperDataList)) {
      return Container(
        height: 0,
      );
    }

    return AspectRatio(
      aspectRatio: 900.0 / 383.0,
      child: Swiper(
        indicatorAlignment: AlignmentDirectional.bottomCenter,
        circular: true,
        interval: const Duration(seconds: 5),
        indicator: CircleSwiperIndicator(),
        children: swiperDataList.map((model) {
          return new InkWell(
            onTap: () {
              LogUtil.e("BannerModel: " + model.img);
              // NavigatorUtil.pushWeb(context,
              //     title: model.title, url: model.url);
            },
            child: new CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: model.img,
              placeholder: (context, url) => new ProgressView(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TopNavigator extends StatelessWidget {
  final List<Cate> navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, Cate item, int index) {
    return InkWell(
        onTap: () {
          LogUtil.e("BannerModel: " + item.name);
          _goCategory(context, item);
        },
        child: Center(
          // color: index == 0 ? Colors.red : Colors.green,
          child: Column(
            children: <Widget>[
              Image.network(
                item.img,
                width: ScreenUtil().setWidth(80),
              ),
              SizedBox(
                height: 5,
              ),
              Text(item.name)
            ],
          ),
        ));
  }

  void _goCategory(context, Cate item) {
    showToast(item.name);
    // await request('getCategory').then((val) {
    //   var data = json.decode(val.toString());
    //   CategoryModel category = CategoryModel.fromJson(data);
    //   List list = category.data;
    //   Provide.value<ChildCategory>(context).changeCategory(categroyId, index);
    //   Provide.value<ChildCategory>(context)
    //       .getChildCategory(list[index].bxMallSubDto, categroyId);
    //   Provide.value<CurrentIndexProvide>(context).changeIndex(1);
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmptyList(navigatorList)) {
      return Container(
        height: 0,
      );
    }

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 0.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(0.0),
      child: GridView.builder(
          itemCount: navigatorList.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: ScreenUtil().setHeight(300 / 2) / 0.2.wp,
          ),
          itemBuilder: (context, index) {
            return _gridViewItemUI(context, navigatorList[index], index);
          }),
    );
  }
}

//推荐的内容列表
class Recommend extends StatelessWidget {
  final List<StickModel> stickList;

  Recommend({Key key, this.stickList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _recommendWidget(context, stickList);
  }
}

Widget _recommendWidget(BuildContext context, List<StickModel> stickList) {
  return Container(
    height: 500,
    child: ListView.builder(
      itemCount: stickList.length,
      itemBuilder: (BuildContext context, int index) {
        return _item(stickList[index], context);
      },
    ),
  );
}

//自定义的cell
Widget _item(StickModel stick, context) {
  return InkWell(
    onTap: () {
      toast(stick.title);
      // Application.router.navigateTo(context,"/detail?id=${recommendList[index]['goodsId']}");
    },
    child: Container(
      width: ScreenUtil().setWidth(280),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 0.5, color: Colors.black12))),
      child: Column(
        children: <Widget>[
// stick.img.length>0?CachedNetworkImage(imageUrl: stick.img.first):Container(child:,)

          Text(stick.title),
          Text(
            stick.content.length > 0 ? stick.content : '',
            maxLines: 2,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    ),
  );
}
