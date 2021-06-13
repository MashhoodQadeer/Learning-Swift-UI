//  Watch.swift
//  Created by Mashhood Qadeer on 12/06/2021.

import Foundation
import UIKit

class Watch : Identifiable {
    
    var id = UUID().uuidString
    var image: UIImage = UIImage()
    var title: String = ""
    var price: String = ""
    var color: String = ""
    var length: String = ""
    var chainType: String = ""
    var chainLength: String = ""
    var description: String = ""
    
    init() {
        
    }
    
    init(
        image: UIImage,
        title: String,
        price: String,
        color: String,
        length: String,
        chainType: String,
        chainLength: String,
        description: String
        ) {
        self.image = image
        self.title = title
        self.price = price
        self.color = color
        self.length = length
        self.chainType = chainType
        self.chainLength = chainLength
        self.description = description
    }
    
}
