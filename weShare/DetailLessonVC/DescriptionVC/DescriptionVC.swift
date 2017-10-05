//
//  DescriptionVC.swift
//  weShare
//
//  Created by TRAING Serey on 05/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

class DescriptionVC: DefaultVC {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var descriptionDoc: String?
    var titleDoc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Description"
        if self.titleDoc != nil || self.descriptionDoc != nil {
            self.titleLabel.text = self.titleDoc
            //self.descriptionLabel.text = self.descriptionDoc
            self.descriptionTextView.text = self.descriptionDoc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
