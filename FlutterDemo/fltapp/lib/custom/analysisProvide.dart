//flutter项目 dart文件参考模版
//MaterialDesign库
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//更基本Widget：Widgets集
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//ios样式Widget(某些定制化独特风格)：Cupertino库
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
//自定义Widget文件(库)

//自定义辅助文件

//内容数据资源

//Provider结构：由三方间接提供的状态管理结构包

//extends 父类
//with 插入类(mixin)
////with 插入类(mixin)
//SEL触发顺序：当前类IMP实现 > 插入类IMP实现 > 父类IMP实现

//Scaffold 页面层渲染
//其他API 普通层渲染

//state(数据)状态层
class StateOfProvider {
  late int count;
  StateOfProvider() {
    count = 0;
  }
}

//ChangeNotifier变更通知器
//Logic逻辑中转层
class LogicOfProvider extends ChangeNotifier {
  final state = StateOfProvider();
  void increment() {
    state.count++;
    //通知监控做更新
    notifyListeners();
  }
}

//视图渲染所在的结构实例
//UI(更新)渲染层
class UIPageOfProvider extends StatelessWidget {

  //页构造器(涉及到Scaffold)
  const UIPageOfProvider({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => LogicOfProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }
  Widget _buildPage(BuildContext context) {
    final provider = context.read<LogicOfProvider>();
    final state = provider.state;

    return Scaffold(
      appBar: AppBar(title: const Text('Provider-范例')),
      body: Center(
        child: Consumer<LogicOfProvider>(
          builder: (context, provider, child) {
            return Text(
              'You have pushed the button this many times: ${state.count} ',
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    // setState(() {
    //   Navigator.of(context).pushNamed('/b');
    // });
  }
}





