//  ContentView.swift
//  Watch
//  Created by Mashhood Qadeer on 06/06/2021.

import SwiftUI

//General Data
var productGategories: [String] = ["ALL", "CLASSIC","GRAND","FORMAL","ORIGINAL"]

var watchesList: [Watch] = [
    
    Watch(image: #imageLiteral(resourceName: "watch"), title: "Watch", price: "$110", color: "Black", length: "155mm", chainType: "Leather", chainLength: "155mm", description: "Lorem Ipsum refers to a dummy block of text that is often used in publishing and graphic design to fill gaps in the page before the actual words are put into the finished product. Lorem ipsum resembles Latin but has no real meaning"),
    Watch(image: #imageLiteral(resourceName: "watch"), title: "Watch", price: "$110", color: "Black", length: "155mm", chainType: "Leather", chainLength: "155mm", description: "Lorem Ipsum refers to a dummy block of text that is often used in publishing and graphic design to fill gaps in the page before the actual words are put into the finished product. Lorem ipsum resembles Latin but has no real meaning"),
    Watch(image: #imageLiteral(resourceName: "watch"), title: "Watch", price: "$110", color: "Black", length: "155mm", chainType: "Leather", chainLength: "155mm", description: "Lorem Ipsum refers to a dummy block of text that is often used in publishing and graphic design to fill gaps in the page before the actual words are put into the finished product. Lorem ipsum resembles Latin but has no real meaning"),
    Watch(image: #imageLiteral(resourceName: "watch"), title: "Watch", price: "$110", color: "Black", length: "155mm", chainType: "Leather", chainLength: "155mm", description: "Lorem Ipsum refers to a dummy block of text that is often used in publishing and graphic design to fill gaps in the page before the actual words are put into the finished product. Lorem ipsum resembles Latin but has no real meaning"),
    Watch(image: #imageLiteral(resourceName: "watch"), title: "Watch", price: "$110", color: "Black", length: "155mm", chainType: "Leather", chainLength: "155mm", description: "Lorem Ipsum refers to a dummy block of text that is often used in publishing and graphic design to fill gaps in the page before the actual words are put into the finished product. Lorem ipsum resembles Latin but has no real meaning")
]

struct ContentView: View {
    
    @State var categorySelected: String = productGategories[0];
    @State var selectedWatch: Watch?
    
    func selectedCategory(category : String){
        self.categorySelected = category
    }
    
    var body: some View {
        GeometryReader { meter in
            VStack{
                ZStack{
                    HomeScreenBackground()
                    VStack{
                        HeaderSection()
                        HeaderSubSection()
                        CategorySection(selectedCategory: self.selectedCategory(category:), categoriesList: productGategories, selectedCatgory: self.$categorySelected)
                        
                        ScrollView(.horizontal, showsIndicators : false){
                                HStack(spacing: 10){
                                    ForEach( watchesList, id: \.id ) { watch in
                                    ProductItem(watch: watch)
                                    }
                                }.padding(.horizontal, 10)
                            }
                            Spacer()
                    }
                    
                    VStack( alignment: .leading ){
                        
                        HeaderSection(foregroundColors: .white)
                        HeaderSubSection(foregroundColors: .white)
                        Spacer().frame(height : 30)
                        //Body Content
                        ZStack{
                            //For the Title
                            VStack(alignment :  .leading ){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("Type")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(self.selectedWatch?.title ?? "N/A")
                                            .font(.caption)
                                            .foregroundColor(.white).padding(.horizontal,5)
                                    }
                                    Spacer()
                                }
                                Spacer().frame(height: 15)
                                VStack(alignment: .leading){
                                    Text("Color")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(self.selectedWatch?.color ?? "N/A")
                                        .font(.caption)
                                        .foregroundColor(.white).padding(.horizontal,5)
                                }
                                Spacer().frame(height: 15)
                                VStack(alignment: .leading){
                                    Text("Price")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(self.selectedWatch?.price ?? "N/A")
                                        .font(.caption)
                                        .foregroundColor(.white).padding(.horizontal,5)
                                }
                                Spacer()
                            }.frame( width: meter.size.width)
                            ZStack{
                                
                                VStack{
                                    Spacer()
                                    VStack(alignment: .leading){
                                        Text(self.selectedWatch?.title ?? "N/A")
                                        Text(self.selectedWatch?.description ?? "N/A")
                                    }.frame( width: meter.size.width).offset(y:35)
                                    .frame(height: meter.size.height * 0.40)
                                    .background(Color.white)
                                    .cornerRadius(30)
                                }
                                
                                VStack{
                                    HStack(){
                                        Spacer()
                                        Image(uiImage: ((self.selectedWatch?.image) ?? UIImage(named: "watch")) ?? UIImage() ).resizable().frame(width: meter.size.width * 0.50, height: meter.size.height * 0.45)
                                            .rotationEffect(.init(degrees: -15))
                                    }
                                        
                                    Spacer().frame(height: meter.size.height * 0.15)
                                }
                                
                                
                            }.frame( width: meter.size.width).offset(y:35)
                        }
                        
                    }.frame(height: .infinity)
                    .background(VStack{
                        Color.black.ignoresSafeArea()
                    })
                }
            }
        }
       
    }
    
}

struct ProductItem : View {
    @State var widthView: CGFloat = 200
    @State var watch: Watch
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0, content: {
                Image("watch").resizable().frame(width: self.widthView * 0.85, height: self.widthView * 1.4 )
                Spacer().frame(height: 10)
                VStack( alignment: .leading, spacing: 0, content: {
                    Text("Classic Black")
                        .foregroundColor(Color.white)
                        .font(.headline)
                    Text("Watch")
                        .foregroundColor(Color.white)
                        .font(.title)
                    Spacer().frame(height:10)
                })
            }).overlay(Button(action: { }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.orange).font(.title)
            }).frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottomTrailing))
            .padding(.vertical)
            
        }.frame(width: self.widthView )
        .background(
            VStack{
                Color.clear
                Capsule()
                    .fill(Color.clear)
                    .background( LinearGradient(gradient: Gradient(colors: [Color.black, Color.black]), startPoint: .leading, endPoint: .trailing) )
                    .cornerRadius(15)
                    }
        )
    }
}

