//  ContentView.swift
//  Watch
//  Created by Mashhood Qadeer on 06/06/2021.

import SwiftUI

//General Data
var productGategories: [String] = ["ALL", "CLASSIC","GRAND","FORMAL","ORIGINAL"]

struct ContentView: View {
    
    @State var categorySelected: String = productGategories[0];
    
    func selectedCategory(category : String){
        self.categorySelected = category
    }
    
    var body: some View {
        VStack{
            ZStack{
                HomeScreenBackground()
                VStack{
                    HeaderSection()
                    HeaderSubSection()
                    CategorySection(selectedCategory: self.selectedCategory(category:), categoriesList: productGategories, selectedCatgory: self.$categorySelected)
                    
                    ProductItem()
                    
                    Spacer()
                }
            }
        }
    }
    
}


struct ProductItem : View {
    @State var widthView: CGFloat = 200
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
            })
            Button(action: { }, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.orange).font(.title)
            }).frame( alignment: .bottomTrailing)
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
    var body: some View {
        HStack{
            Button(action: {}, label: {
                Image(systemName: "line.horizontal.3.decrease.circle").foregroundColor(.black)
                    .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                        .scaledToFit()
            })
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "cart.circle").foregroundColor(.black)
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
      var body : some View {
        VStack( spacing : 0 ){
            HStack{
                VStack(alignment: .leading){
                    Text("Welcome!")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text("Discovery")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }.padding(.horizontal, 5)
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(.black)
                        .foregroundColor(.black)
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
