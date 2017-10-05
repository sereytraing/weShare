//
//  SearchStudentVC.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class SearchStudentVC: DefaultVC {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLeftMenuButton()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellNib(cellClass: SearchStudentCell.self)
        
        self.requestAllStudent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestAllStudent() {
        let url = self.urlBase + "/users"
        let header: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header).responseArray(completionHandler: {
            (response: DataResponse<[User]>) in
            if let response = response.result.value {
                self.users = response
                self.tableView.reloadData()
            }
        })
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        //requete
        self.tableView.reloadData()
    }
}

extension SearchStudentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchStudentCell.className()) as! SearchStudentCell
        cell.bindData(name: self.users[indexPath.row].username)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
