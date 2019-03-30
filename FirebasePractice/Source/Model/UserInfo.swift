//
//  UserInfo.swift
//  FirebasePractice
//
//  Created by 전건우 on 30/03/2019.
//  Copyright © 2019 geonu. All rights reserved.
//

import Foundation
import RxSwift
import FirebaseDatabase

class UserInfo {
    let id: String
    var nickname: BehaviorSubject<String?> = .init(value: nil)
    
    init(id: String) {
        self.id = id
        
        let ref = Database.database().reference()
        ref.child("UserInfos").child(id).observe(.value) { (snapshot) in
            let json = snapshot.value as? [String: String]
            self.nickname.onNext(json?["nickname"])
        }
    }
}
