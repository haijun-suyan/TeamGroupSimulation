//flutter项目 dart文件参考模版
// MaterialDesign库
import 'package:flutter/material.dart';
//更基本Widget：Widgets集

//ios样式Widget(某些定制化独特风格)：Cupertino库
//自定义Widget文件(库)

//自定义辅助文件
import 'package:flutter_boost/flutter_boost.dart';

//内容数据资源
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
                  onPressed: _nextPage,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      elevation: MaterialStateProperty.all(50) //阴影
                      ),
                  child: const Text('阴影按钮'),
                ),
              ],
            )),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //正式的执行路由跳转
    // Navigator.of(context).pushNamed('/d');
    BoostNavigator.instance.push("pageD");
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    //当前界面整体的渲染更新
    // setState(() {
    // });
  }
}
