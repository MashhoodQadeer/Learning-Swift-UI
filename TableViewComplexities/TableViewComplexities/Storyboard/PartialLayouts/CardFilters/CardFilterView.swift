//  CardFilterView.swift
//  TableViewComplexities
//  Created by Mashhood Qadeer on 20/06/2021.

import UIKit

class CardFilterView: UICollectionViewCell {
    
    @IBOutlet weak var widthAnchor_: NSLayoutConstraint!
    var cardFilter: CardFilter?
    @IBOutlet weak var cardFilterText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell( cardFilter: CardFilter ){
        self.cardFilterText.text = cardFilter.cardFilter
    }
    
}
