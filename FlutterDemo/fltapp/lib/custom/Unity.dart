
//flutter项目 dart文件参考模版
// MaterialDesign库
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

  void showDialogCustom(BuildContext context,String title,String content,void Function()? onOK,void Function()? onCancel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pop();
                onOK!();
              },
              child: Text('确定'),
            ),
            ElevatedButton(
              child: Text('取消'),
              onPressed: (){
                Navigator.of(context).pop();
                onCancel!();
              },
            ),

          ],
        );
      },
    );
  }





}
