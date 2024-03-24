//
//  MyFlutterBoostDelegate.swift
//  Runner
//
//  Created by haijunyan on 2024/3/11.
//

import UIKit
import flutter_boost
import Chrysan
class MyFlutterBoostDelegate:NSObject, FlutterBoostDelegate {
    var navigationController: UINavigationController? = nil

    func isBool(_ value: Any) -> Bool {
        return type(of: value) == Bool.self
    }

//    FlutterBoostDelegate协议代理
    func pushNativeRoute(_ pageName: String!, arguments: [AnyHashable : Any]!) {
        print("pageName:\(pageName)")
        print("arguments:\(arguments)")
        print("pushNativeRoute")
        let animated = isBool(arguments["animated"] as Any)
        let present = isBool(arguments["present"] as Any)

        var nvc: UIViewController = UIViewController()

        if pageName == "NativeViewControllerThree" {
            nvc = NativeViewControllerThree()
        }else if pageName == "NativeViewControllerTwo" {
            nvc = NativeViewControllerTwo()
        } else if pageName == "NativeViewControllerOne" {
            nvc = NativeViewControllerOne()
        }else {
            nvc = NativeViewController()
        }

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        nvc.hidesBottomBarWhenPushed = true//官方自带
        if present {
            self.navigationController?.present(nvc, animated: animated, completion: {
            })
        } else {
            self.navigationController?.pushViewController(nvc, animated: animated)
        }
    }

    func pushFlutterRoute(_ options:FlutterBoostRouteOptions) {
        let vc: FBFlutterViewContainer = FBFlutterViewContainer()
        vc.setName(options.pageName, uniqueId: options.uniqueId, params: options.arguments, opaque: options.opaque)
        //是否伴随动画
        let animated = isBool(options.arguments["animated"] as Any)
        //是否是present的方式打开,如果要push的页面是透明的，那么也要以present形式打开
        let present = isBool(options.arguments["present"] as Any) || !options.opaque
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if present {
            self.navigationController?.present(vc, animated: animated, completion: {
                options.completion(true)
            })
        } else {
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }

    func popRoute(_ options:FlutterBoostRouteOptions) {
        print("sssssssss")
        //拿到当前vc
        let vc: FBFlutterViewContainer = self.navigationController?.presentedViewController as? FBFlutterViewContainer ?? FBFlutterViewContainer()
        //是否伴随动画,默认是true
        var animated = true
        let animatedValue:NSNumber = options.arguments["animated"] as? NSNumber ?? 1
        if animatedValue as! Bool {
            animated = isBool(animatedValue)
        }
        //present的情况，走dismiss逻辑
        if vc.isKind(of: FBFlutterViewContainer.self)&&vc.uniqueIDString().isEqual(options.uniqueId) {
            //这里分为两种情况，由于UIModalPresentationOverFullScreen下，生命周期显示会有问题
            //所以需要手动调用的场景，从而使下面底部的vc调用viewAppear相关逻辑
            if vc.modalPresentationStyle == UIModalPresentationStyle.overFullScreen {
                //这里手动beginAppearanceTransition触发页面生命周期
                self.navigationController?.topViewController?.beginAppearanceTransition(true, animated: false)
                self.navigationController?.setNavigationBarHidden(true, animated: animated)
                vc.dismiss(animated: true) {
                    self.navigationController?.topViewController?.endAppearanceTransition()
                }
            } else {
                //正常场景，直接dismiss
                vc.dismiss(animated: true) {

                }
            }
        } else {
            //否则走pop逻辑
            self.navigationController?.popViewController(animated: animated)
        }
        options.completion(true)
    }
}
