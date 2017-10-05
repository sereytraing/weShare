//
//  SubjectCollectionViewCell.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(imageName: String?, title: String?) {
        self.backgroundColor = UIColor.clear
        self.titleLabel.text = title
        if imageName != nil {
            let url = URL(string: imageName!)
            let data = try? Data(contentsOf: url!)
            imageView.image = UIImage(data: data!)
        } else {
            imageView.image = nil
        }
    }
}

