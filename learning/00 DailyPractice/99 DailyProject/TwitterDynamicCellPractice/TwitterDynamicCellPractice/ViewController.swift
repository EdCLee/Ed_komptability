//
//  ViewController.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 13..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
//MARK: PROPERTIES////////////////////////////
    
//    var userDataArray : [Twit]! //singleTone은 나중에
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(DataCenter.shared.dataArray)
        
        
        //        userImgButton.layer.cornerRadius = userImgButton.frame.width / 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


    
//MARK: TABLE VIEW////////////////////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.shared.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = self.tableView.dequeueReusableCell(withIdentifier: "timeLineCell", for: indexPath) as! CustomTableViewCell

        myCell.userImgButton.setImage(UIImage(named: DataCenter.shared.dataArray[indexPath.row].userPhotoUrl), for: .normal)
        myCell.contentImgButton.setImage(UIImage(named: DataCenter.shared.dataArray[indexPath.row].imageUrl!), for: .normal)
        
        myCell.userNameLabel.text = DataCenter.shared.dataArray[indexPath.row].userName
        myCell.userIdLabel.text = DataCenter.shared.dataArray[indexPath.row].userId
        myCell.bodyTextLabel.text = DataCenter.shared.dataArray[indexPath.row].bodyText
        
        myCell.userImgButton.layer.cornerRadius = myCell.userImgButton.frame.width / 2
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
}

//class dataCell
