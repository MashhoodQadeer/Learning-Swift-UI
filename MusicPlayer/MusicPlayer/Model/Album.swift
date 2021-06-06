//  Album.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 03/06/2021.

import Foundation
import UIKit

struct Album   {
    var title: String = "Dummy Song"
    var artisit: String = "Mashhood Qadeer"
    var type: String = "music"
    var artwork: UIImage = UIImage(named: "song") ?? UIImage()
}
