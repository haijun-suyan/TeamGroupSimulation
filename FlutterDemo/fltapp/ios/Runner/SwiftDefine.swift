//
//  SwiftDefine.swift

//  Created by haijunyan on 2019/01/17.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

import UIKit

typealias RefreshFunc = () -> Void
typealias RomanceSuccess = (Any?) -> Void
typealias RomanceError = (Any?) -> Void
typealias RomanceFail = (Any?) -> Void
//MARK: - 屏幕宽
var SCREEN_WIDTH: CGFloat { return UIScreen.main.bounds.size.width }

//MARK: - 屏幕高(导航栏下面部分区域)
var SCREEN_HEIGHT: CGFloat { return UIScreen.main.bounds.size.height }

//线高度
let HEIGHT_LINE         = 1.0

//导航栏高
let HEIGHT_NAVI         = 64.0

//灰色背景F8F8F8
//let COLOR_View = RGBA(248, 248, 248, 1)
let COLOR_View = colorWithHex(0xf6f6f6)

//MARK: - 全局背景色
let COLOR_BACKGROUND    = colorWithHex(0xf2f2f2)

//MARK: - 全局主色
let COLOR_ORANGE        = colorWithHex(0xff6f00)

//MARK: - 全局辅色
let COLOR_MINOR         = colorWithHex(0x2889ff)

//MARK: - 分割线的颜色
let COLOR_LINE          = colorWithHex(0xf2f2f2)

//MARK: - 白色
let COLOR_WHITE         = colorWithHex(0xffffff)

//MARK: - 主文本色
let COLOR_MAJOR_FONT     = colorWithHex(0x333333)

//MARK: - 辅文本色
let COLOR_MINOR_FONT     = colorWithHex(0x666666)

//MARK: - 浅色字体颜色
let COLOR_LIGHT_FONT    = colorWithHex(0x999999)

//MARK: - 提示字体颜色
let COLOR_TIP_FONT    = colorWithHex(0xc7c7c7)

//适配iPhone X导航高度
let SAFEAREA_TOPHEIGHT: CGFloat  = SCREEN_HEIGHT == 812.0 ? 88 : 64

//安全区域底部 耳朵 高度变化(适配iPhoneX)
let SAFEAREA_BOTTOMHEIGHT: CGFloat = SCREEN_HEIGHT == 812.0 ? 34 : 0

let HttpError = "网络请求失败"

let MarginLeft: CGFloat = 15.0

let MarginTop: CGFloat = 15.0

////26yanfa
//let CloudIP = "192.168.31.131"
//let CloudPort: UInt16 = 12626
//Wap流量
let CloudIP = "47.98.142.132"
let CloudPort: UInt16 = 12626

let isIos7 = Float(UIDevice.current.systemVersion) ?? 0


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

func getDictionaryFromJSONString(jsonString:String) ->NSDictionary{
    let jsonData:Data = jsonString.data(using: .utf8)!
    let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
    if dict != nil {
        return dict as! NSDictionary
    }
    return NSDictionary()
}

func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
    if (!JSONSerialization.isValidJSONObject(dictionary)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString! as String
}

func dictionaryToData(_ dic: Dictionary<String, Any>) -> Data {
    if (!JSONSerialization.isValidJSONObject(dic)) {
        print("is not a valid json object")
        return Data()
    }
    let data = try? JSONSerialization.data(withJSONObject: dic, options: JSONSerialization.WritingOptions.prettyPrinted)
    return data ?? Data()
}

func dataToDictionary(_ data: Data) -> Dictionary<String, Any> {
    do{
        let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        let dic = json as! Dictionary<String, Any>
        return dic
    }catch _ {
        print("转化失败")
        return Dictionary<String, Any>()
    }
    
}

