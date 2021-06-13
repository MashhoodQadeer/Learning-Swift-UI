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
    
    @State var showldViewDetail: Bool = false
    @State var categorySelected: String = productGategories[0];
    @State var selectedWatch: Watch = watchesList[0]
    @Namespace var animtion
    
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
                                        ProductItem( watch: watch, addToCart: {
                                            withAnimation(.spring(), {
                                                self.showldViewDetail = true
                                                self.selectedWatch = watch
                                            })
                                        }, animation: self.animtion )
                                    }
                                }.padding(.horizontal, 10)
                            }
                            Spacer()
                    }
                    
                    if( self.selectedWatch != nil && self.showldViewDetail) {
                        
                        VStack( alignment: .leading ){
                            HeaderSection(foregroundColors: .white, backButtonPressed: {
                                withAnimation( .spring(), {
                                                                       self.showldViewDetail = false
                                                                   })
                                
                            })
                            HeaderSubSection(foregroundColors: .white)
                            Spacer()
                            //Body Content

                            ProductDetail(selectedWatch:  self.selectedWatch, meter: meter, animation: self.animtion )

                        }
                        .frame(height: meter.size.height)
                        .background(VStack{
                            Color.black.ignoresSafeArea()
                        })
                        
                    }
                    
                }
            }
        }
       
    }
    
}

struct ProductDetail : View {
    @State var selectedWatch : Watch
    @State var meter: GeometryProxy
    var animation : Namespace.ID
    var body: some View {
        ZStack{
            //For the Title
            VStack(alignment :  .leading ){
                HStack{
                    VStack(alignment: .leading){
                        Text("Type")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(self.selectedWatch.title ?? "N/A")
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
                    Text(self.selectedWatch.color ?? "N/A")
                        .font(.caption)
                        .foregroundColor(.white).padding(.horizontal,5)
                }
                Spacer().frame(height: 15)
                VStack(alignment: .leading){
                    Text("Price")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(self.selectedWatch.price ?? "N/A")
                        .font(.caption)
                        .foregroundColor(.white).padding(.horizontal,5)
                }
                Spacer()
            }.frame( width: meter.size.width)
            VStack{
                Spacer()
                ZStack{
                    VStack{
                        Spacer().frame(height: meter.size.height * 0.30)
                        VStack(alignment: .leading){
                            Text(self.selectedWatch.title ?? "N/A").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            Text(self.selectedWatch.description ?? "N/A").font(.headline)
                                .foregroundColor(Color.gray)
                        }
                        .padding( .horizontal, 15)
                        .padding( .vertical, 30)
                        .frame( width: meter.size.width)
                        .background(Color.white)
                        .cornerRadius(30)

                    }
                    VStack{
                        HStack(){
                            Spacer()
                            Image(uiImage: ((self.selectedWatch.image) ?? UIImage(named: "watch")) ?? UIImage() ).resizable().frame(width: meter.size.width * 0.50, height: meter.size.height * 0.45)
                                .rotationEffect(.init(degrees: -15))
                                .matchedGeometryEffect(id: "watch-id\(self.selectedWatch.id)", in: self.animation)
                        }
                        Spacer()
                    }
                }
            }.offset(y:35)
        }
    }
}

struct ProductItem : View {
    @State var widthView: CGFloat = 200
    @State var watch: Watch
    var backButtonPressed: ( () -> Void  )?
    var addToCart: (() -> Void )?
    var animation : Namespace.ID
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0, content: {
                Image(uiImage: ((self.watch.image) ?? UIImage(named: "watch")) ?? UIImage() ).resizable().frame(width: self.widthView * 0.85, height: self.widthView * 1.4 )
                    .matchedGeometryEffect(id: "watch-id\(self.watch.id)", in: self.animation)
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
            }).overlay(Button(action: { self.addToCart?()  }, label: {
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
    var backButtonPressed: ( () -> Void  )?
    var body: some View {
        HStack{
            Button(action: {  self.backButtonPressed?() }, label: {
                Image(systemName: "chevron.backward.2").foregroundColor(self.foregroundColors)
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
