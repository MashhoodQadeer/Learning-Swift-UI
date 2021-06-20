//  CustomCollectionView.swift
//  TableViewComplexities
//  Created by Mashhood Qadeer on 21/06/2021.

import Foundation
import UIKit

class CustomCollectionView : UICollectionView {
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return self.contentSize
    }
    
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
}
