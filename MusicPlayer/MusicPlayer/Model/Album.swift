
//  Album.swift
//  MusicPlayer
//  Created by Mashhood Qadeer on 03/06/2021.

import Foundation
import UIKit

struct Album   {
    var title: String = ""
    var artisit: String = ""
    var type: String = ""
    var artwork: UIImage = UIImage(named: "song") ?? UIImage()
}
