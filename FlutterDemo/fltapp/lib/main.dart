// MaterialDesign库
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//更基本Widget：Widgets集
import 'package:flutter/widgets.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
//ios样式Widget(某些定制化独特风格)：Cupertino库
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//开源库
import 'package:mockito/mockito.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:build_runner/build_runner.dart';

//自定义Widget文件(库)
import 'custom/MyHomePage.dart';
import 'custom/pageA.dart';
import 'custom/pageB.dart';
import 'custom/pageC.dart';
import 'custom/pageD.dart';
import 'custom/PageAlgorithm.dart';

//应用最终的效果现象：本质上决定于内存 而非别名符(别名符具有任意性)
//响应式开发特性：1.API调用 2.渲染快速重载
//渲染快速重载(受到设备本身CPU性能的影响)只在项目较小并处于简单的测试玩耍时生效，其余时候快速重载可能会失效(只能采用编译重启机制)
//flutter项目 main.dart文件内进行编码的修改及首页title修改自动重载，其余dart文件内的编码改动重载失效(CPU性能不支持/只能采取重启)(重载适合于较小demo项目)
//导入自定义的Widget插件类：SW插件类
//备注：无论多少导入命令，Dart只会导入应用中真正使用的widget(有态SW插件/无态普通SW插件/无态特殊SW插件)
//抽象类：基本通用的框架容器(外层包裹容器)
//具体类：具体研究方向下的内容构造器(内层内容构造器)
//从应用角度而言，抽象类呈现出什么效果取决于置入什么具体类(类似基类和自定义类之间的多态关系)
//SW插件若直接持有本身实例>本身直接重构build事件
//SW插件若间接持有子类实例>子类间接重构build事件
//SingleChildScrollView滚动性插件作过渡层(垂直/水平滚动)scrollDirection:Axis.
//ListView 垂直/水平滚动
//Container容器辅助性插件过渡层(特定业务场景下 需手动限定布局 绘制特性、定位、尺寸范围)
//SizedBox容器辅助性插件过渡层(特定业务场景下 需手动限定布局 尺寸范围)
//FadeInImage.assetNetwork 加载网络图片(占位图) 系统 功能弱
//FadeInImage.memoryNetwork 加载网络图片(占位图) 三方开源库 功能强 容错性高
//原本iOS/Android资源图转入Flutter项目本身二方库内
//device pixel ratio 设备像素比(物理像素/逻辑像素)
//Localizations.of()访问提供代理的特定本地化类
//Text 系统提供的无态插件类(不会自动触发其内build事件/必需手动访问引用/无态插件只是单纯的呈现本身所对应build构造函数中待呈现的内容)
//无态插件实现渲染变更则子内嵌于其他的有态插件中
//有态插件 内嵌着 无态插件
//dart入口函数(仅单次执行)
//XML可扩展标记语言(ExtensibleMarkupLanguage)(标签对语言<></>)
//Map 映射/路径链接  指向 构造器 类有态插件
//(子)内嵌 非界面间
//访问路由路径切换不同的界面插件(不同的屏幕间切换)：构造器Route和Navigator
//route路由应用程序中抽象出的辅助管理器(管理着屏幕页面的活跃性)
//绑定有路由路径(链)的插件实例可以通过所绑定的路由路径传递给MaterialApp实例(屏幕页面的切换)
//context 整个应用生效(同个内存区) 底层自动写入(应用上层直接读取使用即可)
//Expanded缩放插件(存在局限性(适用于少量情况))
//Flexible弹性插件
//1 元类规则区(栈):多 内容堆区
//GitLab 或 GitHub  勾联着Git环境的 云 Lab 或Hub 托管平台
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Dart日志函数
  runApp(const MyApp());
}

//内容数据资源
//MyApp 特殊的无态SW插件 类(构造器) (仅单次执行(应用刚启动时执行1次))
//(自定义)MyApp特殊的无态SW插件 集成类 > (自定义)无态 SW插件实例
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get plural => null;

  // 应用程序的根主入口
  @override
  //重构插件编译build事件实例(系统自动触发)
  Widget build(BuildContext context) {
    //kDebugMode调试模式


    return MaterialApp(
        // localizationsDelegates: [
        //   MaterialLocalizationItDelegate(),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ], //实际的本地化值
        // supportedLocales: const [
        //   Locale('zh', 'CN'), //China
        //   Locale('en', 'US'), //English
        //   Locale('he', 'IL'), //Hebrew
        // ], //应用App已支持哪些地区
        title: '庄佩云',
        theme: ThemeData(
          //数据源
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.pink, inversePrimary: Colors.orange),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: Strings.welcomeMessage),
        routes: <String, WidgetBuilder>{
          //路由元素a
          '/a': (BuildContext context) => const PageA(title: '图加载(flutter页)'),
          //路由元素b
          '/b': (BuildContext context) => const PageB(title: 'Button按钮插件(flutter页)'),
          //路由元素c
          '/c': (BuildContext context) => const PageC(title: 'pageC(flutter页)'),
          //路由元素d
          '/d': (BuildContext context) => const PageD(title: 'ListView表视图(flutter页)'),
          //路由元素e
          '/e': (BuildContext context) =>
              const PageAlgorithm(title: 'Algorithm算法(flutter页)')
        });
  }
}


