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
    
}
