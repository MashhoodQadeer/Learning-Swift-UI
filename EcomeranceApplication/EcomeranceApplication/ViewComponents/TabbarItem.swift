//
//  TabbarItem.swift
//  EcomeranceApplication
//
//  Created by Mashhood Qadeer on 15/05/2021.
//

import Foundation
import SwiftUI

struct TabbarItem : View {
    var animation: Namespace.ID
    @Binding var selected: String
    var title : String
    var body: some View {
        Button(action: {
            withAnimation( .spring() ) {
                selected = title
            }
        }) {
            Text(title)
                .font(.system(size: 15))
                .foregroundColor( (self.title.elementsEqual( self.selected)) ? .white : .black  )
                .padding( .vertical, Dimensions.getValue(dimension: .Padding))
                .padding( .horizontal, self.getConditionalPadding() )
                .background( ZStack{
                    if (self.title.elementsEqual( self.selected)) {
                    Color.black
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: "TabbarItem", in: animation)
                    }
                })
        }
    }
    
    func getConditionalPadding() -> CGFloat {
        var padding: CGFloat = 0
        padding =  (self.title == self.selected ? Dimensions.getValue(dimension: .Padding) *  2 : Dimensions.getValue(dimension: .Padding) )
        return padding
    }
    
}
