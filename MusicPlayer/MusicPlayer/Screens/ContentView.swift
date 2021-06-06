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
    @State var timer = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    var bottomSheetButtons: [String] =  ["suit.heart.fill","star.fill","eye.fill","square.and.arrow.up.fill"]
    
    var body: some View {
        VStack{
            GeometryReader { metter in
                VStack{
                    
                    VStack{
                        HStack{
                            Button(action: {}, label: {
                                Image(systemName: "chevron.left").foregroundColor(.white)
                            })
                            Text("This is for screen title")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "chevron.right").foregroundColor(.white)
                            })
                        }
                    }.padding()
                    .frame(width : metter.size.width )
                    
                    
                    VStack{
                        MediaPlayerGauge(parentSize: metter, playerData: playerData, sliderIsMoved: self.valueIsSwiped(value:))
                        
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5, content: {
                            
                            Text(self.playerData.album.title)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(self.playerData.album.artisit)
                                .font(.subheadline)
                                .foregroundColor(.black)
                            
                        })
                        
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                            Button(action: {}, label: {
                                Image(systemName: "backward.fill")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                            }).padding()
                            Button(action: {self.playerData.play()}, label: {
                                Image(systemName: (self.playerData.isPlaying) ? "pause.fill" : "play.fill"   )
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                                    .foregroundColor((self.playerData.isPlaying) ? .white : .gray)
                                    .background( (self.playerData.isPlaying) ? Color.red : Color.clear  )
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            })
                            Button(action: {}, label: {
                                Image(systemName: "forward.fill")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.gray)
                            }).padding()
                        })
                        
                        
                        HStack{
                            Button(action: {
                                
                                self.playerData.volumeSize = self.playerData.volumeSize + 10
                                
                            }, label: {
                                Text("+").font(.title)
                                    .foregroundColor(.black)
                            })
                            
                            ZStack(alignment: .leading){
                                
                                Capsule().frame(width: metter.size.width * 0.7, height: 4)
                                    .background(Color.gray)
                                
                                Capsule()
                                    .fill(Color.red)
                                    .frame(width: self.playerData.volumeSize, height: 4)
                                    
                                Circle().offset( x: self.playerData.volumeSize).frame(width: 20, height: 20)
                                    
                                
                            }.frame(width: metter.size.width * 0.7).onAppear(perform: {
                                self.playerData.volumeLength = metter.size.width * 0.7
                            }).gesture( DragGesture().onChanged( self.playerData.valumeIsChanged(value:) ) )
                            Button(action: {
                                
                                self.playerData.volumeSize = self.playerData.volumeSize - 10
                                
                            }, label: {
                                Text("-").font(.title)
                                    .foregroundColor(.black)
                            })
                        }
                        
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .cornerRadius(25)
                    .padding(.horizontal)
                    
                    VStack{
                      
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                            
                            
                            ForEach(self.bottomSheetButtons, id: \.self) { name in
                                
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Image(systemName: name)
                                        .foregroundColor(.white)
                                })
                                
                            }
                    
                        })
                        
                    }.padding()
                    
                }.frame(width : metter.size.width, height: metter.size.height )
               
            }
        }
        .background(
            VStack{
                Color.pink
                Color.blue
            }.ignoresSafeArea()
        )
        .onReceive(timer) {(_) in
            self.playerData.updateTimer()
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
