//
//  DefaultVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import SWRevealViewController

class DefaultVC: UIViewController {
    
    let urlBase = "http://vps464005.ovh.net:3000"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.setNeedsStatusBarAppearanceUpdate()
        self.navigationController?.navigationBar.barTintColor = Style.Color.blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addLeftMenuButton() {
        let revealController = SWRevealViewController()
        revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
        let menuIcon = UIImage(named: "ico_burger")
        let leftItem = UIBarButtonItem(image: menuIcon, style: .plain, target: revealController, action: #selector(revealController.revealToggle(_:)))
        leftItem.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = leftItem
        self.addGestureMenu()
    }
    
    func addGestureMenu() {
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        }
    }
}

