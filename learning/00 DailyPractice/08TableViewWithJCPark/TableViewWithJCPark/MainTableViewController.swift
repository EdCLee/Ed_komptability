//
//  MainTableViewController.swift
//  TableViewWithJCPark
//
//  Created by CLEE on 06/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class MainTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        // dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        
        switch section {
        case 0:
            return 60
        default:
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Real Madrid"
        default:
            return "Dortmund"
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell: UITableViewCell = UITableViewCell()
        //cell.textLabel?.text = "\(indexPath.row)"
        
        //return cell
        
//        if indexPath.row < 2 {
//            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pinkyRed")!
//            return cell
//            
//        }else {
//            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "limeGreen")!
//            return cell
//        }
        
        if indexPath.section == 0 {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "pinkyRed")!
            cell.textLabel?.textColor = UIColor.white
            cell.textLabel?.text = "\(indexPath.row + 1)"
            
            return cell
        }else {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "limeGreen")!
            cell.textLabel?.text = "\(indexPath.row + 1)"
            
            return cell
        }
    }

}
