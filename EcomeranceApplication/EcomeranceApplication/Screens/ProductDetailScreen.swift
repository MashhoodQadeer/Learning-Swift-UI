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
    @State var loadContent: Bool = false
    var colorsList: [String] = ["Product1","Product2","Product3","Product4"]
    @State var selectedColor: Color = Color("Product1")
    var body: some View {
        GeometryReader { metrics in
        VStack( alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content:{
            
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
                    self.selectedColor
                    .clipShape(ProductBackgroundShape())
                    .matchedGeometryEffect(id: "color\(product.id)", in: animation)
            )
            .cornerRadius(Dimensions.getValue(dimension: .RoundCorners))
            .padding()
            
            Spacer(minLength: 0).frame(maxHeight: Dimensions.getValue(dimension: .Padding))
            VStack{
                Text("Exclusive Offer")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text("Things are made very easy for you to play...")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }.frame(maxWidth: metrics.size.width * 0.9)
            .padding(.vertical, Dimensions.getValue(dimension: .Padding))
            .background(self.selectedColor)
            .cornerRadius(Dimensions.getValue(dimension: .RoundCorners))
            
            Spacer(minLength: 0).frame(maxHeight: Dimensions.getValue(dimension: .Padding) * 2)
            
            if(self.loadContent) {
                VStack{
                    VStack(alignment: .center, spacing: 0, content: {
                        HStack{
                            Text("Color")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        HStack{
                            ForEach( 0 ... self.colorsList.count  - 1 , id: \.self) { i in
                                ZStack{
                                    Color(self.colorsList[i])
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .frame(width: 30, height: 30, alignment: .center).onTapGesture {
                                            withAnimation(.spring()){
                                                self.selectedColor = Color(self.colorsList[i])
                                            }
                                        }
                                    if selectedColor ==  Color(self.colorsList[i]) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    })
                    .frame(maxWidth: metrics.size.width * 0.9)
                    Spacer(minLength: 0).frame(maxHeight: Dimensions.getValue(dimension: .Padding) * 2)
                    Button(action: {}, label: {
                          Text("TRY FRAME IN 3D")
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                    })
                    .frame(width: metrics.size.width * 0.6)
                    .padding(Dimensions.getValue(dimension: .Padding))
                    .overlay(
                        RoundedRectangle(cornerRadius: Dimensions.getValue(dimension: .Padding))
                            .stroke(Color.black, lineWidth: 1)
                    )
                    
                    Spacer(minLength: 0).frame(maxHeight: Dimensions.getValue(dimension: .Padding) * 2)
                    
                    Button(action: {}, label: {
                          Text("ADD TO CART")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            
                    })
                    .frame(width: metrics.size.width * 0.6)
                    .padding(Dimensions.getValue(dimension: .Padding))
                    .background(Color.black)
                    .cornerRadius(Dimensions.getValue(dimension: .RoundCorners))
                     
                }
            }
            
            Spacer()
            
        }).onAppear{
              self.selectedColor = Color(self.product.backgroundColor!)
            withAnimation(Animation.spring().delay(0.45)){
                self.loadContent.toggle()
            }
          }
        }
    }
    
    func isLikedTapped(product: Product){
        product.isLiked.toggle()
    }
}
