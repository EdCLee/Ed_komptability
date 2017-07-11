//
//  SongDataSource.swift
//  MusicPlayer
//
//  Created by youngmin joo on 2017. 7. 3..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class SongDataSource {
    
    private var songMetaDataArray:[SongMetaData] = []
    
    init() {
        getMetaData()
    }
    
    var numberOfItems:Int{
        return songMetaDataArray.count
    }
    
    func cellForSongData(at index:Int) -> SongMetaData? {
        return  songMetaDataArray[index]
    }
    
    func getMetaData()
    {
    
        for i in 0..<30
        {
            let count:String = "\(i)"
            if let fileURL = Bundle.main.url(forResource: count, withExtension: "mp3")
            {
                let asset:AVAsset = AVURLAsset(url: fileURL, options: nil)
                let metaData:[AVMetadataItem] = asset.commonMetadata
                
                
                let songData = SongMetaData(metaData: metaData, id: i)
                songMetaDataArray.append(songData)
                
//                let duration =  CMTimeGetSeconds(asset.duration)
                
                
            }else
            {
                print("file이 없음")
            }
        }
    }
    
}
