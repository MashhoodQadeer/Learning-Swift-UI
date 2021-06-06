//  MusicAlbum.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 03/06/2021.

import Foundation
import SwiftUI
import UIKit
import AVKit

let url = URL( fileURLWithPath: Bundle.main.path(forResource: "baby", ofType: "mp3")!)

class MusicAlbum : NSObject , ObservableObject, AVAudioPlayerDelegate {
    
      @Published var player = try! AVAudioPlayer(contentsOf: url)
      @Published var isPlaying: Bool = false
      @Published var album = Album()
      @Published var angle: CGFloat = 0
      @Published var volumeSize: CGFloat = 2
      var volumeLength: CGFloat = 0
  
      override init() {
        super.init()
        self.player.delegate = self
      }
  
      func fetchAlbum(){ //To fetch the album meta information
        let asset = AVAsset(url: player.url!)
        asset.metadata.forEach { (meta) in
            switch(meta.commonKey?.rawValue) {
            
            case "title":
                album.title = meta.value as? String ?? ""
            break
            
            case "artist":
                album.artisit = meta.value as? String ?? ""
            break
            
            case "type":
                album.type = meta.value as? String ?? ""
            break
            
            case "artwork":
                
                if( meta.value != nil ) {
                    album.artwork = UIImage(data: meta.value as! Data) ?? UIImage()
                }
            break
            
            default:
              print("This is for the default cases")
            }
            
        }
      }
    
    func gestureIsChanged(value : DragGesture.Value ){
         let vector = CGVector( dx: value.location.x, dy: value.location.y )
         let radians = atan2(vector.dy - 12.5, vector.dx - 12.5)
         let tempAnagle = (radians * 180) / .pi
         let tempAngle = tempAnagle < 0 ? (360 + tempAnagle) : tempAnagle
         if tempAngle <= 288 {
            withAnimation(Animation.linear(duration: 0.1)) {
                self.angle = tempAngle
                
                //Applying the progress
                let progress = angle / 288
                let time = TimeInterval(progress) * player.duration
                player.currentTime = time
                player.play()
                withAnimation( Animation.linear(duration: 0.1), {
                    self.angle = CGFloat(Double(angle))
                })
            }
         }
      }
     
     func updateTimer(){
        let currentTime = player.currentTime
        let total = player.duration
        let progress = currentTime / total
        self.isPlaying = self.player.isPlaying
        withAnimation(Animation.linear(duration:  0.1) ){
            self.angle = CGFloat(Double(progress) * 288)
        }
     }
     
    
    
    
      func play(){
        isPlaying = player.isPlaying
        if player.isPlaying{player.pause()}
        else{
            player.play()
            self.isPlaying = true
        }
      }
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        self.isPlaying = false
    }
     
    
    func valumeIsChanged(value : DragGesture.Value ){
        if( value.location.x > -1 && value.location.x < self.volumeLength) {
            self.volumeSize = value.location.x
        }
    
      }
    
}
