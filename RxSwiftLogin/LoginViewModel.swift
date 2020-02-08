//
//  LoginViewModel.swift
//  RxSwiftLogin
//
//  Created by Nykaa on 23/01/20.
//  Copyright © 2020 NykaaFashion. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct LoginViewModel {
    var emailField = BehaviorRelay<String>(value: "")
    var passwordField = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailField.asObservable(), passwordField.asObservable()) { email, password in
            email.count > 3 && password.count > 3
        }
    }
}
