//
//  HeaderView.swift
//  audioplayer_app
//
//  Created by Арина Яковлева on 09.08.2021.
//

import UIKit

class HeaderView: UIView {
    var header = UILabel()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func addSubview(_ view: UIView) {
        header.text = "Playlist"
        view.addSubview(header)
    }
    
//    override func draw(_ rect: CGRect) {
//        header.text = "Playlist"
//        
//    }
    

}
