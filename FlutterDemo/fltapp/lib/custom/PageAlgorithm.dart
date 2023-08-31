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
  "数据交换位置",
  "数据交换位置",
  "快速排序",
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
          child: LtStructure(
            onTap: (value, index) {
              switch (index) {
                case 0:
                  {
                    if (kDebugMode) {
                      print(add(0, 5));
                    }
                    break;
                  }
                case 1:
                  {
                    change0(10, 6);
                    break;
                  }
                case 2:
                  {
                    change1(14, 9);
                    break;
                  }
                case 3:
                  break;
                case 4:
                  break;
                case 5:
                  break;
                case 6:
                  break;
                case 7:
                  break;
                case 8:
                  break;
                case 9:
                  break;
                case 10:
                  break;
                case 11:
                  break;
                case 12:
                  break;
                case 13:
                  break;
                case 14:
                  break;
                case 15:
                  break;
              }
            },
          ), //ListView作二次扩展封装更接近业务层的LtStructure表插件
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   var physicalSize = View.of(context).physicalSize;
  //   var devicePixelRatio = View.of(context).devicePixelRatio;
  //   //计算出ios/android屏幕宽高 (pt/dp)
  //   var screenW = physicalSize.width / devicePixelRatio;
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.teal,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: SizedBox(
  //         width: screenW - 20,
  //         height: 600,
  //         child: ListView.builder(
  //           scrollDirection: Axis.vertical,
  //           itemBuilder: itemBuilder2,
  //           itemCount: cities.length,
  //         ), //ListView水平滚动
  //       ),
  //     ),
  //   );
  // }

  Widget? itemBuilder0(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        //点击回调处理
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

  Widget? itemBuilder1(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        //点击回调处理
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

  Widget? itemBuilder2(BuildContext context, int index) {
    return InkResponse(
      onTap: () {
        //点击回调处理
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

  int add(int a, int b) {
    int sum, carry; //sum累和，carry待迭入
    do {
      sum = a ^ b; //运算‘异或’

      carry = (a & b) << 1; //运算‘与&’ 运算‘左移<<’
      a = sum;
      b = carry;
    } while (b != 0);
    return sum;
  }

  void change0(int a, int b) {
    a = a + b;
    b = a - b;
    a = a - b;
    if (kDebugMode) {
      print("a:$a,b:$b");
    }
  }

  void change1(int a, int b) {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
    if (kDebugMode) {
      print("a:$a,b:$b");
    }
  }
}

//****通过回调函数实现逆向传值(内容数据反馈回UI左上前业务层逻辑)***

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class LtStructure extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const LtStructure({super.key, @required this.onTap});
  //通过回调函数实现逆向传值(内容数据反馈回UI左上前业务层逻辑)
  //void Function()? 事件本身所遵循的结构特征
  final void Function(String, int)? onTap;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return LtItem(
          value: cities[index],
          onTap: (value, index) {
            onTap!(value, index);
          },
          index: index,
        );
      },
      itemCount: cities.length,
    );
  }
}

class LtItem extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const LtItem(
      {super.key,
      @required this.onTap,
      required this.value,
      required this.index});

  final String value;
  final int index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function(String, int)? onTap;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //点击回调处理
        onTap!(value, index);
      },
      child: ListTile(
        title: Text(value),
      ),
    );
  }
}
