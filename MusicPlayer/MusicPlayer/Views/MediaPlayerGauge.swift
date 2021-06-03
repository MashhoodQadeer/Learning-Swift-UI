
//  MediaPlayerGauge.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 04/06/2021.

import SwiftUI

struct MediaPlayerGauge: View {
    
    var parentSize : GeometryProxy
    @State var  playerData : MusicAlbum
    @State var widthOffset: CGFloat = 40
    @State var heightOffset: ( width: CGFloat, height: CGFloat ) = (width: 0, height: 0)
    @State var trimLavel: CGFloat = 0.8
    @State var trackIndicator: CGFloat = 25
    var sliderIsMoved: ((DragGesture.Value) -> Void)!
    
    var body: some View {
        VStack{
            ZStack {
                Image(uiImage: playerData.album.artwork)
                    .resizable()
                    .frame( width: self.heightOffset.width, height: self.heightOffset.height )
                    .clipShape( Circle() )
                    .aspectRatio(contentMode: .fit)
                
                //Rotational Effects
                ZStack{
                    Circle()
                        .trim(from: 0, to: self.trimLavel)
                        .stroke(Color.black.opacity(0.06), lineWidth: 1.9)
                        .frame(width: self.heightOffset.width + widthOffset
                               , height: self.heightOffset.height + widthOffset, alignment: .center)
                      
                        //Layout for the slider
                        Circle()
                            .trim( from: 0, to: CGFloat(self.playerData.angle) / 360 )
                            .stroke( Color.red, lineWidth: 4 )
                            .frame(width: self.heightOffset.width + widthOffset , height: self.heightOffset.height + widthOffset, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            
                    //Slider Circle
                    Circle()
                        .fill(Color.red)
                        .frame(width: trackIndicator , height: trackIndicator, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: ( ( self.heightOffset.height ) + ( trackIndicator * 0.5)) / 2)
                        .rotationEffect( .init(degrees: Double(self.playerData.angle)) )
                        .gesture( DragGesture().onChanged(  self.sliderIsMoved!) )
                         
                }.rotationEffect(.init(degrees: 126))
                
            }
            Spacer()
        }.frame(width : parentSize.size.width, height: parentSize.size.height ).onAppear(perform: {
            self.heightOffset = ( width: parentSize.size.width * 0.4, height: parentSize.size.height * 0.3 )
        })
    }
}

