//
//  SearchStudentVC.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class SearchStudentVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func submitButtonClicked(_ sender: Any) {
    }
}
