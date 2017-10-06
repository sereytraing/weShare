//
//  LeftMenuVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import SWRevealViewController

class LeftMenuVC: UIViewController {

    @IBOutlet weak var disconnectButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [String] = ["Accueil", "Se connecter", "Rechercher un étudiant"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellNib(cellClass: LeftMenuCell.self)
        self.tableView.reloadData()
        self.tableView.alwaysBounceVertical = false
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        let ico_logout = UIImage(named: "ico_logout")
        let tintedImage = ico_logout?.withRenderingMode(.alwaysTemplate)
        self.disconnectButton.setImage(tintedImage, for: .normal)
        self.disconnectButton.tintColor = UIColor.white
    }

    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
        if UserInfoSaver().isAuth() {
            self.disconnectButton.isHidden = false
        } else {
            self.disconnectButton.isHidden = true
        }
    }
    @IBAction func disconnectButtonClicked(_ sender: Any) {
        UserInfoSaver().disconnectAccount()
        self.disconnectButton.isHidden = true
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LeftMenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuCell.className()) as! LeftMenuCell
        if indexPath.row == 1 && UserInfoSaver().isAuth() {
            cell.bindData(name: "Mon profil".uppercased())
        } else {
            cell.bindData(name: self.items[indexPath.row].uppercased())
        }
        cell.selectionStyle = .none
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = Style.Color.orange
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var revealVC: SWRevealViewController
        revealVC = self.revealViewController()
        switch (indexPath.row) {
        case 0:
            let homeVC = HomeVC(nibName: HomeVC.className(), bundle: nil)
            let newRootVC = UINavigationController(rootViewController: homeVC)
            revealVC.pushFrontViewController(newRootVC, animated: true)
            
        case 1:
            if UserInfoSaver().isAuth() {
                let profileVC = ProfileVC(nibName: ProfileVC.className(), bundle: nil)
                profileVC.idReceived = UserInfoSaver().getUserId()
                let newRootVC = UINavigationController(rootViewController: profileVC)
                revealVC.pushFrontViewController(newRootVC, animated: true)
            } else {
                let authVC = AuthVC(nibName: AuthVC.className(), bundle: nil)
                let newRootVC = UINavigationController(rootViewController: authVC)
                revealVC.pushFrontViewController(newRootVC, animated: true)
            }
            
            
        case 2:
            let searchStudentVC = SearchStudentVC(nibName: SearchStudentVC.className(), bundle: nil)
            let newRootVC = UINavigationController(rootViewController: searchStudentVC)
            revealVC.pushFrontViewController(newRootVC, animated: true)
        default:
            break;
        }
    }
}

/*if UserInfoSaver().isAuth() {
    // Une page
} else {
    let authVC = AuthVC(nibName: AuthVC.className(), bundle: nil)
    let newRootVC = UINavigationController(rootViewController: authVC)
    revealVC.pushFrontViewController(newRootVC, animated: true)
}*/
