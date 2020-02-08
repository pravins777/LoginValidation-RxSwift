//
//  ViewController.swift
//  RxSwiftLogin
//
//  Created by Nykaa on 23/01/20.
//  Copyright © 2020 NykaaFashion. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        _ = emailField.rx.text.map({ $0 ?? "" }).bind(to: loginViewModel.emailField)
        _ = passwordField.rx.text.map({ $0 ?? "" }).bind(to: loginViewModel.passwordField)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        loginViewModel.isValid.subscribe(onNext: { [weak self] isValid in
            self?.statusLabel.text = isValid ? "Enabled" : "Disabled"
            self?.statusLabel.textColor = isValid ? .green : .red
            }).disposed(by: disposeBag)
    }


}

