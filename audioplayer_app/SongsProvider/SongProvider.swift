//
//  SongProvider.swift
//  audioplayer_app
//
//  Created by Арина Яковлева on 09.08.2021.
//

import UIKit
import AVFoundation

class SongProvider{
    
    func songs() -> [Song]{
        
        return [
            Song(albumPhoto: UIImage(named: "fort_atlantic.jpg")!, name: "Let your heart hold fast", duration: "3:47",author: "Fort Atlantic", fileName: "Let Your Heart Hold Fast", id: 0),
            Song(albumPhoto: UIImage(named: "grizly_bear.jpg")!, name: "Two Weeks", duration: "4:03", author: "Grizly Bear", fileName: "Grizzly Bear - Two Weeks", id: 1),
            Song(albumPhoto: UIImage(named: "theshins.jpg")!, name: "Simple song", duration: "4:16", author: "The Shins", fileName: "The Shins - Simple Song", id: 2),
            Song(albumPhoto: UIImage(named: "radiohead.jpg")!, name: "Nice Dream", duration: "3:47", author: "Radiohead", fileName: "Nice dream", id: 3)
        ]
    }
    
}
