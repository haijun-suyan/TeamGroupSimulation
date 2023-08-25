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
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//导入自定义的Widget插件类：SW插件类
//备注：无论多少导入命令，Dart只会导入应用中真正使用的widget(有态SW插件/无态普通SW插件/无态特殊SW插件)
//抽象类：基本通用的框架容器(外层包裹容器)
//具体类：具体研究方向下的内容构造器(内层内容构造器)
//从应用角度而言，抽象类呈现出什么效果取决于置入什么具体类(类似基类和自定义类之间的多态关系)
//SW插件若直接持有本身实例>本身直接重构build事件
//SW插件若间接持有子类实例>子类间接重构build事件
//SingleChildScrollView滚动性插件作过渡层(滚动)scrollDirection:Axis.
//Container容器辅助性插件过渡层(特定业务场景下 需手动限定布局 绘制特性、定位、尺寸范围)
//SizedBox容器辅助性插件过渡层(特定业务场景下 需手动限定布局 尺寸范围)
//FadeInImage.assetNetwork 加载网络图片(占位图) 系统 功能弱
//FadeInImage.memoryNetwork 加载网络图片(占位图) 三方开源库 功能强 容错性高
//原本iOS/Android资源图转入Flutter项目本身二方库内
//device pixel ratio 设备像素比(物理像素/逻辑像素)
//Localizations.of()访问提供代理的特定本地化类
//Text 系统提供的无态插件类(不会自动触发其内build事件/必需手动访问引用/无态插件只是单纯的呈现本身所对应build构造函数中待呈现的内容)
//无态插件实现渲染变更则子内嵌于其他的有态插件中
//有态插件 内嵌着 无态插件
//dart入口函数(仅单次执行)
//XML可扩展标记语言(ExtensibleMarkupLanguage)(标签对语言<></>)
//Map 映射/路径链接  指向 构造器 类有态插件
//(子)内嵌 非界面间
//访问路由路径切换不同的界面插件(不同的屏幕间切换)：构造器Route和Navigator
//route路由应用程序中抽象出的辅助管理器(管理着屏幕页面的活跃性)
//绑定有路由路径(链)的插件实例可以通过所绑定的路由路径传递给MaterialApp实例(屏幕页面的切换)
//context 整个应用生效(同个内存区) 底层自动写入(应用上层直接读取使用即可)
//Expanded缩放插件(存在局限性(适用于少量情况))
//Flexible弹性插件
void main() {
  //Dart日志函数
  runApp(const MyApp());
}

//内容数据资源
//MyApp 特殊的无态SW插件 类(构造器) (仅单次执行(应用刚启动时执行1次))
//(自定义)MyApp特殊的无态SW插件 集成类 > (自定义)无态 SW插件实例
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 应用程序的根主入口
  @override
  //重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ], //实际的本地化值
        supportedLocales: const [
          Locale('zh', 'CN'), //China
          Locale('en', 'US'), //English
          Locale('he', 'IL'), //Hebrew
        ], //应用App已支持哪些地区
        title: '庄佩云',
        theme: ThemeData(
          //数据源
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink, inversePrimary: Colors.orange),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: Strings.welcomeMessage),
        routes: <String, WidgetBuilder>{
          //路由元素a
          '/a': (BuildContext context) => const PageA(title: 'pageA'),
          //路由元素b
          '/b': (BuildContext context) => const PageB(title: 'pageB'),
          //路由元素c
          '/c': (BuildContext context) => const PageC(title: 'pageC')
        });
  }
}

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
      Navigator.of(context).pushNamed('/a');
    });
  }
}

//(效果屏幕界面)有态SW插件 类(构造器)
//(界面)直接关联的有态SW插件实例
class PageA extends StatefulWidget {
  const PageA({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;

  //State<PageA> createState()状态对象
  // _PageAState createState() => _PageAState();
  //在插件树中某个给定的位置为该插件创建可变状态对象
  //多态概念
  //<PageA>泛型概念 <T extends StatefulWidget>
  //State<PageA> 状态包裹下的PageA类
  //State<PageA> createState() 管控着PageA类的状态容器
  //_PageAState子类构造器中重写build事件以返回有效关联的状态有态SW插件子类对应的有态SW插件新实例
  //通过状态容器管控机制促使PageA类多态持有着_PageAState类实例(有态SW插件实例)
  @override
  State<PageA> createState() => _PageAState();
}

//视图渲染所在的结构实例
//类 级 构造器
//引用码setState命令处于重构build事件所在的有态SW插件类 构造器
//Scaffold插件实例(整个界面的底跟插件实例)
//过渡层(具体内容的插件实例)
//状态 子 有态SW插件类
//_PageAState  有态SW插件类 自定义层二级类
class _PageAState extends State<PageA> {
  @override
  //状态SW插件子类的本身执行区中重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    // 当执行引用setState的坑回调事件内的回调指令码后重新执行编译build事件(引用码setState命令所处于的有态SW插件类中的成员变量内存区访问不变(所处于的SW插件类中的成员变量的声明初始化命令码不会再次执行)(仅再次执行所处于的SW插件类中的bulid事件))
    // 渲染层逻辑
    //Column 布局插件(水平:内容自动膨化 垂直:由上而下)
    //$ ‘’转义符
    //渲染有关的Scaffold渲染插件实例(整个所处于的屏幕界面的底跟插件实例)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 50, right: 50), //边际填充(内缩)(非负)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '欢迎来到A界面',
                  style: TextStyle(fontSize: 17),
                ),
                CustomCard(
                    index: 1,
                    onPress: () {
                      if (kDebugMode) {
                        print('登录');
                      }
                    }),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: _nextPage,
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const CircleBorder(
                          side: BorderSide(color: Colors.white))),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                          backgroundColor: Colors.transparent, fontSize: 17)),
                    ),
                    child: const Text('下一页'),
                  ), //凸起按钮
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    setState(() {
      Navigator.of(context).pushNamed('/b');
    });
  }
}

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
                    height: 40,
                    child: OutlinedButton(
                      onPressed: _nextPage,
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const CircleBorder(
                            side: BorderSide(color: Colors.white))),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            backgroundColor: Colors.transparent, fontSize: 17)),
                      ),
                      child: const Text('圆环 下一页'),
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

