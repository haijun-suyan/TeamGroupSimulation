//flutter项目 dart文件参考模版
// MaterialDesign库
import 'package:flutter/material.dart';
//更基本Widget：Widgets集
//ios样式Widget(某些定制化独特风格)：Cupertino库
//自定义Widget文件(库)

//自定义辅助文件

const cities = [
  "南宁",
  "北京",
  "上海",
  "淮安",
  "广东",
  "深圳",
  "柳州",
  "杭州",
  "洛阳",
  "苏州",
  "昆山",
  "台州",
  "武汉",
  "泰安",
  "郑州",
  "天津"
];

//内容数据资源
class PageD extends StatefulWidget {
  const PageD({super.key, required this.title});
  //公用的待配置公开属性的声明
  final String title;
  @override
  State<PageD> createState() => _PageDState();
}

//视图渲染所在的结构实例
class _PageDState extends State<PageD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('ListView水平滚动:'),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _buildList(),
                ), //ListView水平滚动
              ),
              const Text('ListView垂直滚动:'),
              SizedBox(
                width: 85,
                height: 300,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: _buildList(),
                ), //ListView水平滚动
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  child: const Text('下一页'),
                ), //凸起按钮
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    return cities.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 45,
      width: 160,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: const TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  //函数级构造器(级别低于类级别)
  void _nextPage() {
    //正式的执行路由跳转
    Navigator.of(context).pushNamed('/b');
    //(setState状态写入事件)引用码更改状态环境：执行引用setState的坑回调事件内的回调指令码后重运行同类结构中的编译bulid事件的渲染命令界面渲染的更新
    // setState(() {
    // });
  }
}
