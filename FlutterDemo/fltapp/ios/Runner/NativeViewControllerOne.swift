//
//  NativeViewControllerOne.swift
//  Runner
//
//  Created by haijunyan on 2024/3/11.
//

import UIKit
import SnapKit
import Chrysan
import flutter_boost

class NativeViewControllerOne: UIViewController {

    var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()

    private lazy var praiseTipL: UILabel = {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = UIColor.black
        l.font = MSOPFont(at: 16)
        l.textAlignment = .center
        l.text = "Native原生界面(NativeViewControllerOne)"
        return l
    }()

    private lazy var thumbsUpBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("引入flutter层otherPage", for: .normal)
        btn.setTitle("引入flutter层otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(thumbsUpBtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func thumbsUpBtnClicked(psender: UIButton) {
        flutterContainer.setName("otherPage", uniqueId: nil, params: [:], opaque: true)
        flutterContainer.view.frame = CGRect(x: 50, y: 300, width: 280, height: 350)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        view.addSubview(flutterContainer.view)
        self.addChild(flutterContainer)
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

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan

    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        neededEmbededView()

    }

//  embed情景下必须实现！！！
    override func didMove(toParent parent: UIViewController?) {
        flutterContainer.didMove(toParent: parent)
        super.didMove(toParent: parent)
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
