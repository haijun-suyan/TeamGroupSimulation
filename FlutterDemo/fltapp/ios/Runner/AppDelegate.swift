import UIKit
import Flutter
import Chrysan

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = (window?.rootViewController as? FlutterViewController)!;
        let channel: FlutterMethodChannel = FlutterMethodChannel.init(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger:controller.binaryMessenger);
        //Native提供IMP
        //回调块注入channel通道回调表(通道另端完成信息传递则触发回调表中当前端的回调函数)
        channel.setMethodCallHandler {[weak self] (call:FlutterMethodCall, reslt: FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread
            if call.method=="swiftCustomMethod" {
                if let dict = call.arguments  {
                    let returnValue = self?.swiftCustomMethod(age: (dict as! NSDictionary)["age"] as! Int);
                    //Native中IMP的结果值逆向传递至flutter
                    //只有存在reslt(returnValue)正常命令时flutter中invokeMethod命令才出现有效值(避免flutter阻塞)
                    reslt(returnValue);
                }
                //                reslt(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil));
            } else if call.method=="swiftCustomMod" {
                if call.arguments != nil  {
                    self?.swiftCustomMod();
                    //Native中IMP的结果值逆向传递至flutter
                    //只有存在reslt(returnValue)正常命令时flutter中invokeMethod命令才出现有效值(避免flutter阻塞)
                    reslt(1);
                }
            }else {
                reslt(FlutterMethodNotImplemented);
            }


        }

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



}
