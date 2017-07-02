//
//  ViewController.swift
//  Closure
//
//  Created by CLEE on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //refactoring
    // 설정용 값들을 넣는다.
    private let reuseIdForDetailCell:String = "cell_id"
    private var currentDataArray:[Person] {
        get{
            return DataCenter.shared.dataArray.filter({ (person) -> Bool in
                switch self.tableViewSourceSegmentControl.selectedSegmentIndex {
                case 1:
                    return person.gender == Gender.man
                case 2:
                    return person.gender == Gender.woman
                default:
                    return true
                }
            })
        }
    }
    
    @IBOutlet weak var tableViewSourceSegmentControl:UISegmentedControl!
    @IBOutlet weak var listTableView: UITableView!
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        self.listTableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.listTableView.reloadData()
        print(DataCenter.shared.dataArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(DataCenter.shared.dataArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        let item: Person = DataCenter.shared.dataArray[indexPath.row]
        
        reusableCell.textLabel?.text = item.name
        reusableCell.detailTextLabel?.text = item.phoneNumber
        
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

