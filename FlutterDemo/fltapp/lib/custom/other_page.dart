import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';

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
  Future<dynamic> flutterCustomMethod(Map<dynamic,dynamic> arguments) async {
    if (kDebugMode) {
      print('===arguments:$arguments');
    }
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
    //NativeToFlutter
    removeListener = BoostChannel.instance.addEventListener("otherPage", (key, arguments) {
      return flutterCustomMethod(arguments);
    });

    //----Native提供IMP----
    //FlutterToNative
    BoostChannel.instance.sendEventToNative("NativeViewControllerOne",{"content":{"happy":"我很难过"}});

    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          GestureDetector(
            onTap: (){
              //name: "原生页的解析别名"
              BoostNavigator.instance.push("NativeViewControllerTwo",arguments:{"name": "zpy", "gender": "女", "age":"25"});
              // BoostNavigator.instance.pop
            },
            child: const Text(
              "切换进入NativeTwo"
            ),
          ),
          GestureDetector(
            onTap: (){
              // BoostNavigator.instance.pop(context);
              Navigator.of(context).pop();
            },
            child: const Text(
                "回到上级页"
            ),
          )
        ],
      ),
    );
  }
}
