
//  Dimension.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 15/05/2021.

import Foundation
import UIKit

class Dimensions {
    
    enum  Dimension {
        case Padding
        case RoundCorners
        case SmallImageIcon
    }
    
    static func getValue( dimension: Dimension ) -> CGFloat {
        var value: CGFloat = 0.0
        switch dimension {
        case .Padding :
            value = 5
            break
        case .RoundCorners :
            value = 10
            break
        case .SmallImageIcon:
            value = 30
            break
        default:
            value = 0
        }
        return value
    }
    
}
