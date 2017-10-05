//
//  HomeVC.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class HomeVC: DefaultVC {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let lineSpacing : CGFloat = 10.0
    let inset : CGFloat = 10.0
    
    var contents = [Content]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLeftMenuButton()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCellNib(cellClass: SubjectCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        self.collectionView.collectionViewLayout = layout
        self.requestLesson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestLesson() {
        let url = self.urlBase + "/contents"
        let header: HTTPHeaders = [
            "Accept": "application/json"
        ]

        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header).responseArray(completionHandler: {
            (response: DataResponse<[Content]>) in
            if let response = response.result.value {
                self.contents = response
                self.collectionView.reloadData()
            }
        })
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.className(), for: indexPath as IndexPath) as! SubjectCollectionViewCell
        cell.backgroundColor = UIColor.red
        cell.bindData(imageName: nil, title: contents[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailLessonVC = DetailLessonVC(nibName: DetailLessonVC.className(), bundle: nil)
        detailLessonVC.urlPdf = self.contents[indexPath.row].fileUrl
        navigationController?.pushViewController(detailLessonVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 2 * inset - lineSpacing)/2, height: ((UIScreen.main.bounds.width - 2 * inset - lineSpacing)/2) * (9/17))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
