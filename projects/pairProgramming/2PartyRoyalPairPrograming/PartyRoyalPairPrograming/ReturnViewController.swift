//
//  ReturnViewController.swift
//  PartyRoyalPairPrograming
//
//  Created by HwangGisu on 2017. 6. 15..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

import UIKit

class ReturnViewController: UIViewController, UITableViewDataSource {
  
    var userInfoArry: [String]?
    
    @IBOutlet var resultTableView: UITableView?
    @IBOutlet var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTableView?.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoArry?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "returnCell_ID", for: indexPath)
        resultCell.textLabel?.text = userInfoArry?[indexPath.row]
        
        return resultCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
