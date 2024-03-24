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
import CoreMedia

class NativeViewControllerOne: UIViewController {

    var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
    var removeListener: FBVoidCallback = {()in}

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
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)

        //embed情景
//        flutterContainer.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//        view.addSubview(flutterContainer.view)
//        self.addChild(flutterContainer)

//        数据：NativeToFlutter
        FlutterBoost.instance().sendEventToFlutter(with: "otherPage", arguments: ["key": "otherPage","arguments":["content":["happy":"我很开心"]]])

//        数据：FlutterToNative
        FlutterBoost.instance().addEventListener({ key, arguments in
            if let response = arguments as NSDictionary? {
                let happy: String = (response["content"] as! NSDictionary)["happy"] as? String ?? ""
                self.swiftCustomMothod(des: happy)

            }else {
                //flutter混编时打印命令失效
                self.chrysan.showHUD(Status(id:.plain, message: "Failed to receive a valid response", progress: nil, progressText: nil), hideAfterDelay: 4.0)
            }
        }, forName: "NativeViewControllerOne")

        //Native主动发送(Boost)
        //双向数据+双向imp操作(推荐优先)
        let messageChannel: FlutterBasicMessageChannel = FlutterBasicMessageChannel(name: "plugins.flutter.io/google_sign_in_ios", binaryMessenger: flutterContainer.binaryMessenger)
        //数据：NativeToFlutter
        messageChannel.sendMessage(["content":"佩云宝宝很好呀"]) { result in
            //逆向数据FlutterToNative
            print("逆向结果result:\(String(describing: result))")
            self.swiftCustomMothod(des: String(describing: result))
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
//    override func didMove(toParent parent: UIViewController?) {
//        flutterContainer.didMove(toParent: parent)
//        super.didMove(toParent: parent)
//    }

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

    //平台Swift 原生构建IMP
    func swiftCustomMothod(des:String){
        print("des:\(des)")
        self.chrysan.showHUD(Status(id:.success, message:des , progress: nil, progressText: nil), hideAfterDelay: 4.0)
    }
}
