//  ProductBackgroundShape.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 18/05/2021.

import Foundation
import SwiftUI

struct ProductBackgroundShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let pt1 = CGPoint(x: rect.width, y: 0)
            let pt2 = CGPoint(x: 0, y: rect.height - (rect.height * 0.3) )
            let pt3 = CGPoint(x: 0, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y: rect.height)
            
            path.move(to: pt4)
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: Dimensions.getValue(dimension: .RoundCorners))
            
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: Dimensions.getValue(dimension: .RoundCorners))
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: Dimensions.getValue(dimension: .RoundCorners))
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: Dimensions.getValue(dimension: .RoundCorners))
        }
    }
}
