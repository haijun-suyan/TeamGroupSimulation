import UIKit
import flutter_boost
//import FlutterPluginRegistrant
import Chrysan

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window.makeKeyAndVisible()
        //默认方法
        let delegate: MyFlutterBoostDelegate = MyFlutterBoostDelegate()
        FlutterBoost.instance().setup(application, delegate: delegate) { engine in

        }

        let vc: NativeViewControllerOne = NativeViewControllerOne()
        vc.tabBarItem = UITabBarItem(title: "原生One", image: UIImage(named: "native_icon_unselect"), selectedImage: UIImage(named: "native_icon_select"))

        let fvc: FBFlutterViewContainer = FBFlutterViewContainer()
        fvc.setName("myHomePage", uniqueId: nil, params: [:], opaque: true)
//        fvc.tabBarItem = UITabBarItem(title: , image: nil, tag: 1)
        fvc.tabBarItem = UITabBarItem(title: "flutter相关", image: UIImage(named: "flutter_icon_unselect"), selectedImage: UIImage(named: "flutter_icon_select"))
        let tabVC: UITabBarController = UITabBarController()
        tabVC.viewControllers = [vc,fvc]
        let rvc: UINavigationController = UINavigationController(rootViewController: tabVC)
        //隐藏NavigationController本身的导航栏
        rvc.isNavigationBarHidden = true

        delegate.navigationController = rvc
        self.window.rootViewController = rvc

        //下面是自定义option参数的方法
//        let options: FlutterBoostSetupOptions = FlutterBoostSetupOptions.createDefault()
//        options.dartEntryPoint = "main2"
//        FlutterBoost.instance().setup(application, delegate: delegate as? FlutterBoostDelegate, callback: { engine in
//        }, options: options)


//        let options: FlutterBoostRouteOptions = FlutterBoostRouteOptions()
//        options.pageName = "splash"
//        options.arguments = ["animated":1]
//        options.completion = { completion in
//        }
//        FlutterBoost.instance().open(options)
//        return true

        //MessageChannel 采用Boost消息通道(数据双向传递)
        //Flutter主动发送(Boost)
        //双向数据+双向imp操作(推荐优先)
        let messageChannel: FlutterBasicMessageChannel = FlutterBasicMessageChannel(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger: fvc.binaryMessenger)
        //数据：FlutterToNative
        messageChannel.setMessageHandler { message, callback in
            //处理接收到的消息
            //nativeIMP
            print("Received:\(String(describing: message))")
            self.keyWindowInstance().chrysan.showHUD(Status(id:.plain, message: "FlutterToNative:\(String(describing: message))", progress: nil, progressText: nil), hideAfterDelay: 4.0)
            self.swiftCustomMothd()
            //逆向数据NativeToFlutter
            callback("逆向反馈 from iOS！")
        }



        //系统的MethodChannel机制(数据双向传递)
//        let controller: FlutterViewController = (window?.rootViewController as? FlutterViewController)!;
//        let channel: FlutterMethodChannel = FlutterMethodChannel.init(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger:controller.binaryMessenger);
//        //Native提供IMP
//        //回调块注入channel通道回调表(通道另端完成信息传递则触发回调表中当前端的回调函数)
//        channel.setMethodCallHandler {[weak self] (call:FlutterMethodCall, reslt: FlutterResult) -> Void in
//            // Note: this method is invoked on the UI thread
//            if call.method=="swiftCustomMethod" {
//                if let dict = call.arguments  {
//                    let returnValue = self?.swiftCustomMethod(age: (dict as! NSDictionary)["age"] as! Int);
//                    //Native中IMP的结果值逆向传递至flutter
//                    //只有存在reslt(returnValue)正常命令时flutter中invokeMethod命令才出现有效值(避免flutter阻塞)
//                    reslt(returnValue);
//                }
//                //                reslt(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil));
//            } else if call.method=="swiftCustomMod" {
//                if call.arguments != nil  {
//                    self?.swiftCustomMod();
//                    //Native中IMP的结果值逆向传递至flutter
//                    //只有存在reslt(returnValue)正常命令时flutter中invokeMethod命令才出现有效值(避免flutter阻塞)
//                    reslt(1);
//                }
//            }else {
//                reslt(FlutterMethodNotImplemented);
//            }
//
//
//        }

        //依赖三方时FlutterActivityAndFragmentDelegate.onAttach附件事件中会自动注册
        //此处不需要重复注册
        //        GeneratedPluginRegistrant.register(with: self);
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    //平台Swift 实现IMP
    func swiftCustomMethod(age:Int)->Int {
        print("swiftCustomMethod",age);
        let controller: FlutterViewController = (window?.rootViewController as? FlutterViewController)!;
        controller.chrysan.showHUD(Status(id:.success, message: "ReceivedDataFromFlutter:\(age)", progress: nil, progressText: nil), hideAfterDelay: 4.0)
        return 88;
    }

    //平台Swift 原生构建IMP
    func swiftCustomMod(){
        let controller: FlutterViewController = (window?.rootViewController as? FlutterViewController)!;
        let vc = NativeViewController()
        vc.hidesBottomBarWhenPushed = true//官方自带
        controller.present(vc, animated: false) {}
    }

    //平台Swift 原生构建IMP
    func swiftCustomMothd(){

    }

    func keyWindowInstance() -> UIWindow {
        if let keyWindow = UIApplication.shared.keyWindow {
            return keyWindow
        }
        if let window = UIApplication.shared.delegate?.window {
            if let win = window {
                return win
            }
        }
        return UIWindow(frame: .zero)
    }





}
