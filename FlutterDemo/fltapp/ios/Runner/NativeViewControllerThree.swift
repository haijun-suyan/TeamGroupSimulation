//
//  NativeViewControllerThree.swift
//  Runner
//
//  Created by haijunyan on 2024/3/23.
//

import UIKit
import SnapKit
import Chrysan
import flutter_boost
import CoreMedia

class NativeViewControllerThree: UIViewController {

    private lazy var praiseTipL: UILabel = {
        let l = UILabel()
        l.backgroundColor = .clear
        l.textColor = UIColor.black
        l.font = MSOPFont(at: 16)
        l.textAlignment = .center
        l.text = "Native原生界面Three"
        return l
    }()

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
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan



    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        neededEmbededView()

    }

    override func viewDidAppear(_ animated: Bool) {
//        let nc: UINavigationController = keyWindowInstance().rootViewController as! UINavigationController
//
//        let vcs = nc.viewControllers
//
//        var tabc: UITabBarController = UITabBarController()
//        for item in vcs {
//            if item.isKind(of: UITabBarController.self) {
//                tabc = item as! UITabBarController
//            }
//        }
//
//        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
//        let tabvcs = tabc.viewControllers ?? []
//        for item in tabvcs {
//            if item.isKind(of: FBFlutterViewContainer.self) {
//                flutterContainer = item as! FBFlutterViewContainer
//            }
//        }

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
