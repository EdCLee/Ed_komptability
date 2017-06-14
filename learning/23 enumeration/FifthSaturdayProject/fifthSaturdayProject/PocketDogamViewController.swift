//
//  PocketDogamViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 14..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class PocketDogamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        tv.rowHeight = 300

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellcell")
        cell?.textLabel?.text = PoketMonData.names[indexPath.row]
        cell?.imageView?.image = UIImage(named: "\(indexPath.row + 1)")
        return cell!
        
    }
    
    @IBOutlet weak var tv: UITableView!
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PoketMonData.names.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detail = segue.destination as! RandomPocketViewController
        let cell = sender as! UITableViewCell
        
        let vIndex = tv.indexPath(for: cell)
        
        detail.pocketInt = UInt32((vIndex?.row)! + 1)
        
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
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
