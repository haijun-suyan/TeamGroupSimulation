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
import 'package:english_words/english_words.dart';
//自定义Widget文件(库)

//自定义辅助文件

//内容数据资源
//(效果屏幕界面)有态SW插件 类(构造器)
//有态SW插件类
//(界面)直接关联的有态SW插件实例
//插件StatefulWidget类
//MyHomePage/_MyHomePageState本质上属于子有态SW插件类
//StatefulWidget有态SW插件类 系统层 (依赖于状态配置信息>直接关联渲染刷新)(请求/交互后回调域)
//MyHomePage   有态SW插件类 自定义层一级类
//_MyHomePageState  有态SW插件类 自定义二级层
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;

  //State<MyHomePage> createState()状态对象
  // _MyHomePageState createState() => _MyHomePageState();
  //在插件树中某个给定的位置为该插件创建可变状态对象
  //多态概念
  //<MyHomePage>泛型概念 <T extends StatefulWidget>
  //State<MyHomePage> 状态包裹下的MyHomePage类
  //State<MyHomePage> createState() 管控着MyHomePage类的状态容器
  //_MyHomePageState子类构造器中重写build事件以返回有效关联的状态有态SW插件子类对应的有态SW插件新实例
  //通过状态容器管控机制促使MyHomePage类多态持有着_MyHomePageState类实例(有态SW插件实例)
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//视图渲染所在的结构实例
//类 级 构造器
//(自定义)状态子有态SW插件类 实例(体)
//引用码setState命令处于重构build事件所在的有态SW插件类 构造器
//Scaffold插件实例(整个界面的底跟插件实例)
//过渡层(具体内容的插件实例)
//状态 子 有态SW插件类
//_MyHomePageState  有态SW插件类 自定义层二级类
class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  //_wordPair.asPascalCase 随机生成的字符串实例
  final _wordPair = WordPair.random();
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  //重构状态初始化initState事件实例
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  //状态SW插件子类的本身执行区中重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    // 当执行引用setState的坑回调事件内的回调指令码后重新执行编译build事件(引用码setState命令所处于的有态SW插件类中的成员变量内存区访问不变(所处于的SW插件类中的成员变量的声明初始化命令码不会再次执行)(仅再次执行bulid事件))
    // 渲染层逻辑
    //Column 布局插件(水平:内容自动膨化 垂直:由上而下)
    //$ ‘’转义符
    //渲染有关的Scaffold渲染插件实例(整个界面的底跟插件实例)
    if (kDebugMode) {}
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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
                  Text(
                    '点按插件按钮次数:$_counter',
                  ),
                  FadeTransition(
                    opacity: curve,
                    child: Text(_wordPair.asPascalCase),
                  ),
                  AlgorithmStructure(onPress: () {
                    //正式的触发路由跳转
                    Navigator.of(context).pushNamed('/e');
                  }),
                ],
              )), //FadeTransition过渡动画呈现插件(其内child对应的插件(默认不可见(当主机controller执行controller.forward();生效命令后child对应的内嵌插件逐步动画呈现)))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //函数级构造器(级别低于类级别)
  void _incrementCounter() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    // setState(() {
    //   Navigator.of(context).pushNamed('/a');
    //   _counter++;
    //   controller.forward();
    // });
    setState(() {
      //正式的触发路由跳转
      Navigator.of(context).pushNamed('/a');
    });
  }
}

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class AlgorithmStructure extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const AlgorithmStructure({super.key, @required this.onPress});
  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        autofocus: true,
        onPressed: onPress,
        child: const Text('算法Algorithm'),
      ),
    );
  }
}
