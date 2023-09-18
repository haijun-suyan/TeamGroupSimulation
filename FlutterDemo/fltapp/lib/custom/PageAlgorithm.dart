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

// data.sort() dart语言系统层面提供的排序事件
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
//for循环语句体：每一轮执行区对应着全新不同的上下文环境，循环体执行区内声明的临时量只适用于所在轮(数据状态不稳)
//递归每一次对应着全新不同的上下文环境
//数据的研究是连续的一段
//左侧段/右侧段 对应 大循环体/递归 下一轮
//临界二分机制：临界+左右侧
//冒泡机制：临界+右侧
//索引内存区的总数量不变
//升序列表经过(n-1)轮逆向旋转后形成(n-1)轮旋转列表 //(1,2,...,n-1)轮旋转列表
//n个数据的升序列表经历n轮旋转重新还原[1,2,3,4,5]  5轮旋转=> [1,2,3,4,5]
//递归 for循环语句的循环体
//for循环使用广泛；递归循环事件不适合指定返回值
//int start, int end 待研究数据段(start编号 end编号)
//旋转列表data[start]>=data[end]
//有序数据段 旋转获得 旋转数据段
//递归特性：1.类循环体 2.底层数据return向外(上)层作传递
//一般情况下递归用于处理纯动作的循环(涉及指定数据的捕获通过for循环)
//查找的基础外加外层大循环即形成排序
//排序的过程比查找的过程更加复杂
//不同的上下文环境 可同级可嵌套
const cities = [
  "位运算符求和",
  "数据交换位置(2个整数据(非数组内容))",
  "数据交换位置(2个整数据(非数组内容))",
  "快速排序(递归二分)(递归+二分(临界数)瓜分)",
  "统计出现1次的第1个字符",
  "统计出现1次的全部字符",
  "引入三方变量c 实现 内容交换(推荐)",
  "列表中出现次数超过一半的数字",
  "列表中出现频率超过一半的数字(优化)",
  "列表中最小的K个数",
  "冒泡事件获取(有序)(最小)临界",
  "冒泡排序(递归冒泡)",
  "临界二分事件获取(有序)(最小)值logn",
  "旋转数据段取最小值",
  "旋转列表取最小值(推荐)",
  "旋转列表取最小值(递归)(不推荐)"
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
                  {
                    if (kDebugMode) {
                      print(moreThanHalfNum([0, 5, 5, 1, 5, 0, 5, 0, 5, 2, 5]));
                    }
                    break;
                  }
                case 8:
                  {
                    if (kDebugMode) {
                      print(moreThanHalfNumSuggest(
                          [0, 5, 5, 1, 5, 0, 5, 0, 5, 2, 5]));
                    }
                    break;
                  }
                case 9:
                  {
                    if (kDebugMode) {
                      print(getLeastKNumbers(
                          [0, 5, 5, 1, 5, 0, 5, 0, 5, 2, 5], 4));
                    }
                    break;
                  }
                case 10:
                  {
                    if (kDebugMode) {
                      print(bubbleContiguousExchange(
                          [-8, 5, 7, 1, 8, 0, 9, 0, 5, 10, 50], 0, 10));
                    }
                    break;
                  }
                case 11:
                  {
                    var data = [1, 3, 7, 9, 13, 10, 12, 45, 34, 12, 14];
                    bubbleSort(data, 4, 10);
                    if (kDebugMode) {
                      print(data);
                    }
                    break;
                  }
                case 12:
                  {
                    if (kDebugMode) {
                      print(getLeastKNumbers(
                          [0, 5, 5, 1, 5, 0, -9, 0, 5, 2, 5], 1));
                    }
                    break;
                  }
                case 13:
                  {
                    if (kDebugMode) {
                      print(rotationListRecommend(
                          [3, 4, 5, 6, 7, 8, 1, 2], 3, 7));
                    }
                    break;
                  }
                case 14:
                  {
                    if (kDebugMode) {
                      print(rotationListRecommend(
                          [1, 2, 3, 4, 5, 6, 7, 8], 0, 7));
                    }
                    break;
                  }
                case 15:
                  {
                    if (kDebugMode) {
                      print(rotationListRecursion([1, 1, 1, 0, 1], 0, 4));
                    }
                    break;
                  }
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

  moreThanHalfNum(List<int> data) {
    quickSort(data, 0, data.length - 1);

    Map<String, int> elementNum = {};
    int element = 0;
    int cnt = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i] == element) {
        cnt++;
      } else {
        elementNum[element.toString()] = cnt;
        element = data[i];
        cnt = 1;
      }
      if (i == data.length - 1) {
        elementNum[element.toString()] = cnt;
      }
    }
    //data.keys表示key的无序集Iterable<K> 举例：(0, 1, 2, 5)
    //data.keys.toList()表示转成List<K> 举例：[0, 1, 2, 5]
    for (int i = 0; i < elementNum.keys.toList().length; i++) {
      var elementKey = elementNum.keys.toList()[i];
      if (elementNum[elementKey]! > data.length / 2) {
        return int.tryParse(elementKey);
      }
    }
    return null;
  }

  bool checkMoreThanHalf(List<int> data, int num) {
    int times = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i] == num) {
        times++;
      }
    }
    bool isMoreThanHalf = true;
    if (times * 2 <= data.length) {
      isMoreThanHalf = false;
    }
    return isMoreThanHalf;
  }

  moreThanHalfNumSuggest(List<int> data) {
    if (data.isEmpty) {
      return null;
    }

    int middle = data.length >> 1;
    int start = 0;
    int end = data.length - 1;
    int index = partition(data, start, end);
    while (index != middle) {
      if (index > middle) {
        index = partition(data, start, index - 1);
      } else {
        index = partition(data, index + 1, end);
      }
    }

    int result = data[middle];
    if (checkMoreThanHalf(data, result)) {
      return result;
    } else {
      return null;
    }
  }

  getLeastKNumbers(List<int> data, int k) {
    if (data.isEmpty || k > data.length || k <= 0) {
      return null;
    }
    int start = 0;
    int end = data.length - 1;
    int index = partition(data, start, end);
    //while循环(事先)不知具体轮数
    while (index != k - 1) {
      if (index > k - 1) {
        index = partition(data, start, index - 1);
      } else {
        index = partition(data, index + 1, end);
      }
    }

    List<int> outputData = [];
    for (int i = 0; i < k; i++) {
      outputData.add(data[i]);
    }
    return outputData;
  }

  //冒泡机制：临界+右侧
  //相邻交换冒泡事件(end-start个相邻交换)：(有序)(最小)临界+右侧
  bubbleContiguousExchange(List<int> data, int start, int end) {
    if (data.isEmpty) {
      return null;
    }
    if (start == end) {
      return data[start];
    }

    for (int i = 0; i < end - start; i++) {
      if (data[end - i] < data[end - i - 1]) {
        var temp = data[end - i - 1];
        data[end - i - 1] = data[end - i];
        data[end - i] = temp;
      }
    }

    //1段无序数据的冒泡过程结束(end-start个相邻交换)
    //(有序)(最小)临界+右侧区
    //当前上下文环境
    return data[start];
  }

  //冒泡之排序：for循环/递归+冒泡
  bubbleSort(List<int> data, int start, int end) {
    if (data.isEmpty) {
      return;
    }
    for (int i = 0; i < end - start; i++) {
      //引用交换冒泡事件
      bubbleContiguousExchange(data, start + i, end);
    }
    //当前上下文环境(状态瞬间)
    return data;
  }

  //(常规顺序)列表的数据段内最小值
  int minByRoutineOrder(List<int> data, int start, int end) {
    int min = data[start];
    //for循环(事先)知具体轮数
    for (int i = start + 1; i <= end; i++) {
      if (data[i] < min) {
        min = data[i];
      }
    }
    return min;
  }

  //旋转数据段(推荐)
  rotationListRecommend(List<int> data, int start, int end) {
    if (data.isEmpty) {
      return null;
    }
    //中位编号(内存)
    int indexMid = start;
    while (data[start] >= data[end]) {
      if (end - start == 1) {
        indexMid = end;
        break;
      }
      int lengthAnalyzed = end - start + 1;
      indexMid = (lengthAnalyzed >> 1) + start;
      if (data[indexMid] == data[start] && data[start] == data[end]) {
        //普通顺序查找(相对临时量的逐个顺序的比较)
        return minByRoutineOrder(data, start, end);
      }

      if (data[indexMid] >= data[start]) {
        //下轮研究中位后数据的范围
        start = indexMid;
      } else if (data[indexMid] <= data[end]) {
        end = indexMid;
      }
    }

    return data[indexMid];
  }

  //(自定义)递归事件
  //旋转列表的旋转数据段
  rotationListRecursion(List<int> data, int start, int end) {
    if (data.isEmpty) {
      return null;
    }

    /****类似for循环单轮内的执行逻辑区****/
    /****类似for循环单轮内的执行逻辑(开始)****/
    //中位编号(内存)
    int indexMid = start;
    if (end - start == 1) {
      indexMid = end;
      return data[indexMid];
    }
    int lengthAnalyzed = end - start + 1;
    indexMid = (lengthAnalyzed >> 1) + start;
    if (data[indexMid] == data[start] && data[start] == data[end]) {
      //普通顺序查找(相对临时量的逐个顺序的比较)
      return minByRoutineOrder(data, start, end);
    }
    /****类似for循环单轮内的执行逻辑(结束)****/

    /****递归命令码引用区*****/
    /****递归命令码引用处(开始)*****/
    if (data[indexMid] >= data[start]) {
      //下轮研究中位后数据的范围
      //递归(底层数据向外层作传递)
      //引用递归命令码
      //开启全新的上下文环境
      return rotationListRecursion(data, indexMid, end);
    } else if (data[indexMid] <= data[end]) {
      //递归命令码引用处
      //开启全新的上下文环境
      return rotationListRecursion(data, start, indexMid);
    }
    /****递归命令码引用处(结束)*****/
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
