//flutter项目 dart文件参考模版
// MaterialDesign库
import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//更基本Widget：Widgets集
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//ios样式Widget(某些定制化独特风格)：Cupertino库
import 'package:flutter/cupertino.dart';
//自定义Widget文件(库)

//自定义辅助文件
//哈希结构表：本质 字符码值索引列表
//String.fromCharCode(89)码值数转换为字符元素
//持有地址内容 具有指针性

//dart:convert  dart语言中convert转换库
// ascii.decode([89])码值数组转换为字符元素串
// ascii.encode('T INCLUD')字符元素串 转换为码值数组

//(循环)执行体 运行1轮所需时间O(1) //O(1) 单轮下业务的基础时间段概念
// 执行体 运行N轮所需时间O(N) 时间复杂度
//N:通用逻辑下对应的循环轮数所在的层级
//O(1) O(N) O(N^2) O(NlogN)....
// O(N)中的N轮数越少暗示着业务完成运行所需要循环的轮数越少(算法越精妙优良)
//哈希结构表底层采用的是映射机制通过映射关系帮助设备在O(1)内查找到某个目标元素(效率最高)
//哈希结构的缺点：需额外的消耗内存
//普通变量强调(堆内存里面的)内容
//指针变量强调(堆内存本身的入口)地址
//*指针变量 等同于 普通变量
//查找 顺序 二分 哈希结构表 二叉排序树
//排序研究数据内容的本身而非索引内存区
//无序直接遍历n^2
//有序直接遍历logn
//有序特征管控下位置的生效数据
//选定参考数据: 参考数据的有序位置 (开始低位段(开辟)索引内存区(数量)存放小数据(比参考数据小的数据/小于参考数据的数据))
//partition 瓜分
//索引号 等效 指针地址
//有序特性：升序：大于前面所有的其他数据小于后面所有的其他数据；降序：小于前面所有的其他数据大于后面所有的其他数据
//快速排序本质：递归+二分(临界数)瓜分)
//Dart不支持指针层的访问传递(Dart不支持操作指针)
const cities = [
  "位运算符求和",
  "数据交换位置(2个整数据(非数组内容))",
  "数据交换位置(2个整数据(非数组内容))",
  "快速排序(递归+二分(临界数)瓜分)",
  "统计出现1次的第1个字符",
  "统计出现1次的全部字符",
  "引入三方变量c 实现 内容交换",
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
class PageAlgorithm extends StatefulWidget {
  const PageAlgorithm({super.key, required this.title});

  //公用的待配置公开属性的声明
  final String title;
  @override
  State<PageAlgorithm> createState() => _PageAlgorithmState();
}

//视图渲染所在的结构实例
class _PageAlgorithmState extends State<PageAlgorithm> {
  @override
  Widget build(BuildContext context) {
    var physicalSize = View.of(context).physicalSize;
    var devicePixelRatio = View.of(context).devicePixelRatio;
    //计算出ios/android屏幕宽高 (pt/dp)
    var screenW = physicalSize.width / devicePixelRatio;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: screenW - 20,
          height: 600,
          child: LtStructure(
            onTap: (value, index) {
              switch (index) {
                case 0:
                  {
                    if (kDebugMode) {
                      print(add(0, 5));
                    }
                    break;
                  }
                case 1:
                  {
                    swap1(10, 6);
                    break;
                  }
                case 2:
                  {
                    swap2(14, 9);
                    break;
                  }
                case 3:
                  {
                    var data = [3, 5, 1, 1, 8, 9, 0, 2, 4];
                    quickSort(data, 0, 8);
                    if (kDebugMode) {
                      print(data);
                    }
                    break;
                  }
                case 4:
                  {
                    if (kDebugMode) {
                      print(notRepeatingFirstChar('aaaddghjjk'));
                    }
                    break;
                  }
                case 5:
                  {
                    if (kDebugMode) {
                      print(notRepeatingChars(''));
                    }
                    break;
                  }
                case 6:
                  {
                    swap(14, 9);
                    break;
                  }
                case 7:
                  break;
                case 8:
                  break;
                case 9:
                  break;
                case 10:
                  break;
                case 11:
                  break;
                case 12:
                  break;
                case 13:
                  break;
                case 14:
                  break;
                case 15:
                  break;
              }
            },
          ), //ListView作二次扩展封装更接近业务层的LtStructure表插件
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   var physicalSize = View.of(context).physicalSize;
  //   var devicePixelRatio = View.of(context).devicePixelRatio;
  //   //计算出ios/android屏幕宽高 (pt/dp)
  //   var screenW = physicalSize.width / devicePixelRatio;
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Colors.teal,
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: SizedBox(
  //         width: screenW - 20,
  //         height: 600,
  //         child: ListView.builder(
  //           scrollDirection: Axis.vertical,
  //           itemBuilder: itemBuilder2,
  //           itemCount: cities.length,
  //         ), //ListView水平滚动
  //       ),
  //     ),
  //   );
  // }

  Widget? itemBuilder0(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        //点击回调处理
        if (kDebugMode) {
          print(cities[index]);
        }
      },
      child: Container(
        height: 45,
        width: 160,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.teal),
        child: Text(cities[index]),
      ),
    );
  }

  Widget? itemBuilder1(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        //点击回调处理
        if (kDebugMode) {
          print(cities[index]);
        }
      },
      child: Container(
        height: 45,
        width: 160,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.teal),
        child: Text(cities[index]),
      ),
    );
  }

  Widget? itemBuilder2(BuildContext context, int index) {
    return InkResponse(
      onTap: () {
        //点击回调处理
        if (kDebugMode) {
          print(cities[index]);
        }
      },
      child: Container(
        height: 45,
        width: 160,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.teal),
        child: Text(cities[index]),
      ),
    );
  }

  int add(int a, int b) {
    int sum, carry; //sum累和，carry待迭入
    do {
      sum = a ^ b; //运算‘异或’

      carry = (a & b) << 1; //运算‘与&’ 运算‘左移<<’
      a = sum;
      b = carry;
    } while (b != 0);
    return sum;
  }

  void swap(int a, int b) {
    //额外引入三方辅助变量c实现交换
    var c = a;
    a = b;
    b = c;

    if (kDebugMode) {
      //交换后的内容处于临变量ab内存中
      print("a:$a,b:$b");
    }
  }

  void swap1(int a, int b) {
    //2个整数据(非数组内容)
    a = a + b;
    b = a - b;
    a = a - b;

    if (kDebugMode) {
      print("a:$a,b:$b");
    }
  }

  void swap2(int a, int b) {
    //2个整数据(非数组内容)
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;

    if (kDebugMode) {
      print("a:$a,b:$b");
    }
  }

  //end<= a.length
  String notRepeatingFirstChar(String toSearch) {
    int hashTableSize = 256;
    List<int> onHands = ascii.encode(toSearch);
    List<int> hashTable = [];
    for (int i = 0; i < hashTableSize; i++) {
      hashTable.add(0);
    }

    for (int i = 0; i < onHands.length; i++) {
      hashTable[onHands[i]]++;
    }
    for (int i = 0; i < hashTableSize; i++) {
      if (hashTable[i] == 1) {
        return String.fromCharCode(i);
      }
    }
    return '';
  }

  List<String> notRepeatingChars(String toSearch) {
    int hashTableSize = 256;
    List<int> onHands = ascii.encode(toSearch);
    List<int> hashTable = [];
    for (int i = 0; i < hashTableSize; i++) {
      hashTable.add(0);
    }

    for (int i = 0; i < onHands.length; i++) {
      hashTable[onHands[i]]++;
    }
    List<String> notRepeatingChars = [];
    for (int i = 0; i < hashTableSize; i++) {
      if (hashTable[i] == 1) {
        notRepeatingChars.add(String.fromCharCode(i));
      }
    }
    return notRepeatingChars;
  }

  //获取[min max]闭合范围内随机数
  int randomIntClose(int min, int max) {
    var result = min + Random().nextInt(max - min + 1);
    return result;
  }

  //获取[min max)半闭合半开口范围内随机数
  int randomInt(int min, int max) {
    var result = min + Random().nextInt(max - min);
    return result;
  }

  //二分(临界数)瓜分算法 事件>确定下1个有序数据(编号)
  //一段连续的无序数据可通过 二分(临界数)瓜分机制处理
  int partition(List<int> data, int start, int end) {
    if (data.isEmpty || start < 0) {
      if (kDebugMode) {
        print('Invalid Parameters');
      }
    }
    //瓜分机制中范围区内最后的索引内存区先默认存放已选定参考数据: 1个位置的有序数据(特征前面所有/后面所有)
    //***瓜分机制结束后产生 临界数、左无序(小数据)部分、右无序(大数据)部分***
    //左低位段索引内存范围区存放小数据
    //右高位段索引内存范围区存放大数据
    //瓜分机制中待二分范围区内最后的索引内存区先默认存放已选定参考数据
    int idx = randomIntClose(start, end);
    //交换data[idx]/data[end]
    //引入辅助变量idxend实现交换
    var idxend = data[idx];
    data[idx] = data[end];
    data[end] = idxend;

    //无序(小数据)左部分区small索引码
    int small = start - 1;
    for (int index = start; index < end; index++) {
      if (data[index] < data[end]) {
        ++small;
        if (small != index) {
          //引入辅助变量indexsmall实现交换
          var indexsmall = data[index];
          data[index] = data[small];
          data[small] = indexsmall;
        }
      }
    }

    ++small;
    //引入辅助变量smallend实现交换
    var smallend = data[small];
    data[small] = data[end];
    data[end] = smallend;

    return small;
  }

  //1个实例 对应着1个堆内存区 对应着1个上下文环境(体系)
  //不同实例 对应着不同堆内存区 对应着不同上下文环境(体系)
  //递归+二分(临界数)瓜分
  quickSort(List<int> data, int start, int end) {
    if (start == end) {
      return;
    }
    int index = partition(data, start, end);

    if (index > start) {
      //递归：内部自调用(递归概念：分析逻辑：由全部至细节部分; 完成顺序：由细节部分至全部)
      quickSort(data, start, index - 1);
    }
    if (index < end) {
      //递归：内嵌自调用(螺旋式循环)的概念(底层细节先完成)
      quickSort(data, index + 1, end);
    }
  }
}

