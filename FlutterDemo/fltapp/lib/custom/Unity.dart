//flutter项目 dart文件参考模版
// MaterialDesign库
// import 'dart:js';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//更基本Widget：Widgets集
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//ios样式Widget(某些定制化独特风格)：Cupertino库
import 'package:flutter/cupertino.dart';

//自定义Widget文件(库)
//自定义辅助文件
class Unity {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  // int id;
  // String name;
  // Unity(this.id, this.name);
  Unity();

  Future<T?> showDialogCustom<T>(BuildContext context, String title,
      String content, void Function()? onOK, void Function()? onCancel) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                onOK!();
              },
              child: Text('确定'),
            ),
            ElevatedButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
                onCancel!();
              },
            ),
          ],
        );
      },
    );
  }

  // 屏幕宽度
  double screenWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  // 屏幕高度
  double screenHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }

  // 状态栏高度
  double appBarHeight(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).padding.top;
    return appBarHeight;
  }

  //底部栏高度
  double bottomBarHeight(BuildContext context) {
    double bottomBarHeight = MediaQuery.of(context).padding.bottom;
    return bottomBarHeight;
  }




}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('这是自定义对话框的标题'),
            const SizedBox(height: 10.0),
            const Text('这是自定义对话框的内容'),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('关闭'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




class ColorsCustom {
  //静态字段darkYellow
  static const Color darkYellow = Color(0xB0E0E600);
  //静态字段welcomeMessage
}

class DevicesCustom {
  //静态字段

//静态字段welcomeMessage
}
