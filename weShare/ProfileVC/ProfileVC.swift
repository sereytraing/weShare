//
//  ProfileVC.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ProfileVC: DefaultVC {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noCoursLabel: UILabel!
    
    var user: User?
    var contents = [Content]()
    var idReceived: Int?
    let lineSpacing : CGFloat = 10.0
    let inset : CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.addLeftMenuButton()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCellNib(cellClass: SubjectCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        self.collectionView.collectionViewLayout = layout
        self.collectionView.reloadData()
        self.requestUser(id: self.idReceived)
        self.noCoursLabel.isHidden = true
        
    }

    func bindData(user: User) {
        self.nameLabel.text = user.username
        self.classLabel.text = user.classe
        self.openLabel.text = "\(String(describing: user.opens!))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestUser(id: Int!) {
        
        let url = self.urlBase + "/users/\(String(describing: id!))"
        let header: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header).responseObject(completionHandler: {
            (response: DataResponse<User>) in
            if let response = response.result.value {
                self.user = response
                self.contents = response.contents!
                self.bindData(user: self.user!)
                self.collectionView.reloadData()
                if self.contents.count == 0 {
                    self.noCoursLabel.isHidden = false
                } else {
                    self.noCoursLabel.isHidden = true
                }
            }
        })
    }
}

extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.className(), for: indexPath as IndexPath) as! SubjectCollectionViewCell
        if let imageUrl = self.contents[indexPath.row].specialty?.logo {
            cell.bindData(imageName: imageUrl, title: self.contents[indexPath.row].title)
        } else {
            cell.bindData(imageName: nil, title: self.contents[indexPath.row].title)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailLessonVC = DetailLessonVC(nibName: DetailLessonVC.className(), bundle: nil)
        detailLessonVC.content = self.contents[indexPath.row]
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
