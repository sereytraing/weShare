//
//  UITableView.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit
public extension UITableView {
    
    func registerCellClass(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterNib(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterClass(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
}
