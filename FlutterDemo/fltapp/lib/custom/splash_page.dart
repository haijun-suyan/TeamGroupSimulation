import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'Unity.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // -----(原生页面实现操作)flutter提供IMP功能(数据的双向通信)-----
  late VoidCallback removeListener;
  Future<dynamic> flutterCustomMethod(Map<dynamic, dynamic> arguments) async {
    if (kDebugMode) {
      print('===arguments:$arguments');
    }
    Unity().showDialogCustom(context, "NativeToFlutter(Event)",
        '$arguments["content"]["happy"]', () {}, () {});

    return 100;
  }

  @override
  void initState() {
    super.initState();
    Logger.log('boost-SplashPage $mounted');
  }

  @override
  Widget build(BuildContext context) {
    Logger.log('boost-SplashPage $mounted');

    //数据的双向通信
    //----flutter提供IMP-----
    //Event>NativeToFlutter>Native(主动发送)send：首次addEventListener失效
    //不推荐
    removeListener =
        BoostChannel.instance.addEventListener("splash", (key, arguments) {
          //接收处理
          return flutterCustomMethod(arguments);
        });

    return Scaffold(
      appBar: AppBar(
        title:  Text("Flutter 页面"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
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
                BoostNavigator.instance.push("native");
              },
              child: const Text(textAlign: TextAlign.center,"打开源生页面"),
            ),
          ),
        ],
      ),
    );
  }
}