// InfosLocalizationsDelegate

class MaterialLocalizationItDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const MaterialLocalizationItDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['zh', 'en', 'he'].contains(locale.languageCode);

  @override
  Future<MaterialLocalizations> load(Locale locale) async => MaterialLocalizationIt();

  @override
  bool shouldReload(_) => false;
}

class MaterialLocalizationIt extends MaterialLocalizations {
  @override
  String aboutListTileTitle(String applicationName) {
    // TODO: implement aboutListTileTitle
    throw UnimplementedError();
  }

  @override
  // TODO: implement alertDialogLabel
  String get alertDialogLabel => throw UnimplementedError();

  @override
  // TODO: implement anteMeridiemAbbreviation
  String get anteMeridiemAbbreviation => throw UnimplementedError();

  @override
  // TODO: implement backButtonTooltip
  String get backButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement bottomSheetLabel
  String get bottomSheetLabel => throw UnimplementedError();

  @override
  // TODO: implement calendarModeButtonLabel
  String get calendarModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement cancelButtonLabel
  String get cancelButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement closeButtonLabel
  String get closeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement closeButtonTooltip
  String get closeButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement continueButtonLabel
  String get continueButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement copyButtonLabel
  String get copyButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement currentDateLabel
  String get currentDateLabel => throw UnimplementedError();

  @override
  // TODO: implement cutButtonLabel
  String get cutButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement dateHelpText
  String get dateHelpText => throw UnimplementedError();

  @override
  // TODO: implement dateInputLabel
  String get dateInputLabel => throw UnimplementedError();

  @override
  // TODO: implement dateOutOfRangeLabel
  String get dateOutOfRangeLabel => throw UnimplementedError();

