//
//  ViewController.swift
//  User
//
//  Created by sapsaldog on 20/07/2017.
//  Copyright © 2017 fastcampus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data : JSON = JSON.init(rawValue: [])!

    func refreshTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func fetchUserData(){
        
        Alamofire.request("http://localhost:1337/user").responseJSON { (response) in
            switch response.result {
            case .success(let value):
                self.data = JSON(value)
                self.refreshTableView()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }

    func createUserData(email : String, password : String){
        let params = [
            "email" : email,
            "password" : password
        ]
        
        Alamofire.request("http://localhost:1337/user", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(_):
                self.refreshTableView()
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    @IBAction func onRefreshBtnTouched(_ sender: Any) {
        self.fetchUserData()
    }
    
    @IBAction func onCreateBtnTouched(_ sender: Any) {
        createUserData(email: textFieldEmail.text!, password: textFieldPassword.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchUserData()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print(data.count)
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let email = self.data[indexPath.row]["email"].stringValue
        let password = self.data[indexPath.row]["password"].stringValue
        cell.textLabel?.text = email
        cell.detailTextLabel?.text = password
        
        return cell
    }


}

