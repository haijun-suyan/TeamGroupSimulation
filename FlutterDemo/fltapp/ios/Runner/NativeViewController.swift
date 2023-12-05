//
//  NativeViewController.swift
//  Runner
//
//  Created by haijunyan on 2023/12/5.
//

import UIKit
import SnapKit

class NativeViewController: UIViewController {

    private lazy var praiseTipL: UILabel = {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = UIColor.black
        l.font = MSOPFont(at: 16)
        l.textAlignment = .center
        l.text = "Native原生界面"
        return l
    }()

    private lazy var thumbsUpBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("通道flutter提供IMP", for: .normal)
        btn.setTitle("通道flutter提供IMP", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(thumbsUpBtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func thumbsUpBtnClicked(psender: UIButton) {
        let controller: FlutterViewController = (keyWindowInstance().rootViewController as? FlutterViewController)!;
        let channel: FlutterMethodChannel = FlutterMethodChannel.init(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger:controller.binaryMessenger);

        // -------------flutter提供IMP-----------------
        //arguments Native>Flutter 数据正向
        //result Flutter>Native 数据逆向
        channel.invokeMethod("flutterCustomMethod", arguments: "您好") { (result) in
            print("result is ",result as Any)
        }

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
        dismiss(animated: true) {
        }
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
            m.width.equalTo(150)
            m.height.equalTo(25)
        }

        view.addSubview(thumbsUpBtn)
        thumbsUpBtn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(praiseTipL.snp.bottom).offset(20)
            m.width.equalTo(150)
            m.height.equalTo(45)
        }

        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.bottom.equalTo(view.snp.bottom).offset(-100)
            m.width.equalTo(60)
            m.height.equalTo(45)
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
