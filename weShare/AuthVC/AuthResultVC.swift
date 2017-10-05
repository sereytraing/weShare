//
//  AuthResultVC.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import SWRevealViewController

class AuthResultVC: DefaultVC {

    var connected: Bool!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.submitButton.layer.cornerRadius = 5.0
        if self.connected {
            self.label.text = "Connexion réussie"
        } else {
            self.label.text = "Echec de la connexion "
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showHome() {
        var revealVC: SWRevealViewController
        revealVC = self.revealViewController()
        let homeVC = HomeVC(nibName: HomeVC.className(), bundle: nil)
        let newRootVC = UINavigationController(rootViewController: homeVC)
        revealVC.pushFrontViewController(newRootVC, animated: true)
    }
    
    func showAuth() {
        var revealVC: SWRevealViewController
        revealVC = self.revealViewController()
        let authVC = AuthVC(nibName: AuthVC.className(), bundle: nil)
        let newRootVC = UINavigationController(rootViewController: authVC)
        revealVC.pushFrontViewController(newRootVC, animated: true)
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        if self.connected {
            self.showHome()
        } else {
            self.showAuth()
        }
    }
}
