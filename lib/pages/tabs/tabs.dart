import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'index.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pagesList = [HomePage(), ShopPage(), ConversationPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(context,
        designSize: Size(750, 1334), allowFontScaling: false);

    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Flutter Demo'),
        //   backgroundColor: Colors.red,
        // ),
        // floatingActionButton: Container(
        //   height: 60,
        //   width: 60,
        //   padding: EdgeInsets.all(5),
        //   margin: EdgeInsets.only(top: 5),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30), color: Colors.white),
        //   child: FloatingActionButton(
        //     child: Icon(Icons.add),
        //     onPressed: () {
        //       setState(() {
        //         this._currentIndex = 1;
        //       });
        //     },
        //     backgroundColor: this._currentIndex == 1 ? Colors.blue : Colors.red,
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        body: this._pagesList[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '积分商场'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_sharp), label: '会话'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '我'),
          ],
          // iconSize: 36, //icon大小
          // fixedColor: Colors.red, //选中颜色
          currentIndex: this._currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            print(index);
            setState(() {
              this._currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
