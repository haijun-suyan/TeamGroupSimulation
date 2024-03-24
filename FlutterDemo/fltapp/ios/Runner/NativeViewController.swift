//
//  NativeViewController.swift
//  Runner
//
//  Created by haijunyan on 2023/12/5.
//

import UIKit
import SnapKit
import Chrysan

class NativeViewController: UIViewController {

    private lazy var praiseTipL: UILabel = {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = UIColor.black
        l.font = MSOPFont(at: 16)
        l.textAlignment = .center
        l.text = "Native原生界面(Swift)"
        return l
    }()

    private lazy var resultTipL: UILabel = {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = UIColor.black
        l.font = MSOPFont(at: 16)
        l.textAlignment = .center
        l.text = "结果:"
        return l
    }()

    private lazy var thumbsUpBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
//        btn.setTitle("事件通道之flutter层提供IMP", for: .normal)
//        btn.setTitle("事件通道之flutter层提供IMP", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(thumbsUpBtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func thumbsUpBtnClicked(psender: UIButton) {
//        let controller: FlutterViewController = (keyWindowInstance().rootViewController as? FlutterViewController)!;
//        let channel: FlutterMethodChannel = FlutterMethodChannel.init(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger:controller.binaryMessenger);
//
//        // -------------flutter提供IMP(数据的双向通信)-----------------
//        //arguments Native>Flutter 数据正向
//        //result Flutter>Native 数据逆向
//        do {
//            channel.invokeMethod("flutterCustomMethod", arguments: "您好"){result in
//                //result:由Flutter逆向反馈的数据
//                if let response = result as? String {
//                    print("Received response from Flutter: \(response)")
//                    self.chrysan.showHUD(Status(id:.plain, message: "ReceivedDataFromFlutter:\(response)", progress: nil, progressText: nil), hideAfterDelay: 4.0)
//
//                }else if let response = result as? Int {
//                    self.chrysan.showHUD(Status(id:.success, message: "ReceivedDataFromFlutter:\(response)", progress: nil, progressText: nil), hideAfterDelay: 4.0)
//                    self.resultTipL.text = "结果:\(response)"
//                }else {
//                    //flutter混编时打印命令失效
//                    print("哈哈哈哈哈哈哈哈")
//                    self.chrysan.showHUD(Status(id:.plain, message: "Failed to receive a valid response", progress: nil, progressText: nil), hideAfterDelay: 4.0)
//                }
//            }
//        } catch let error {
//            print("Error invoking method:\(error)")
//        }

    }

    private lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitle("返回", for: .normal)
        btn.setTitle("返回", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(backBtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func backBtnClicked(psender: UIButton) {
//        dismiss(animated: true) {
//        }
        self.navigationController?.popViewController(animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        neededEmbededView()


    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }

    func neededEmbededView() {
        view.addSubview(praiseTipL)
        praiseTipL.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(view.snp.top).offset(50)
            m.width.equalTo(350)
            m.height.equalTo(25)
        }

        view.addSubview(thumbsUpBtn)
        thumbsUpBtn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(praiseTipL.snp.bottom).offset(20)
            m.width.equalTo(350)
            m.height.equalTo(45)
        }

        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.bottom.equalTo(view.snp.bottom).offset(-100)
            m.width.equalTo(60)
            m.height.equalTo(45)
        }

        view.addSubview(resultTipL)
        resultTipL.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(thumbsUpBtn.snp.bottom).offset(100)
            m.width.equalTo(200)
            m.height.equalTo(150)
        }
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
