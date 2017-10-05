//
//  AuthVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import SWRevealViewController

class AuthVC: DefaultVC {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLeftMenuButton()
        self.title = "Authentification"
        self.submitButton.layer.cornerRadius = 5.0
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestLogin(username: String, password: String) {
        let url = self.urlBase + "/auth/login"
        let header: HTTPHeaders = [
            "Accept": "application/json"
        ]
        let parameters = ["username": username,
                          "password": password]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseObject(completionHandler: {
            (response: DataResponse<ResponseLogin>) in
            if let response = response.result.value {
                UserInfoSaver().saveUser(id: response.user?.id, username: response.user?.username, token: response.token)
                self.showAuthResult(success: true)
            } else {
                self.showAuthResult(success: false)
            }
        })
    }
    
    func showAuthResult(success: Bool) {
        var revealVC: SWRevealViewController
        revealVC = self.revealViewController()
        let authResultVC = AuthResultVC(nibName: AuthResultVC.className(), bundle: nil)
        authResultVC.connected = success
        let newRootVC = UINavigationController(rootViewController: authResultVC)
        revealVC.pushFrontViewController(newRootVC, animated: true)
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        if (usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            
        } else {
            self.requestLogin(username: usernameTextField.text!, password: passwordTextField.text!)
        }
    }
}
