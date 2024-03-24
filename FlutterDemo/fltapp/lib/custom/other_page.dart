import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';

import 'Unity.dart';

class OtherPage extends StatefulWidget {
  const OtherPage({super.key, required this.title, required this.settings});

  //公用的待配置公开属性的声明
  final String title;
  final RouteSettings settings;

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  // -----(原生页面实现操作)flutter提供IMP功能(数据的双向通信)-----
  late VoidCallback removeListener;
  Future<dynamic> flutterCustomMethod(Map<dynamic, dynamic> arguments) async {
    if (kDebugMode) {
      print('===arguments:$arguments');
    }
    //原生载体采用embed情景addChild实现对flutter的内嵌即此时主载体依旧为原生载体则flutter的Dialog弹窗失效
    Unity().showDialogCustom(context, "NativeToFlutter(Event)",
        '$arguments["content"]["happy"]', () {}, () {});

    return 100;
  }

  @override
  void initState() {
    super.initState();
    Logger.log('boost-OtherPage $mounted');
  }

  @override
  Widget build(BuildContext context) {
    Logger.log('boost-OtherPage $mounted');

    if (kDebugMode) {
      print('settings.arguments:${widget.settings.arguments}');
    }

    //数据的双向通信
    //----flutter提供IMP-----
    //Event>NativeToFlutter>Native(主动发送)send：首次addEventListener失效
    //不推荐
    removeListener =
        BoostChannel.instance.addEventListener("otherPage", (key, arguments) {
          //接收处理
      return flutterCustomMethod(arguments);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: ColorsCustom.darkYellow,
      body: Flex(
        direction: Axis.vertical,
        children: [
          SizedBox(
            width: Unity().screenWidth(context),
            height: 45,
            child: GestureDetector(
              onTap: () {
                //name: "原生页的解析别名"
                BoostNavigator.instance.push("NativeViewControllerTwo",
                    arguments: {"name": "zpy", "gender": "女", "age": "25"});
                // BoostNavigator.instance.pop
              },
              child: const Text(textAlign: TextAlign.center, "切换进入NativeTwo"),
            ),
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
          SizedBox(
            width: Unity().screenWidth(context),
            height: 45,
            child: GestureDetector(
              onTap: () {
                //原生载体采用embed情景addChild实现对flutter的内嵌
                //----Native提供IMP----数据的双向通信
                //Event>FlutterToNative>Flutter(主动发送)send
                BoostChannel.instance.sendEventToNative("NativeViewControllerOne", {
                  "content": {"happy": "我很难过"}
                });
              },
              child: const Text(textAlign: TextAlign.center,"回到上级页(embed情景)"),
            ),
          ),
        ],
      ),
    );
  }
}
