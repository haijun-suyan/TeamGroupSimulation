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

//自定义Widget文件(库)
import 'custom/MyHomePage.dart';
import 'custom/pageA.dart';
import 'custom/pageB.dart';
import 'custom/pageC.dart';
import 'custom/pageD.dart';

//响应式开发特性：1.API调用 2.渲染快速重载
//渲染快速重载(受到设备本身CPU性能的影响)只在项目较小并处于简单的测试玩耍时生效，其余时候快速重载可能会失效(只能采用编译重启机制)
//flutter项目 main.dart文件内进行编码的修改及首页title修改自动重载，其余dart文件内的编码改动重载失效(CPU性能不支持/只能采取重启)(重载适合于较小demo项目)
//导入自定义的Widget插件类：SW插件类
//备注：无论多少导入命令，Dart只会导入应用中真正使用的widget(有态SW插件/无态普通SW插件/无态特殊SW插件)
//抽象类：基本通用的框架容器(外层包裹容器)
//具体类：具体研究方向下的内容构造器(内层内容构造器)
//从应用角度而言，抽象类呈现出什么效果取决于置入什么具体类(类似基类和自定义类之间的多态关系)
//SW插件若直接持有本身实例>本身直接重构build事件
//SW插件若间接持有子类实例>子类间接重构build事件
//SingleChildScrollView滚动性插件作过渡层(垂直/水平滚动)scrollDirection:Axis.
//ListView 垂直/水平滚动
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
//1 元类规则区(栈):多 内容堆区
//
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
          '/a': (BuildContext context) => const PageA(title: '图加载'),
          //路由元素b
          '/b': (BuildContext context) => const PageB(title: 'Button按钮插件'),
          //路由元素c
          '/c': (BuildContext context) => const PageC(title: 'pageC'),
          //路由元素d
          '/d': (BuildContext context) => const PageD(title: 'ListView表视图')
        });
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
