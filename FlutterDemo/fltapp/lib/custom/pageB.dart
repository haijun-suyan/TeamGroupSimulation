//flutter项目 dart文件参考模版
// MaterialDesign库
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//更基本Widget：Widgets集
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
//ios样式Widget(某些定制化独特风格)：Cupertino库
//自定义Widget文件(库)

//自定义辅助文件

//内容数据资源
class PageB extends StatefulWidget {
  const PageB({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;

  @override
  State<PageB> createState() => _PageBState();
}

//类 级 构造器
//(自定义)状态子有态SW插件类 实例(体)
class _PageBState extends State<PageB> {
  @override
  //状态SW插件子类的本身执行区中重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    //当执行引用setState的坑回调事件内的回调指令码后重新执行编译build事件(引用码setState命令所处于的有态SW插件类中的成员变量内存区访问不变(所处于的SW插件类中的成员变量的声明初始化命令码不会再次执行)(仅再次执行bulid事件))
    //渲染有关的Scaffold渲染插件实例(整个界面的底跟插件实例)

    //获取屏幕的物理尺寸(px)及像素密度
    var physicalSize = View.of(context).physicalSize;
    var devicePixelRatio = View.of(context).devicePixelRatio;
    //计算出ios/android屏幕宽高 (pt/dp)
    var screenW = physicalSize.width / devicePixelRatio;
    var screenH = physicalSize.height / devicePixelRatio;

    if (kDebugMode) {
      print('screenW:$screenW screenH:$screenH');
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.sensor_door))
          ]), //图标按钮(导航条)
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding:
              const EdgeInsets.only(left: 50, right: 50), //边际填充(内缩)(非负)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '欢迎来到B界面',
                  ),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      autofocus: true,
                      onPressed: () {},
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            backgroundColor: Colors.transparent,
                            fontSize: 17,
                            color: Colors.black)),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.black),
                        mouseCursor:
                        MaterialStateProperty.all(SystemMouseCursors.wait),
                      ),
                      child: const Text('文本按钮'),
                    ), //文本按钮
                  ),
                  ButtonBar(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('阴影按钮'),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStateProperty.all(50) //阴影
                        ),
                      ),
                      SizedBox(
                        width: screenW,
                        child: Row(children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(null),
                              label: const Text('图标按钮'),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              label: const Text('图标按钮'),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_box),
                              label: const Text('图标按钮'),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.account_box),
                              label: const Text('图标按钮'),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    backgroundColor: Colors.transparent,
                                    fontSize: 17)),
                          ),
                          child: const Text('圆弧角'),
                        ),
                      ),
                    ],
                  ), //按钮组
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ButtonBar(
                      children: [
                        SizedBox(
                          width: screenW * 5, //ButtonBar+SizedBox：内容尺寸
                          child: Row(children: [
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 100,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 80,
                                  maxHeight: 45,
                                ),
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标??按钮'),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ButtonBar(
                      children: [
                        SizedBox(
                          width: 150 * 12, //ButtonBar+SizedBox：内容尺寸
                          child: Row(children: [
                            Flexible(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Flexible(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(null),
                                  label: const Text('图标按钮'),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: OutlinedButton(
                      onPressed: _nextPage,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder(
                            side: BorderSide(color: Colors.white))),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            backgroundColor: Colors.transparent, fontSize: 17)),
                      ),
                      child: const Text('圆环'),
                    ), //线框按钮
                  ),
                ],
              )),
        ),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    // setState(() {
    //   Navigator.of(context).pushNamed('/a');
    //   _counter++;
    //   controller.forward();
    // });
    setState(() {
      Navigator.of(context).pushNamed('/c');
    });
  }
}