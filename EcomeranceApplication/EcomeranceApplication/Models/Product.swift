//  Product.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 16/05/2021.

import Foundation
import UIKit
import SwiftUI

class Product: Identifiable {
    var id = UUID().uuidString
    var name : String?
    var isLiked: Bool = false
    var rating: String?
    var itemImage: UIImage?
    var title: String?
    var description: String?
    var itemPrice: String?
    var backgroundColor: String?
    
    init(name: String, rating: String, itemImage: UIImage, title: String, description: String, itemPrice: String,
        backgroundColor: String
         ) {
        self.name = name
        self.rating = rating
        self.itemImage = itemImage
        self.description = description
        self.itemPrice = itemPrice
        self.backgroundColor = backgroundColor
    }
    
}
