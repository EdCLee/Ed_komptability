//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by CLEE on 12/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//    @IBOutlet weak var imgInCell: UIImageView!
//    @IBOutlet weak var labelInCell: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
        
        cell.setBackGroundImage(name: "Brick_w.png")
        cell.setTextLabel(text:"1")
        
        return cell
    }

}

