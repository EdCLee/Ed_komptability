//
//  MainViewController.swift
//  MemoAppPractice
//
//  Created by 박종찬 on 2017. 6. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataArray: [[String:Any]]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let reloadFlag: Bool = UserDefaults.standard.bool(forKey: "ReloadFlag")
        
        if reloadFlag {
            loadData()
            self.tableView.reloadData()
            UserDefaults.standard.set(false, forKey: "ReloadFlag")
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        self.dataArray = UserDefaults.standard.array(forKey: "MemoData") as? [[String : Any]]
        
        if self.dataArray == nil {
            self.dataArray = []
            UserDefaults.standard.set(self.dataArray, forKey: "MemoData")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellReuseID")!
        
        let data: [String:Any] = self.dataArray![indexPath.row]
        
        cell.textLabel?.text = data["title"] as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailViewController: DetailViewController = segue.destination as! DetailViewController
        detailViewController.dataArray = self.dataArray
        
        if segue.identifier == "EditSegue" {
            let cell = sender as! UITableViewCell
            detailViewController.editingMode = true
            detailViewController.editingItemIndex = self.tableView.indexPath(for: cell)?.row
        }
    }

}
