//  ProductCell.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 16/05/2021.

import Foundation
import SwiftUI
import UIKit

struct ProductCell : View {
    var product: Product
    var animation : Namespace.ID
    var isLikedTapped : ( (Product) -> Void )?
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Text(product.itemPrice ?? "$0")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.horizontal,Dimensions.getValue(dimension: .Padding) * 2)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(Dimensions.getValue(dimension: .RoundCorners))
                     
            }
            Image(uiImage: product.itemImage!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(product.id)", in: animation)
                .padding(.top, Dimensions.getValue(dimension: .Padding))
                .padding(.bottom,Dimensions.getValue(dimension: .Padding))
                .padding(.horizontal, Dimensions.getValue(dimension: .Padding))
                .background(Color.clear)
                .frame(maxHeight: 70)
            Text(product.name ?? "Not Available")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .matchedGeometryEffect(id: "name\(product.id)", in: animation)
            Text(product.description ?? "Not Available")
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .matchedGeometryEffect(id: "description\(product.id)", in: animation)
            HStack{
                Button(action: {
                    self.isLikedTapped?(product)
                }, label: {
                    if( product.isLiked ) {
                        Image(systemName: "suit.heart.fill")
                            .frame(width: Dimensions.getValue(dimension: .SmallImageIcon), height: Dimensions.getValue(dimension: .SmallImageIcon), alignment: .center)
                            .foregroundColor(Color.red)
                            .matchedGeometryEffect(id: "heart\(product.id)", in: animation)
                    } else {
                        Image(systemName: "suit.heart")
                            .frame(width: Dimensions.getValue(dimension: .SmallImageIcon), height: Dimensions.getValue(dimension: .SmallImageIcon), alignment: .center)
                            .matchedGeometryEffect(id: "heart\(product.id)", in: animation)
                    }
                })
                Spacer()
                Text(product.rating ?? "0.0")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(product.id)", in: animation)
            }
        }
        .padding(Dimensions.getValue(dimension: .Padding))
        .background(
            Color(product.backgroundColor!)
                .matchedGeometryEffect(id: "color\(product.id)", in: animation)
        )
        .cornerRadius(Dimensions.getValue(dimension: .RoundCorners))
        
    }
}