struct HeaderSection: View {
    var foregroundColors: Color = .black
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease.circle").foregroundColor(self.foregroundColors)
                    .foregroundColor(self.foregroundColors)
                        .frame(width: 30, height: 30)
                        .scaledToFit()
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "cart.circle").foregroundColor(self.foregroundColors)
                    .frame(width: 30, height: 30)
                    .scaledToFit()
            })
        }
    }
}

struct HomeScreenBackground : View {
    var body: some View {
        VStack{
            Color(#colorLiteral(red: 0.9450049996, green: 0.9451631904, blue: 0.9449841976, alpha: 1))
        }.ignoresSafeArea()
    }
}

struct HeaderSubSection : View {
      var foregroundColors: Color = .black
      var body : some View {
        VStack( spacing : 0 ){
            HStack{
                VStack(alignment: .leading){
                    Text("Welcome!")
                        .font(.subheadline)
                        .foregroundColor(self.foregroundColors)
                    Text("Discovery")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(self.foregroundColors)
                }.padding(.horizontal, 5)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(self.foregroundColors)
                        .foregroundColor(self.foregroundColors)
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                })
            }
         }
      }
}

struct CategorySection: View {
    var selectedCategory : ( ( String ) -> Void )?
    var categoriesList : [String]
    @Binding var selectedCatgory: String
    var body: some View {
        VStack{
            ScrollView( .horizontal , showsIndicators: false  ,content: {
                HStack( spacing : 10, content: {
                    ForEach( self.categoriesList, id: \.self  ) { category in
                        Button(action: {
                            self.selectedCategory?(category)
                        }, label: {
                            Text(category)
                                .font(.caption)
                                .foregroundColor( ( category.elementsEqual(self.selectedCatgory) ) ? Color.red : Color.black   )
                        })
                    }
                    
                })
            })
        }.padding(.horizontal, 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
