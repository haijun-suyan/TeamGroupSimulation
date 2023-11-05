import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller: FlutterViewController = (window?.rootViewController as? FlutterViewController)!;
        let channel: FlutterMethodChannel = FlutterMethodChannel.init(name: "Flutter/navigation", binaryMessenger:controller.binaryMessenger);

        channel.setMethodCallHandler {[weak self] (call:FlutterMethodCall, reslt: FlutterResult) -> Void in
            // Note: this method is invoked on the UI thread
            if call.method=="swiftCustomMethod" {
                self?.swiftCustomMethod();
                //                    reslt(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil));
            } else {
                reslt(FlutterMethodNotImplemented);
            }


            }


        channel.invokeMethod("dddddd", arguments: nil);


        GeneratedPluginRegistrant.register(with: self as FlutterPluginRegistry)
            return super.application(application, didFinishLaunchingWithOptions: launchOptions)
        }

    //平台Swift 实现IMP
    func swiftCustomMethod() -> Int {
        print("swiftCustomMethod");
        return 9;
    }

}
