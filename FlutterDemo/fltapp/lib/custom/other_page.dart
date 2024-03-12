import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class OtherPage extends StatefulWidget {

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {

  @override
  void initState() {
    super.initState();
    Logger.log('boost-OtherPage $mounted');
  }

  @override
  Widget build(BuildContext context) {
    Logger.log('boost-OtherPage $mounted');
    return Scaffold(
      appBar: AppBar(
        title:  Text("Flutter OtherPage页"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          GestureDetector(
            onTap: (){
              //name: "原生页的解析别名"
              BoostNavigator.instance.push("NativeViewControllerTwo");
            },
            child: Text(
              "切换进入NativeTwo"
            ),
          )
        ],
      ),
    );
  }
}
