//
//  CommonUtil.swift
//
//  Created by haijunyan on 2019/01/17.
//  Copyright © 2019年 haijunyan. All rights reserved.
//

import UIKit

public enum MSOPFontWeight {
    case common //常规
    case light  //细体
    case medium //中等
    case bold   //粗体
}

/// 颜色获取
///
/// - Parameters:
///   - red: red分量
///   - green: green分量
///   - blue: blue分量
///   - alpha: 透明度分量
/// - Returns: 对应UIColor
public func RGBA(_ red:Double,_ green:Double,_ blue:Double,_ alpha:Double) -> UIColor  {
    let cgRed   = CGFloat(red)
    let cgGreen = CGFloat(green)
    let cgBlue  = CGFloat(blue)
    let cgAlpha = CGFloat(alpha)
    return UIColor(red: cgRed/255.0, green: cgGreen/255.0, blue:cgBlue/255.0, alpha: cgAlpha)
}

/// 颜色获取
///
/// - Parameters:
///   - red: red分量
///   - green: green分量
///   - blue: blue分量
/// - Returns: 对应UIColor
public func RGB(_ red:Double,_ green:Double,_ blue:Double) -> UIColor{
    return RGBA(red, green, blue,1.0)
}

//随机颜色
public func randomColor() -> UIColor {
    return RGBA(Double(arc4random_uniform(255)), Double(arc4random_uniform(255)), Double(arc4random_uniform(255)), 1)
}

/// 16进制颜色
///
/// - Parameter hex: 颜色16进制数
/// - Returns: 对应的UIColor
public func colorWithHex (_ hex: Int, alpha: Double = 1.0) -> UIColor{
    let r = (hex & 0xFF0000) >> 16
    let g = (hex & 0xFF00) >> 8
    let b = hex & 0xFF
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(alpha))
}

/// 同步锁方法
///
/// - Parameters:
///   - lock: 需要锁定的对象
///   - action: 需要锁定的操作
public func synchronized(_ lock : AnyObject, action: () -> ()) {
    objc_sync_enter(lock)
    action()
    objc_sync_exit(lock)
}

/// 获取字体
///
/// - Parameter size: 字体大小
/// - Returns: 获得的字体UIFont
public func MSOPFont(at size: CGFloat, weight: MSOPFontWeight = .common) -> UIFont {
    let fontName: String
    switch weight {
    case .common:
        fontName = "PingFang SC"
    case .bold:
        fontName = "PingFang SC"
    case .medium:
        if #available(iOS 9.0, *) {
            return UIFont.systemFont(ofSize: size, weight: .medium)
        }
        fontName = "PingFang SC"
    default:
        fontName = "PingFang SC"
    }
    return UIFont(name: fontName, size: size)!
}


/// 日志打印
/// - Parameters:
///   - items: 多个待打印的任意对象
///   - file: 函数实例访问调用启动执行所在文件
///   - line: 函数实例访问调用启动执行所在文件下行
///   - column: 函数实例访问调用启动执行所在文件下列
///   - function: 访问调用启动执行函数实例指令所在执行域
public func printLog(_ items: Any?..., file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) -> Void {
    #if DEBUG
        print("\n---LOG START---\nFile:\((file as NSString).lastPathComponent)\nLine:\(line)\nColumn:\(column)\nFunc:\(function)\n**LogContent:\(items)\n---LOG END---")
    #endif
}





