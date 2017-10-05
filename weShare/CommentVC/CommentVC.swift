//
//  CommentVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class CommentVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var users = ["Ludovic",
                 "Jean",
                 "Walid"]
    var comments = ["Génial, vraiment intéressant !",
                    "Merci beaucoup pour ce petit cours, ça m'a bien aidé !",
                    "Je recommande :)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Commentaires"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellNib(cellClass: CommentCell.self)
        self.tableView.reloadData()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        
        self.submitButton.layer.cornerRadius = 5.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func submitButtonClicked(_ sender: Any) {
        if !(self.textField.text?.isEmpty)! {
            self.comments.append(self.textField.text!)
            self.users.append("Moi")
            self.textField.text = ""
            self.tableView.reloadData()
        }
    }
}

extension CommentVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.className()) as! CommentCell
        cell.bindData(username: self.users[indexPath.row], message: self.comments[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = Style.Color.lightBlue
        }
    }
}
