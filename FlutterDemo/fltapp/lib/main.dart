// MaterialDesign库
import 'package:flutter/material.dart';
//ios样式Widget(某些定制化独特风格)：Cupertino库
import 'package:flutter/cupertino.dart';
//更基本Widget：Widgets集
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:flutter/services.dart' show rootBundle;
//导入自定义的Widget插件类：SW插件类
//备注：无论多少导入命令，Dart只会导入应用中真正使用的widget(有态SW插件/无态普通SW插件/无态特殊SW插件)
//抽象类：基本通用的框架容器(外层包裹容器)
//具体类：具体研究方向下的内容构造器(内层内容构造器)
//从应用角度而言，抽象类呈现出什么效果取决于置入什么具体类(类似基类和自定义类之间的多态关系)
//SW插件若直接持有本身实例>本身直接重构build事件
//SW插件若间接持有子类实例>子类间接重构build事件
//SingleChildScrollView滚动性插件作过渡层
//Container容器辅助性插件过渡层(特定业务场景下 需手动限定布局 绘制特性、定位、尺寸范围)
//FadeInImage.assetNetwork 加载网络图片(占位图) 系统 功能弱
//FadeInImage.memoryNetwork 加载网络图片(占位图) 三方开源库 功能强 容错性高

//dart入口函数(仅单次执行)
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
      title: '庄佩云',
      theme: ThemeData(
        //数据源
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pink, inversePrimary: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FlutterHomePage'),
    );
  }
}

//(界面)有态SW插件 类(构造器)
//有态SW插件类
//(界面)直接关联的有态SW插件实例
//插件StatefulWidget类
//MyHomePage/_MyHomePageState本质上属于子有态SW插件类
//StatefulWidget有态SW插件类 系统层
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
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //_wordPair.asPascalCase 随机生成的字符串实例
  final _wordPair = WordPair.random();

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                '点按插件按钮次数:',
              ),
              Text(_wordPair.asPascalCase),
              CustomCard(
                  index: _counter,
                  onPress: () {
                    print('登录');
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _incrementCounter() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    setState(() {
      _counter++;
    });
  }

}

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态
class CustomCard extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  CustomCard({@required this.index, this.onPress});
  final index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return Card(
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
              image: AssetImage('lib/src/images/flower_pink.png'),//加载本地资源图
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 300,
            height: 200,
            color: Colors.yellow,
            child: const Image(
              image: AssetImage('lib/src/images/a_dot_burr.png'),//加载本地资源图
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
                child: Image.asset('lib/src/assets/dark_cycle/dark_cycle.png'),//加载本地资源图
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                child: const Image(
                  image: AssetImage(
                      'lib/src/assets/lover_kiss.png.dataset/lover_kiss.png'),//加载本地资源图
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const Image(
            image: AssetImage('lib/src/images/lovers_cartn.png'),//加载本地资源图
            fit: BoxFit.fill,
          ),
          Image.network(
              'https://img2.baidu.com/it/u=330301312,2796288823&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500'),//加载网图
          FadeInImage.assetNetwork(
            image:
                'https://img0.baidu.com/it/u=1162172507,1840715665&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
            placeholder: 'lib/src/images/girl_cute.png',
            fit: BoxFit.fill,
          ),//加载网图
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'http://tiebapic.baidu.com/forum/w%3D580/sign=a96ca741eafaaf5184e381b7bc5594ed/7ea6a61ea8d3fd1f2643ad5d274e251f95ca5f38.jpg',
          ),//加载网图
          FadeInImage.assetNetwork(
            image: 'https://img1.baidu.com/it/u=160173892,1626382670&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
            placeholder: 'lib/src/images/girl_cute.png',
            fit: BoxFit.fill,
          ),//加载网图
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
            'https://img0.baidu.com/it/u=1435639120,2241364006&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
          ),//加载网图
        ],
      ),
    );
  }

  // Future<String> loadAsset() async {
  //   return await rootBundle
  //       .loadString('lib/src/assets/lover_kiss.png.dataset/lover_kiss.json');
  // }
}
