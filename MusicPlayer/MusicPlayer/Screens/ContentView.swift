
//  ContentView.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 02/06/2021.

import SwiftUI

struct ContentView: View {
    
    @StateObject var playerData : MusicAlbum =  MusicAlbum()
    var body: some View {
        VStack{
            GeometryReader { metter in
                VStack{
                    ZStack {
                        Image(uiImage: playerData.album.artwork)
                            .resizable()
                            .frame( width: metter.size.width * 0.8, height: metter.size.height * 0.4 )
                            .clipShape( Circle() )
                            .aspectRatio(contentMode: .fit)
                        
                        //Rotational Effects
                        ZStack{
                            Circle()
                                .trim(from: 0, to: 0.95)
                                .stroke(Color.black.opacity(0.06), lineWidth: 1.9)
                                .frame(width: ( metter.size.width * 0.8 ) + 50, height: (metter.size.height * 0.4) + 50, alignment: .center)
                        }.rotationEffect(.init(degrees: 126))
                        
                    }
                    Spacer()
                }.frame(width : metter.size.width, height: metter.size.height )
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
