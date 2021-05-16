//  ProductDetailScreen.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 16/05/2021.

import Foundation
import SwiftUI
import UIKit

struct  ProductDetailsScreen : View {
    
    @Binding var product : Product
    @Binding var show: Bool
    var animation : Namespace.ID
    
    var body: some View {
        VStack{
            
            HStack{
                
                Button(action: {
                    withAnimation(.spring()){
                        show.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .frame(width: Dimensions.getValue(dimension: .SmallImageIcon), height: Dimensions.getValue(dimension: .SmallImageIcon), alignment: .center)
                })
                
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .frame(width: Dimensions.getValue(dimension: .SmallImageIcon), height: Dimensions.getValue(dimension: .SmallImageIcon), alignment: .center)
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "folder")
                        .frame(width: Dimensions.getValue(dimension: .SmallImageIcon), height: Dimensions.getValue(dimension: .SmallImageIcon), alignment: .center)
                })
                
                Spacer().frame(maxWidth: Dimensions.getValue(dimension: .Padding))
                
            }
            
            //Product View
            VStack {
                Image(uiImage: product.itemImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(product.id)", in: animation)
                    .padding(.top, Dimensions.getValue(dimension: .Padding))
                    .padding(.bottom,Dimensions.getValue(dimension: .Padding))
                    .padding(.horizontal, Dimensions.getValue(dimension: .Padding))
                    .background(Color.clear)
                    
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
                        self.isLikedTapped(product: product)
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
            .padding()
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
          
            
        }
        
    }
    
    func isLikedTapped(product: Product){
        product.isLiked.toggle()
    }
    
}