//****通过回调函数实现逆向传值(内容数据反馈回UI左上前业务层逻辑)***

//构造器类(组件)
//(自定义)插件 集成类 > (自定义)插件 实例
//StatelessWidget(常规型)无态SW插件>充当子层插件(上层内嵌插件)>未直接关联状态 (不依赖状态配置信息>间接内嵌渲染插件)
class LtStructure extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const LtStructure({super.key, @required this.onTap});
  //通过回调函数实现逆向传值(内容数据反馈回UI左上前业务层逻辑)
  //void Function()? 事件本身所遵循的结构特征
  final void Function(String, int)? onTap;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return LtItem(
          value: cities[index],
          onTap: (value, index) {
            onTap!(value, index);
          },
          index: index,
        );
      },
      itemCount: cities.length,
    );
  }
}

class LtItem extends StatelessWidget {
  //自调用(Self)
  //(自定义)待配置公开属性默认可选
  const LtItem(
      {super.key,
      @required this.onTap,
      required this.value,
      required this.index});

  final String value;
  final int index;
  //void Function()? 事件本身所遵循的结构特征
  final void Function(String, int)? onTap;

  //生产编码
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //点击回调处理
        onTap!(value, index);
      },
      child: ListTile(
        title: Text(value),
      ),
    );
  }
}
