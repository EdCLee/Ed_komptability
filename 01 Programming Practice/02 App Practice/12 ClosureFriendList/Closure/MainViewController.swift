//
//  ViewController.swift
//  Closure
//
//  Created by CLEE on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

//MARK: PROPERTIES /////////////////////////////////
    //refactoring
    // 설정용 값들을 넣는다.
//    private let reuseIdForDetailCell:String = "cell_id"
    
    private var currentDataArray:[Person]!
    
    @IBOutlet weak var tableViewSourceSegmentControl:UISegmentedControl!
    @IBOutlet weak var listTableView: UITableView!
    
    
    
//MARK: APP CYCLE //////////////////////////////////
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        filterData()
        self.listTableView.reloadData()
        print(DataCenter.shared.dataArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterData()
        print(DataCenter.shared.dataArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    
//MARK: IBACTION ///////////////////////////////////
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        filterData()
        self.listTableView.reloadData()
    }

    
    
//MARK: TABLE VIEW /////////////////////////////////
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell: PersonCell = listTableView.dequeueReusableCell(withIdentifier: PersonCell.reuseIdentifier, for: indexPath) as! PersonCell
        
//        let item: Person = DataCenter.shared.dataArray[indexPath.row]
        
//        reusableCell.textLabel?.text = item.name
//        reusableCell.detailTextLabel?.text = item.phoneNumber

        reusableCell.data = currentDataArray[indexPath.row]
        
        return reusableCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let deletingPerson = (tableView.cellForRow(at: indexPath) as! PersonCell).data!
            DataCenter.shared.remove(person: deletingPerson)
            self.filterData()
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
    
    func filterData() {
        currentDataArray = DataCenter.shared.dataArray.filter({ (person) -> Bool in
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


class PersonCell: UITableViewCell {
    fileprivate static let reuseIdentifier: String = "cell_id"
    var data: Person! {
        didSet {
            self.textLabel?.text = data.name
            self.detailTextLabel?.text = data.phoneNumber
        }
    }
}

