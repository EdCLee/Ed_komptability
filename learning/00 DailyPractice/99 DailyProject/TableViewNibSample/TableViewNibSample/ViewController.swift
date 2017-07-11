//
//  ViewController.swift
//  TableViewNibSample
//
//  Created by CLEE on 03/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.register(UINib.init(nibName: "CustomNibTableViewCell", bundle: nil), forCellReuseIdentifier: CustomNibTableViewCell.reuseId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

