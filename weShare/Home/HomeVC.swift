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

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var noResultLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let lineSpacing : CGFloat = 10.0
    let inset : CGFloat = 10.0
    
    var contents = [Content]()
    let header: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "weShare"
        self.noResultLabel.isHidden = true
        self.addLeftMenuButton()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.registerCellNib(cellClass: SubjectCollectionViewCell.self)
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        searchButton.layer.cornerRadius = 5.0
        self.collectionView.collectionViewLayout = layout
        self.requestLesson()
        //UserInfoSaver().disconnectAccount()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestLesson() {
        let url = self.urlBase + "/contents"
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header).responseArray(completionHandler: {
            (response: DataResponse<[Content]>) in
            if let response = response.result.value {
                self.contents = response
                self.collectionView.reloadData()
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        })
    }
    
    func requestSearchContent(word: String!) {
        let url = self.urlBase + "/contents/" + word.lowercased()
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: header).responseArray(completionHandler: {
            (response: DataResponse<[Content]>) in
            if let response = response.result.value {
                self.contents = response
                self.collectionView.reloadData()
                if self.contents.count == 0 {
                    self.noResultLabel.isHidden = false
                } else {
                    self.noResultLabel.isHidden = true
                }
            }
        })
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if !(self.textField.text?.isEmpty)! {
            self.requestSearchContent(word: self.textField.text)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.collectionView.reloadData()
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.className(), for: indexPath as IndexPath) as! SubjectCollectionViewCell
        if let imageUrl = self.contents[indexPath.row].specialty?.logo {
            cell.bindData(imageName: imageUrl, title: contents[indexPath.row].title)
        } else {
            cell.bindData(imageName: nil, title: contents[indexPath.row].title)
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