class PageC extends StatefulWidget {
  const PageC({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;

  @override
  State<PageC> createState() => _PageCState();
}

//类 级 构造器
//(自定义)状态子有态SW插件类 实例(体)
class _PageCState extends State<PageC> {
  @override
  //状态SW插件子类的本身执行区中重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    // 当执行引用setState的坑回调事件内的回调指令码后重新执行编译build事件(引用码setState命令所处于的有态SW插件类中的成员变量内存区访问不变(所处于的SW插件类中的成员变量的声明初始化命令码不会再次执行)(仅再次执行bulid事件))
    //渲染有关的Scaffold渲染插件实例(整个界面的底跟插件实例)
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
          child: const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.only(left: 50, right: 50), //边际填充(内缩)(非负)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '欢迎来到C界面',
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
    setState(() {});
  }
}

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class CustomCard extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const CustomCard({super.key, @required this.index, this.onPress});
  final index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(left: 50, right: 50), //边际填充(内缩)(非负)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 150,
              color: Colors.yellow,
              child: const Image(
                image: AssetImage(
                    'lib/src/images/a_dot_burr/a_dot_burr.png'), //加载本地资源图
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.yellow,
              child: const Image(
                image: AssetImage(
                    'lib/src/images/a_dot_burr/a_dot_burr.png'), //加载本地资源图
                fit: BoxFit.fill,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Image.asset(
                      'lib/src/assets/dark_cycle/dark_cycle.png'), //加载本地资源图
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: const Image(
                    image: AssetImage(
                        'lib/src/assets/lover_kiss.png.dataset/lover_kiss.png'), //加载本地资源图
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            const Image(
              image: AssetImage(
                  'lib/src/images/lovers_cartn/lovers_cartn.png'), //加载本地资源图
              fit: BoxFit.fill,
            ),
            Image.network(
                'https://img2.baidu.com/it/u=330301312,2796288823&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500'), //加载网图
            FadeInImage.assetNetwork(
              image:
                  'https://img0.baidu.com/it/u=1162172507,1840715665&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
              placeholder: 'lib/src/images/girl_cute/girl_cute.png',
              fit: BoxFit.fill,
            ), //加载网图
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg',
            ), //加载网图
            FadeInImage.assetNetwork(
              image:
                  'https://img1.baidu.com/it/u=160173892,1626382670&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
              placeholder: 'lib/src/images/girl_cute.png',
              fit: BoxFit.fill,
            ), //加载网图
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://img0.baidu.com/it/u=1435639120,2241364006&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
            ), //加载网图
          ],
        ),
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
class SSSSSCard extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  SSSSSCard({@required this.index, this.onPress});
  final index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.only(left: 50, right: 50), //边际填充(内缩)(非负)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                autofocus: true,
                onPressed: onPress,
                child: const Text('登录'),
              ),
              Container(
                width: 200,
                height: 150,
                color: Colors.yellow,
                child: const Image(
                  image: AssetImage(
                      'lib/src/images/a_dot_burr/a_dot_burr.png'), //加载本地资源图
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 300,
                height: 200,
                color: Colors.yellow,
                child: const Image(
                  image: AssetImage(
                      'lib/src/images/a_dot_burr/a_dot_burr.png'), //加载本地资源图
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: Image.asset(
                        'lib/src/assets/dark_cycle/dark_cycle.png'), //加载本地资源图
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: const Image(
                      image: AssetImage(
                          'lib/src/assets/lover_kiss.png.dataset/lover_kiss.png'), //加载本地资源图
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const Image(
                image: AssetImage(
                    'lib/src/images/lovers_cartn/lovers_cartn.png'), //加载本地资源图
                fit: BoxFit.fill,
              ),
              Image.network(
                  'https://img2.baidu.com/it/u=330301312,2796288823&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500'), //加载网图
              FadeInImage.assetNetwork(
                image:
                    'https://img0.baidu.com/it/u=1162172507,1840715665&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                placeholder: 'lib/src/images/girl_cute/girl_cute.png',
                fit: BoxFit.fill,
              ), //加载网图
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg',
              ), //加载网图
              FadeInImage.assetNetwork(
                image:
                    'https://img1.baidu.com/it/u=160173892,1626382670&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                placeholder: 'lib/src/images/girl_cute.png',
                fit: BoxFit.fill,
              ), //加载网图
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://img0.baidu.com/it/u=1435639120,2241364006&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
              ), //加载网图
            ],
          )),
    );
  }
}

//(基)类 字符串资源
class Strings {
  //静态字段app_name
  static const String app_name = 'Flutter Demo';
  //静态字段welcomeMessage
  static const String welcomeMessage = 'FlutterHomePage';
}
