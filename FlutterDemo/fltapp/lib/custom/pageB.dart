//flutter项目 dart文件参考模版
// MaterialDesign库
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//更基本Widget：Widgets集
import 'dart:async';
import 'package:flutter/services.dart';

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

typedef MethodCallHandler = Future<dynamic> Function(MethodCall call)?;

//类 级 构造器
//(自定义)状态子有态SW插件类 实例(体)
class _PageBState extends State<PageB> {

  //获取原生所构建出的通道channel(通道名即通道原生对应的名)
  static const channel = const MethodChannel(
      'plugins.flutter.io/google_sign_in_ios');


  // -------------(原生页面实现操作)flutter提供IMP功能(数据的双向通信)-----------------
  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'flutterCustomMethod':
        {
          try {
            return flutterCustomMethod(
                call);
          } on PlatformException catch (e) {
            return PlatformException(code: '1002', message: "出现异常");
          }
          break;
        }
    }
  }

  Future<dynamic> flutterCustomMethod(MethodCall call) async {
    print('flutterCustomMethod ${call.arguments}');
    return 100;
  }

  // -------------(flutter页面中实现操作)Native提供IMP功能(数据的双向通信)-----------------
  Future<int?> _swiftCustomMethod() async {
    String desLog = '';
    Map<String, int> params = {'age': 23};
    final result;
    try {
      //params Flutter>Native 数据正向
      //result Native>Flutter 数据逆向
      //方案1(swiftCustomMethod Native IMP)
      // await channel.invokeMethod('swiftCustomMethod',params).then((result){
      //   print(result);
      // });
      //方案2(swiftCustomMethod Native IMP)
      result = await channel.invokeMethod('swiftCustomMethod', params);
      print('result is $result');
      return result;
    } on PlatformException catch (e) {
      desLog = "Failed reason: '${e.message}'";
      print(desLog);
    }

    setState(() {
      desLog;
    });
  }

  Future<int?> _swiftCustomMod() async {
    String desLog = '';
    Map<String, Map> params = {};
    final result;
    try {
      result = await channel.invokeMethod('swiftCustomMod',params);
      print('result is $result');
      return result;
    } on PlatformException catch (e) {
      desLog = "Failed reason: '${e.message}'";
      print(desLog);
    }

    setState(() {
      desLog;
    });
  }

  @override
  //状态SW插件子类的本身执行区中重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    //当执行引用setState的坑回调事件内的回调指令码后重新执行编译build事件(引用码setState命令所处于的有态SW插件类中的成员变量内存区访问不变(所处于的SW插件类中的成员变量的声明初始化命令码不会再次执行)(仅再次执行bulid事件))
    //渲染有关的Scaffold渲染插件实例(整个界面的底跟插件实例)

    //获取屏幕的物理尺寸(px)及像素密度
    var physicalSize = View
        .of(context)
        .physicalSize;
    var devicePixelRatio = View
        .of(context)
        .devicePixelRatio;
    //计算出ios/android屏幕宽高 (pt/dp)
    var screenW = physicalSize.width / devicePixelRatio;
    var screenH = physicalSize.height / devicePixelRatio;

    if (kDebugMode) {
      print('screenW:$screenW screenH:$screenH');
    }

    //flutter提供IMP
    //platformCallHandler注入channel通道回调表(通道另端完成信息传递则触发回调表中当前端的回调函数)
    channel.setMethodCallHandler(platformCallHandler);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
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
                    '欢迎来到B界面(flutter页)',
                  ),
                  ChannelTest(onPress: () {
                    _swiftCustomMethod();
                  }),
                  ToNativeUI(onPress: () {
                    _swiftCustomMod();
                  }),
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
                      // SizedBox(
                      //   width: screenW*4,
                      //   child: Row(children: [
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {},
                      //         icon: const Icon(null),
                      //         label: const Text('图标按钮'),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {},
                      //         icon: const Icon(Icons.add),
                      //         label: const Text('图标按钮'),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {},
                      //         icon: const Icon(Icons.account_box),
                      //         label: const Text('图标按钮'),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {},
                      //         icon: const Icon(Icons.account_box),
                      //         label: const Text('图标按钮'),
                      //       ),
                      //     ),
                      //   ]),
                      // ),
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
                  const Text('SingleChildScrollView水平滚动'),
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

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class ChannelTest extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const ChannelTest({super.key, this.onPress});

  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ButtonBar(
        children: [
          ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                  const CircleBorder(side: BorderSide(color: Colors.white))),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  backgroundColor: Colors.transparent, fontSize: 17)),
            ),
            child: const Text('事件通道之Native层提供IMP'),
          ),
        ],
      ),
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle
        .loadString('lib/src/assets/lover_kiss.png.dataset/lover_kiss.json');
  }
}

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class ToNativeUI extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const ToNativeUI({super.key, this.onPress});

  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ButtonBar(
        children: [
          ElevatedButton(
            onPressed: onPress,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(
                  backgroundColor: Colors.transparent, fontSize: 17)),
            ),
            child: const Text('切换进入NativeUI原生页'),
          ),
        ],
      ),
    );
  }

}
