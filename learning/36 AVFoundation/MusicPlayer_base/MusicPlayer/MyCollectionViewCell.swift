//
//  MyCollectionViewCell.swift
//  MusicPlayer
//
//  Created by CLEE on 04/07/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLb:UILabel!
    @IBOutlet var imgView:UIImageView!
    
    private var data:SongMetaData?
    var songData:SongMetaData? {
        return data
    }
    
    func setSongData(_ songData:SongMetaData) {
        
        data = songData
        
        if let title = songData.songTitle {
            titleLb.text = title
        }
        
        if let img = songData.albumImg {
            imgView.image = img
        }
    }
    
}