  @override
  // TODO: implement datePickerHelpText
  String get datePickerHelpText => throw UnimplementedError();

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) {
    // TODO: implement dateRangeEndDateSemanticLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement dateRangeEndLabel
  String get dateRangeEndLabel => throw UnimplementedError();

  @override
  // TODO: implement dateRangePickerHelpText
  String get dateRangePickerHelpText => throw UnimplementedError();

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) {
    // TODO: implement dateRangeStartDateSemanticLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement dateRangeStartLabel
  String get dateRangeStartLabel => throw UnimplementedError();

  @override
  // TODO: implement dateSeparator
  String get dateSeparator => throw UnimplementedError();

  @override
  // TODO: implement deleteButtonTooltip
  String get deleteButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement dialModeButtonLabel
  String get dialModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement dialogLabel
  String get dialogLabel => throw UnimplementedError();

  @override
  // TODO: implement drawerLabel
  String get drawerLabel => throw UnimplementedError();

  @override
  // TODO: implement firstDayOfWeekIndex
  int get firstDayOfWeekIndex => throw UnimplementedError();

  @override
  // TODO: implement firstPageTooltip
  String get firstPageTooltip => throw UnimplementedError();

  @override
  String formatCompactDate(DateTime date) {
    // TODO: implement formatCompactDate
    throw UnimplementedError();
  }

  @override
  String formatDecimal(int number) {
    // TODO: implement formatDecimal
    throw UnimplementedError();
  }

  @override
  String formatFullDate(DateTime date) {
    // TODO: implement formatFullDate
    throw UnimplementedError();
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    // TODO: implement formatHour
    throw UnimplementedError();
  }

  @override
  String formatMediumDate(DateTime date) {
    // TODO: implement formatMediumDate
    throw UnimplementedError();
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    // TODO: implement formatMinute
    throw UnimplementedError();
  }

  @override
  String formatMonthYear(DateTime date) {
    // TODO: implement formatMonthYear
    throw UnimplementedError();
  }

  @override
  String formatShortDate(DateTime date) {
    // TODO: implement formatShortDate
    throw UnimplementedError();
  }

  @override
  String formatShortMonthDay(DateTime date) {
    // TODO: implement formatShortMonthDay
    throw UnimplementedError();
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    // TODO: implement formatTimeOfDay
    throw UnimplementedError();
  }

  @override
  String formatYear(DateTime date) {
    // TODO: implement formatYear
    throw UnimplementedError();
  }

  @override
  // TODO: implement hideAccountsLabel
  String get hideAccountsLabel => throw UnimplementedError();

  @override
  // TODO: implement inputDateModeButtonLabel
  String get inputDateModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement inputTimeModeButtonLabel
  String get inputTimeModeButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement invalidDateFormatLabel
  String get invalidDateFormatLabel => throw UnimplementedError();

  @override
  // TODO: implement invalidDateRangeLabel
  String get invalidDateRangeLabel => throw UnimplementedError();

  @override
  // TODO: implement invalidTimeLabel
  String get invalidTimeLabel => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyAlt
  String get keyboardKeyAlt => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyAltGraph
  String get keyboardKeyAltGraph => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyBackspace
  String get keyboardKeyBackspace => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyCapsLock
  String get keyboardKeyCapsLock => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyChannelDown
  String get keyboardKeyChannelDown => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyChannelUp
  String get keyboardKeyChannelUp => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyControl
  String get keyboardKeyControl => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyDelete
  String get keyboardKeyDelete => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyEject
  String get keyboardKeyEject => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyEnd
  String get keyboardKeyEnd => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyEscape
  String get keyboardKeyEscape => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyFn
  String get keyboardKeyFn => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyHome
  String get keyboardKeyHome => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyInsert
  String get keyboardKeyInsert => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyMeta
  String get keyboardKeyMeta => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyMetaMacOs
  String get keyboardKeyMetaMacOs => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyMetaWindows
  String get keyboardKeyMetaWindows => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumLock
  String get keyboardKeyNumLock => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad0
  String get keyboardKeyNumpad0 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad1
  String get keyboardKeyNumpad1 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad2
  String get keyboardKeyNumpad2 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad3
  String get keyboardKeyNumpad3 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad4
  String get keyboardKeyNumpad4 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad5
  String get keyboardKeyNumpad5 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad6
  String get keyboardKeyNumpad6 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad7
  String get keyboardKeyNumpad7 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad8
  String get keyboardKeyNumpad8 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpad9
  String get keyboardKeyNumpad9 => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadAdd
  String get keyboardKeyNumpadAdd => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadComma
  String get keyboardKeyNumpadComma => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadDecimal
  String get keyboardKeyNumpadDecimal => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadDivide
  String get keyboardKeyNumpadDivide => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadEnter
  String get keyboardKeyNumpadEnter => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadEqual
  String get keyboardKeyNumpadEqual => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadMultiply
  String get keyboardKeyNumpadMultiply => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadParenLeft
  String get keyboardKeyNumpadParenLeft => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadParenRight
  String get keyboardKeyNumpadParenRight => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyNumpadSubtract
  String get keyboardKeyNumpadSubtract => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyPageDown
  String get keyboardKeyPageDown => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyPageUp
  String get keyboardKeyPageUp => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyPower
  String get keyboardKeyPower => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyPowerOff
  String get keyboardKeyPowerOff => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyPrintScreen
  String get keyboardKeyPrintScreen => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyScrollLock
  String get keyboardKeyScrollLock => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeySelect
  String get keyboardKeySelect => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyShift
  String get keyboardKeyShift => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeySpace
  String get keyboardKeySpace => throw UnimplementedError();

  @override
  // TODO: implement lastPageTooltip
  String get lastPageTooltip => throw UnimplementedError();

  @override
  String licensesPackageDetailText(int licenseCount) {
    // TODO: implement licensesPackageDetailText
    throw UnimplementedError();
  }

  @override
  // TODO: implement licensesPageTitle
  String get licensesPageTitle => throw UnimplementedError();

  @override
  // TODO: implement menuBarMenuLabel
  String get menuBarMenuLabel => throw UnimplementedError();

  @override
  // TODO: implement modalBarrierDismissLabel
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement moreButtonTooltip
  String get moreButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement narrowWeekdays
  List<String> get narrowWeekdays => throw UnimplementedError();

  @override
  // TODO: implement nextMonthTooltip
  String get nextMonthTooltip => throw UnimplementedError();

  @override
  // TODO: implement nextPageTooltip
  String get nextPageTooltip => throw UnimplementedError();

  @override
  // TODO: implement okButtonLabel
  String get okButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement openAppDrawerTooltip
  String get openAppDrawerTooltip => throw UnimplementedError();

  @override
  String pageRowsInfoTitle(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    // TODO: implement pageRowsInfoTitle
    throw UnimplementedError();
  }

  @override
  DateTime? parseCompactDate(String? inputString) {
    // TODO: implement parseCompactDate
    throw UnimplementedError();
  }

  @override
  // TODO: implement pasteButtonLabel
  String get pasteButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement popupMenuLabel
  String get popupMenuLabel => throw UnimplementedError();

  @override
  // TODO: implement postMeridiemAbbreviation
  String get postMeridiemAbbreviation => throw UnimplementedError();

  @override
  // TODO: implement previousMonthTooltip
  String get previousMonthTooltip => throw UnimplementedError();

  @override
  // TODO: implement previousPageTooltip
  String get previousPageTooltip => throw UnimplementedError();

  @override
  // TODO: implement refreshIndicatorSemanticLabel
  String get refreshIndicatorSemanticLabel => throw UnimplementedError();

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    // TODO: implement remainingTextFieldCharacterCount
    throw UnimplementedError();
  }

  @override
  // TODO: implement reorderItemDown
  String get reorderItemDown => throw UnimplementedError();

  @override
  // TODO: implement reorderItemLeft
  String get reorderItemLeft => throw UnimplementedError();

  @override
  // TODO: implement reorderItemRight
  String get reorderItemRight => throw UnimplementedError();

  @override
  // TODO: implement reorderItemToEnd
  String get reorderItemToEnd => throw UnimplementedError();

  @override
  // TODO: implement reorderItemToStart
  String get reorderItemToStart => throw UnimplementedError();

  @override
  // TODO: implement reorderItemUp
  String get reorderItemUp => throw UnimplementedError();

  @override
  // TODO: implement rowsPerPageTitle
  String get rowsPerPageTitle => throw UnimplementedError();

  @override
  // TODO: implement saveButtonLabel
  String get saveButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement scrimLabel
  String get scrimLabel => throw UnimplementedError();

  @override
  String scrimOnTapHint(String modalRouteContentName) {
    // TODO: implement scrimOnTapHint
    throw UnimplementedError();
  }

  @override
  // TODO: implement scriptCategory
  ScriptCategory get scriptCategory => throw UnimplementedError();

  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => throw UnimplementedError();

  @override
  // TODO: implement selectAllButtonLabel
  String get selectAllButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement selectYearSemanticsLabel
  String get selectYearSemanticsLabel => throw UnimplementedError();

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    // TODO: implement selectedRowCountTitle
    throw UnimplementedError();
  }

  @override
  // TODO: implement showAccountsLabel
  String get showAccountsLabel => throw UnimplementedError();

  @override
  // TODO: implement showMenuTooltip
  String get showMenuTooltip => throw UnimplementedError();

  @override
  // TODO: implement signedInLabel
  String get signedInLabel => throw UnimplementedError();

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    // TODO: implement tabLabel
    throw UnimplementedError();
  }

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    // TODO: implement timeOfDayFormat
    throw UnimplementedError();
  }

  @override
  // TODO: implement timePickerDialHelpText
  String get timePickerDialHelpText => throw UnimplementedError();

  @override
  // TODO: implement timePickerHourLabel
  String get timePickerHourLabel => throw UnimplementedError();

  @override
  // TODO: implement timePickerHourModeAnnouncement
  String get timePickerHourModeAnnouncement => throw UnimplementedError();

  @override
  // TODO: implement timePickerInputHelpText
  String get timePickerInputHelpText => throw UnimplementedError();

  @override
  // TODO: implement timePickerMinuteLabel
  String get timePickerMinuteLabel => throw UnimplementedError();

  @override
  // TODO: implement timePickerMinuteModeAnnouncement
  String get timePickerMinuteModeAnnouncement => throw UnimplementedError();

  @override
  // TODO: implement unspecifiedDate
  String get unspecifiedDate => throw UnimplementedError();

  @override
  // TODO: implement unspecifiedDateRange
  String get unspecifiedDateRange => throw UnimplementedError();

  @override
  // TODO: implement viewLicensesButtonLabel
  String get viewLicensesButtonLabel => throw UnimplementedError();
  // alt-enter on intellij and implement many overrides (somthing like 57)
}


//(基)类 字符串资源
class Strings {
  //静态字段app_name
  static const String app_name = 'Flutter Demo';
  //静态字段welcomeMessage
  static const String welcomeMessage = 'FlutterHomePage';
}
