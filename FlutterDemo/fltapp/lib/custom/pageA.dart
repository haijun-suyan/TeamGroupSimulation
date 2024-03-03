//flutter项目 dart文件参考模版
//界面文件层
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
import 'package:transparent_image/transparent_image.dart';
//自定义Widget文件(库)

//自定义辅助文件

//内容数据资源
//界面(层)构造器
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
                  '欢迎来到A界面(flutter页)',
                  style: TextStyle(fontSize: 17),
                ),
                const Text('SingleChildScrollView垂直滚动'),
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
      //正式的执行路由跳转
      Navigator.of(context).pushNamed('/b');
    });
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
