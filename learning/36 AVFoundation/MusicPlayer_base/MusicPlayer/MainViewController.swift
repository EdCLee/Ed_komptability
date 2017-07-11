//
//  MainViewController.swift
//  MusicPlayer
//
//  Created by CLEE on 04/07/2017.
//  Copyright © 2017 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

//MARK: GLOBAL ////////////////////////////////////////////////
    let dataSource = SongDataSource.init()
    
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }

//MARK: UI ////////////////////////////////////////////////////
    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var coverLayout:UICollectionViewFlowLayout!
  
    

//MARK: APP CYCLE//////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //collectionView.delegate = self
        //collectionView.dataSource = self
        //collectionView.prefetchDataSource = self
        
        let insetSide = collectionView.bounds.size.width/4
        coverLayout.sectionInset = UIEdgeInsets(top: 0, left: insetSide, bottom: 0, right: insetSide)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
//MARK: COLLECTION VIEW METHOD/////////////////////////////////
    //number of item in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.numberOfItems
    }
    
    //cell for item at
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! MyCollectionViewCell
        
        //metaData에 있는 정보 가져오기
        if let newData = dataSource.cellForSongData(at: indexPath.item) {
            myCell.setSongData(newData)
        }
        
        
        return myCell
    }
    
    
    // collection view layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width * 0.5
        let height = collectionView.bounds.size.height * 0.5
        return CGSize(width: width, height:height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            let myCell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
            nextVC.setSong(data:myCell.songData!)
            
            print("\(myCell.songData!)")
            
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    

}
