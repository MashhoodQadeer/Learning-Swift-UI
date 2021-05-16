
//  ContentView.swift
//  EcomeranceApplication
//  Created by Mashhood Qadeer on 15/05/2021.

import SwiftUI

var products : [Product] = [
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product1"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product2"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product3"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product1"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product2"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product3"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4"),
    Product(name: "Test Product", rating: "3.8", itemImage: #imageLiteral(resourceName: "g4"), title: "Test Product", description: "It is for the testing product", itemPrice: "$10", backgroundColor: "Product4")
];

struct HomeScreen: View {
    
    @State var profileIcon : String = Values.ProfileIcon.rawValue
    @State var navIcon : String = Values.NavButton.rawValue
    var tabs: [String] = ["Glasses","Lense","Stylish Glasses","Normal Lense","Expensive Lense"];
    @State var selected: String = "Glasses"
    @Namespace var animation;
    @State var selectedProduct: Product = products[0]
    @State var show: Bool = false
    
    var body: some View {
      
        ZStack{
            VStack {
                Navigationbar(navTapped: self.navPressed, profileTapped: self.profilePressed, navBarButtonIcon: $navIcon, profileImage: $profileIcon)
                VStack{
                    HStack{
                        Text("Let's").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        Text("Get Started").font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }.padding(Dimensions.getValue(dimension: .Padding))
                ScrollView(.horizontal, showsIndicators: false){
                    VStack{
                        HStack{
                            ForEach( tabs, id: \.self) { tab in
                                TabbarItem(animation: animation, selected: $selected, title: tab)
                                    
                                Spacer(minLength: Dimensions.getValue(dimension: .Padding ))
                            }
                        }.padding(.horizontal, Dimensions.getValue(dimension: .Padding))
                    }.frame(maxWidth: .infinity)
                }
                ScrollView{
                    LazyVGrid( columns: Array(repeating: GridItem(.flexible(), spacing: Dimensions.getValue(dimension: .Padding) ), count: 2), spacing: Dimensions.getValue(dimension: .Padding)) {
                        ForEach(products) { product in
                            ProductCell(product: product, animation: animation, isLikedTapped: self.productLikePressed(product:))
                                .gesture(
                                    TapGesture()
                                        .onEnded {
                                            withAnimation(.spring()){
                                                self.selectedProduct = product
                                                self.show = true
                                            }
                                            }
                                         
                                )
                        }
                    }.padding(.horizontal, Dimensions.getValue(dimension: .Padding))
                }
                Spacer()
            }.opacity( show ? 0 : 1  )
            
        if(show) {
            ProductDetailsScreen(product: $selectedProduct, show: $show, animation: animation)
        }
        }
         
    }
    
    func navPressed(){
        
    }
    
    func profilePressed(){
        
    }
    
    func productLikePressed(product: Product){
        product.isLiked = !product.isLiked
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
