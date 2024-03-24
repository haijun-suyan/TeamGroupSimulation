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

    var fCon: FBFlutterViewContainer = FBFlutterViewContainer()
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

    private lazy var changeBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("0[Flutter]otherPage", for: .normal)
        btn.setTitle("0[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(changeBtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func changeBtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        fCon = flutterContainer
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
//        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //embed情景
        view.addSubview(flutterContainer.view)
        flutterContainer.view.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(view.snp.top).offset(0)
            m.width.equalTo(view.snp.width)
            m.bottom.equalTo(view.snp.bottom).offset(-bottomBarHeight-tabBarHeight)
        }
        self.addChild(flutterContainer)

        //数据：NativeToFlutter
        FlutterBoost.instance().sendEventToFlutter(with: "otherPage", arguments: ["key": "otherPage","arguments":["content":["happy":"我很开心"]]])

        //数据：FlutterToNative
        FlutterBoost.instance().addEventListener({ [self] key, arguments in
            //接收处理
            if let response = arguments as NSDictionary? {
                let happy: String = (response["content"] as! NSDictionary)["happy"] as? String ?? ""
                self.swiftCustomMothod(des: happy)

                //embed情景移除
                flutterContainer.view.removeFromSuperview()
                flutterContainer.removeFromParent()
//                self.flutterContainer.didMove(toParent: nil)
            }else {
                //flutter混编时打印命令失效
                self.chrysan.showHUD(Status(id:.plain, message: "Failed to receive a valid response", progress: nil, progressText: nil), hideAfterDelay: 4.0)
            }
        }, forName: "NativeViewControllerOne")

    }

    private lazy var change1Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("1[Flutter]splashPage", for: .normal)
        btn.setTitle("1[Flutter]splashPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change1BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change1BtnClicked(psender: UIButton) {
        let flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("splash", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer  , animated: true)

        //数据：NativeToFlutter
        FlutterBoost.instance().sendEventToFlutter(with: "splash", arguments: ["key": "splash","arguments":["content":["happy":"我很开心"]]])
    }

    private lazy var change2Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("2[Flutter]otherPage", for: .normal)
        btn.setTitle("2[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change2BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change2BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)



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

    private lazy var change3Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("3[Flutter]otherPage", for: .normal)
        btn.setTitle("3[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change3BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change3BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)







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

    private lazy var change4Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("4[Flutter]otherPage", for: .normal)
        btn.setTitle("4[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change4BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change4BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)





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

    private lazy var change5Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("5[Flutter]otherPage", for: .normal)
        btn.setTitle("5[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change5BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change5BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)






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

    private lazy var change6Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("6[Flutter]otherPage", for: .normal)
        btn.setTitle("6[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change6BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change6BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)


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

    private lazy var change7Btn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = colorWithHex(0xffffff)
        btn.setTitle("7[Flutter]otherPage", for: .normal)
        btn.setTitle("7[Flutter]otherPage", for: .highlighted)
        btn.setTitleColor(colorWithHex(0x333333), for: .normal)
        btn.setTitleColor(colorWithHex(0x333333), for: .highlighted)
        btn.titleLabel?.font = MSOPFont(at: 16)
        btn.addTarget(self, action: #selector(change7BtnClicked(psender:)), for: .touchUpInside)
        return btn
    }()

    @objc func change7BtnClicked(psender: UIButton) {
        var flutterContainer: FBFlutterViewContainer = FBFlutterViewContainer()
        flutterContainer.setName("otherPage", uniqueId: nil, params: ["name":"yanhaijun","gender":"男","hobby":"swimming"], opaque: true)
        flutterContainer.view.backgroundColor = UIColor.systemYellow
        //普通跳转场景
        self.navigationController?.pushViewController(flutterContainer, animated: true)

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

    //embed情景下必须实现！！！
    override func didMove(toParent parent: UIViewController?) {
        fCon.didMove(toParent: parent)
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

        view.addSubview(changeBtn)
        changeBtn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(praiseTipL.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change1Btn)
        change1Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(changeBtn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change2Btn)
        change2Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change1Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change3Btn)
        change3Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change2Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change4Btn)
        change4Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change3Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change5Btn)
        change5Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change4Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change6Btn)
        change6Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change5Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
            m.height.equalTo(45)
        }

        view.addSubview(change7Btn)
        change7Btn.snp.makeConstraints { (m) in
            m.centerX.equalTo(view.snp.centerX)
            m.top.equalTo(change6Btn.snp.bottom).offset(20)
            m.width.equalTo(250)
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
