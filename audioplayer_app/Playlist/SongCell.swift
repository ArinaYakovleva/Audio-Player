//
//  SongCell.swift
//  audioplayer_app
//
//  Created by Арина Яковлева on 09.08.2021.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var albumPhoto: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    
    var songIndex: IndexPath? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSong(song: Song){
        songNameLabel.text = song.name
        albumPhoto.image = song.albumPhoto
        durationLabel.text = song.duration
        
    }
}
