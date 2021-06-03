//  MusicAlbum.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 03/06/2021.

import Foundation
import SwiftUI
import UIKit
import AVKit

let url = URL( fileURLWithPath: Bundle.main.path(forResource: "baby", ofType: "mp3")!)

class MusicAlbum : ObservableObject {
      
      @Published var player = try! AVAudioPlayer(contentsOf: url)
      @Published var isPlaying: Bool = false
      @Published var album = Album()
      @Published var angle: CGFloat = 0
       
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
            }
         }
      }
    
}
