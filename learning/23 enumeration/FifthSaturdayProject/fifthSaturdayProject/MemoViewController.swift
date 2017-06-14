//
//  MemoViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 12..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tv: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellcell")
        let memoArray = UserDefaults.standard.array(forKey: Need.memo) ?? []
        let memoTitle = memoArray[indexPath.row] as! [String:String]
        
        cell?.textLabel?.text = memoTitle[Need.memoTitle]
        
        
        return cell!
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.array(forKey: Need.memo)?.count ?? 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let memoDetail:MemoDetailViewController = segue.destination as! MemoDetailViewController
        
        
        
        if segue.identifier == "celltomemo"
        {
            
            let cell = sender as? UITableViewCell
            let cellIndexPath = tv.indexPath(for: cell!)
            let memoTitle = UserDefaults.standard.array(forKey: Need.memo) as? [[String:String]] ?? []
            
            memoDetail.titleString = memoTitle[cellIndexPath!.row][Need.memoTitle]
            memoDetail.contentsString = memoTitle[cellIndexPath!.row][Need.memoContents]
            memoDetail.isEditingMode = true
            memoDetail.editingInt = cellIndexPath!.row
            memoDetail.whoIsFirstResponder = true
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
