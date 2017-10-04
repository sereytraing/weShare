//
//  UICollectionView.swift
//  weShare
//
//  Created by TRAING Serey on 04/10/2017.
//  Copyright © 2017 TRAING Serey. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func registerCellClass(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    func registerCellNib(cellClass: AnyClass) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func registerCellNib(cellClass: AnyClass, forSupplementaryViewOfKind: String) {
        let identifier = String(describing: cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: identifier)
    }
}
