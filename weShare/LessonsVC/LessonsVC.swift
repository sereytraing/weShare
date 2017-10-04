//
//  LessonsVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class LessonsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var lessons = [Lesson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerCellNib(cellClass: LessonCell.self)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LessonsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return lessons.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LessonCell.className()) as! LessonCell
        cell.bindData(title: "Test")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailLessonVC = DetailLessonVC(nibName: DetailLessonVC.className(), bundle: nil)
        navigationController?.pushViewController(detailLessonVC, animated: true)
    }
}
