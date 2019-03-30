//
//  ViewController.swift
//  FirebasePractice
//
//  Created by 전건우 on 19/03/2019.
//  Copyright © 2019 geonu. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet var nicknameLabel: UILabel!
    let disposeBag = DisposeBag()
    
    var userInfo: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userInfo = UserInfo(id: "geonu1109")
        bind()
    }

    func bind() {
        userInfo.nickname.subscribe(onNext: { (value) in
            self.nicknameLabel.text = value
        }).disposed(by: disposeBag)
    }
}

