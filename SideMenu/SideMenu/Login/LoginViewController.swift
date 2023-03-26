//
//  LoginViewController.swift
//  SideMenu
//
//  Created by Mac on 03/04/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        validationCode()
            
    }
    
    }
extension LoginViewController{
    fileprivate func validationCode() {
        if let email = emailTextField.text , let password = passwordTextField.text{
            if email.validEmailId(){
                openAlert(title: "Alert", message: "Email not found", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                    print("okay clicked")
                }])
            }else if password.validatePassword(){
                openAlert(title: "Alert", message: "enter valid password", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                    print("okay clicked")
                }])
            }else{
                //navigation - home screen
                
            }
        }else{
            openAlert(title: "Alert", message: "please add detail", alertStyle: .alert, actionTitles: ["okay"], actionStyle: [.default], actions: [{_ in
                print("okay clicked")
            }])
        }
    }
}
