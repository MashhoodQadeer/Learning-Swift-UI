//  Card.swift
//  TableViewComplexities
//  Created by Mashhood Qadeer on 20/06/2021.

import Foundation
import UIKit

class Card {
      var title: String = ""
      var filtersViewHeight : CGFloat = 0
      var cardFilters: [CardFilter] = []
      var collectionView: UICollectionView?
      init(title : String, cardFilters: [CardFilter]) {
           self.title = title
           self.cardFilters = cardFilters
      }
}
