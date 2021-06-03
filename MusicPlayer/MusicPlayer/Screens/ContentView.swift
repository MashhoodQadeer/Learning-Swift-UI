
//  ContentView.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 02/06/2021.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var playerData : MusicAlbum =  MusicAlbum()
    @State var widthOffset: CGFloat = 40
    @State var heightOffset: ( width: CGFloat, height: CGFloat ) = (width: 0, height: 0)
    @State var trimLavel: CGFloat = 0.8
    @State var trackIndicator: CGFloat = 25
    @State var parentSize: GeometryProxy?
    
    var body: some View {
        VStack{
            GeometryReader { metter in
                MediaPlayerGauge(parentSize: metter, playerData: playerData, sliderIsMoved: self.valueIsSwiped(value:)).frame(width : metter.size.width, height: metter.size.height )
            }
        }
    }
    
    func valueIsSwiped(value : DragGesture.Value){
         self.playerData.gestureIsChanged(value: value)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
