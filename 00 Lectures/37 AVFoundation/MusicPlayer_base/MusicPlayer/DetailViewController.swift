//
//  DetailViewController.swift
//  MusicPlayer
//
//  Created by CLEE on 04/07/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    private var songData:SongMetaData!
    var player:AVPlayer?

    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var artistNameLb: UILabel!
    @IBOutlet weak var albumImg: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let fileName = "\(songData!.songID!)"
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = AVPlayer(url: url)
            print(url)
        }
        
        print(fileName)
        
        player?.play()
        updateUI(data: songData)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setSong(data:SongMetaData){
        songData = data
    }

    
    func updateUI(data:SongMetaData) {
        titleLb.text = data.songTitle
        artistNameLb.text = data.artistName
        albumImg.image = data.albumImg
        
        print("data.songDuration =====")
        print(data.songDuration?.value)
//        progressBar.progress = Float(data.songDuration!) ?? 0.0
        
    }

    
    @IBAction func goBackButton(_ sender: UIButton) {
    }
    
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        player?.play()
        
    }
    
    
    @IBAction func forwardSong(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func backwardSong(_ sender: UIButton) {
    }

}
