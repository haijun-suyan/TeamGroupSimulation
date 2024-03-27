//flutter项目 dart文件参考模版
// MaterialDesign库
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//更基本Widget：Widgets集

//ios样式Widget(某些定制化独特风格)：Cupertino库
//自定义Widget文件(库)

//自定义辅助文件
import 'package:flutter_boost/flutter_boost.dart';

import 'Unity.dart';

//内容数据资源
class PageC extends StatefulWidget {
  const PageC({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;

  //周期函数createState处于初始化期
  //周期函数createState自定义的StatefulWidget构造器内第一个调用事件
  //周期函数createState是抽象方函数(需重写)
  @override
  State<PageC> createState() => _PageCState();
  // _PageCState createState() => _PageCState();

}

//类 级 构造器
//(自定义)状态子有态SW插件类 实例(体)
//StatefulWidget底层提供的周期事件(三组)：
//①初始化期:createState,initState;
//②更新期:didChangeDependencies,build,didUpdateWidget
//③销毁期:deactivate失活,dispose安排 ;
class _PageCState extends State<PageC> {
  //获取原生所构建出的通道channel(通道名即通道原生对应的名)
  // BasicMessageChannel(不受页面影响(更自由))
  static const messageChannel = BasicMessageChannel('plugins.flutter.io/google_sign_in_ios', StandardMessageCodec());

  @override
  //重构状态初始化initState事件实例
  //周期函数initState处于初始化期
  //周期函数initState是StatefulWidget构造器内第二个调用事件
  //类似于(IOS中viewDidLoad函数地位)：所需数据源的初始载入
  //进入flutter页面层时触发一次
  void initState() {
    if (kDebugMode) {
      print("initState");
    }
    super.initState();

  }

  //周期函数didChangeDependencies处于更新阶段
  //周期函数didChangeDependencies是StatefulWidget构造器内第三个调用事件(调用完initState后)
  //InheritedWidget继承组件相关(暂不涉及)
  //didChangeDependencies已更改依赖项事件必须先调用父类(先变更父类依赖)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (kDebugMode) {
      print("didChangeDependencies");
    }
  }

  //周期函数build处于更新阶段
  //情形①常规：周期函数build是StatefulWidget构造器内第四个调用事件(调用完didChangeDependencies后)
  //情形②：setState事件被触发后, 周期函数build重新被调用(重新渲染页面)
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
      body: Container(
        color: Colors.yellow,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 0, right: 50), //边际填充(内缩)(非负)
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  '欢迎来到C界面(flutter页)',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.left,
                ),
                ElevatedButton(
                  onPressed: _sendData,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(50) //阴影
                  ),
                  child: const Text('消息按钮(flutter主动send)'),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(50) //阴影
                      ),
                  child: const Text('阴影按钮'),
                ),
                SizedBox(
                  width: Unity().screenWidth(context),
                  height: 45,
                  child: GestureDetector(
                    onTap: () {
                      // BoostNavigator.instance.pop(context);
                      Navigator.of(context).pop();
                    },
                    child: const Text(textAlign: TextAlign.center,"回到上级页(普通跳转)"),
                  ),
                ),
                CustomCard(
                    index: 1,
                    onPress: () {
                      if (kDebugMode) {
                        print('登录');
                      }
                    }),
              ],
            )),
      ),
    );
  }

  //周期函数didUpdateWidget处于更新阶段
  //周期函数didUpdateWidget只在当前组件的父组件出现重绘时被调用触发
  //不常被调用
  @override
  void didUpdateWidget(PageC oldWidget) {
    //更新状态相关代码
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print("didUpdateWidget");
    }
    //当前widget与oldWidget进行对比,如不同则执行额外操作
    // widget.update()
  }

  //周期函数解除事件deactivate处于销毁阶段
  ///解除事件deactivate只有在组件被移除时才触发
  ///先触发解除事件deactivate再触发dispose销毁事件
  @override
  void deactivate() {
    super.deactivate();
    if (kDebugMode) {
      print("deactivate");
    }
  }

  ///周期函数dispose处于销毁阶段
  //组件被真正销毁时调用
  //dispose事件内进行资源的释放与销毁操作
  @override
  void dispose() {
    super.dispose();
    if (kDebugMode) {
      print("dispose");
    }
  }


  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    //当前界面整体的渲染更新
    setState(() {
      //正式的执行路由跳转
      // Navigator.of(context).pushNamed('/d');
      BoostNavigator.instance.push("pageD");
    });
  }

  void _sendData() {
    //不推荐：()=>{仅支持1条命令}
    //推荐：(){支持N条命令}
    //name: "原生页的解析别名"
    BoostNavigator.instance.push("NativeViewControllerThree",arguments:{"name": "zpy", "gender": "女", "age":"25"});
    //Instance of 'Future<Object?>
    //Future未来概念
    //Flutter主动发送(Boost)
    Future<Object?> reply = messageChannel.send("Hello from Flutter!").then((result) {
      //逆向数据NativeToFlutter
      //flutterIMP
      if (kDebugMode) {
        print('ReceivedReply: $result');
      }
      Unity().showDialogCustom(context,"逆向数据NativeToFlutter",'$result',(){
    },(){});

    });

  }

}

class CustomCard extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const CustomCard({super.key, @required this.index, this.onPress});
  final index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function()? onPress;

  //StatelessWidget底层提供的createElement周期事件和build周期事件
  // @override
  // StatelessElement createElement() => StatelessElement(this);

  //生产编码
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        height: 150,
        color: Colors.yellow,
        child: const Image(
          image: AssetImage(
              'lib/src/images/a_dot_burr/a_dot_burr.png'), //加载本地资源图
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
