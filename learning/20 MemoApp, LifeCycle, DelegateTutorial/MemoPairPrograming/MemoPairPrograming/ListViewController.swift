//
//  ListViewController.swift
//  MemoPairPrograming
//
//  Created by HwangGisu on 2017. 6. 8..
//  Modified by HwangGisu, CLEE on 2017. 6. 9..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

// color set: #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)#colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//UI////////////////////////////////////////////////////////////////
    @IBOutlet weak var memoTableView: UITableView!
    
    
//PROPERTIES////////////////////////////////////////////////////////
    var memoArr: [[String:Any]]?    //data
    
    
//LIFE CYCLE////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        memoTableView.reloadData()
        //print(UserDefaults.standard.array(forKey: "list"))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//TABLE VIEW SECTOR/////////////////////////////////////////////////
    
    //MARK: Section Count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArr?.count ?? 0
    }
    
    //MARK: Cell Count
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memoCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        var memoInfo = memoArr?[indexPath.row]
        
        
        memoCell.textLabel?.text = memoInfo?["title"] as? String
        // 버튼, 악세서리를 이용하여 액션 취하는 부분을 구현해보고싶었음....
        //memoCell.accessoryType = UITableViewCellAccessoryType.checkmark
        //memoCell.accessoryView = UIButton.init(type: UIButtonType.infoDark)
        
        return memoCell
    }

    
//METHOD////////////////////////////////////////////////////////////
    
    //MARK: Load Data
    func loadData(){
        memoArr = UserDefaults.standard.array(forKey: "list") as? [[String:Any]] ?? []
        //if memoArr == nil {
            //memoArr = [[]]
        //}
    }
    
    //MARK: Prepare Selected Item View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextController: ItemViewController = segue.destination as! ItemViewController
        
        if segue.identifier == "EditSegue" {
            let cell = sender as! UITableViewCell
            nextController.editMode = true
            nextController.editIndex = self.memoTableView.indexPath(for: cell)?.row
        }
        //nextController.memoArry = self.memoArr
    }

    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        if segue.identifier == "EditSegue" {
    //            let nextController: ItemViewController = segue.destination as! ItemViewController
    //            let cell = sender as! UITableViewCell
    //            nextController.editIndex = self.memoTableView.indexPath(for: cell)?.row
    //            nextController.memoArry = self.memoArr
    //            nextController.editMode = true
    //        }
    //
    //    }

}

//MARK: NOTE
// - 프로퍼티(전역변수)를 통해 값을 가져오면 메모리 관리에 불리.
// - 프로퍼티의 타입은 꼭 써놓도록 한다.
// - App Life Cycle은 정확하게 알고 있어야 한다.

