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

const cities = [
  "位运算符求和",
  "北京",
  "上海",
  "淮安",
  "广东",
  "深圳",
  "柳州",
  "杭州",
  "洛阳",
  "苏州",
  "昆山",
  "台州",
  "武汉",
  "泰安",
  "郑州",
  "天津"
];

//内容数据资源
class PageAlgorithm extends StatefulWidget {
  const PageAlgorithm({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;
  @override
  State<PageAlgorithm> createState() => _PageAlgorithmState();
}

//视图渲染所在的结构实例
class _PageAlgorithmState extends State<PageAlgorithm> {
  @override
  Widget build(BuildContext context) {
    var physicalSize = View.of(context).physicalSize;
    var devicePixelRatio = View.of(context).devicePixelRatio;
    //计算出ios/android屏幕宽高 (pt/dp)
    var screenW = physicalSize.width / devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: screenW - 20,
          height: 600,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: itemBuilder,
            itemCount: cities.length,
          ), //ListView水平滚动
        ),
      ),
    );
  }

  Widget? itemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        //点击处理
        if (kDebugMode) {
          print(cities[index]);
        }
      },
      child: Container(
        height: 45,
        width: 160,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.teal),
        child: Text(cities[index]),
      ),
    );
  }
}
