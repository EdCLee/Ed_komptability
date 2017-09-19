//
//  ViewController.swift
//  User
//
//  Created by CLEE on 20/07/2017.
//  Copyright © 2017 fastcampus. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//MARK: UI////////////////////////////////////////////
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    
//MARK: PROPERTIES////////////////////////////////////

    //Mutable이 있으면 데이터를 추가 삭제 등을 할 수 있고 없는경우 리퍼런스를 갈아주어야 한다.
    //NON ALAMOFIRE VERSION
//    var data = NSMutableArray() // add 함수가 있음
    
//    var data = NSArray() // 생성자를 통해 데이터를 넣어줄 수 있다.
    
    //SwiftyJSON
    var data : JSON = JSON.init(rawValue: [])!
    
    
//MARK: APP CYCLE/////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchUserData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//MARK: TABLEVIEW/////////////////////////////////////
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print(data.count)
        return data.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        
        let email = self.data[indexPath.row]["email"].stringValue
        let password = self.data[indexPath.row]["password"].stringValue
        
        
        //NON SwiftyJSON VERSION
//        let pair = data.object(at: indexPath.row) as! Dictionary<String, Any>
//        let email = pair["email"] as! String
//        let password = pair["password"] as! String
        cell.textLabel?.text = email
        cell.detailTextLabel?.text = password
        
        return cell
    }
    
    
    
//MARK: IBACTION//////////////////////////////////////
    @IBAction func onRefreshBtnTouched(_ sender: Any) {
        
        self.fetchUserData()
    }
    
    
    @IBAction func onCreateBtnTouched(_ sender: Any) {
        
        createUserData(email: textFieldEmail.text!, password: textFieldPassword.text!)
        refreshTableView()
    }
    
    

//MARK: METHOD////////////////////////////////////////
    func refreshTableView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        self.textFieldEmail.text = ""
        self.textFieldPassword.text = ""
        self.resignFirstResponder()
    }
    
    
    func fetchUserData(){
        
        Alamofire.request("http://localhost:1337/user").responseJSON {
            (response) in
            
            // NETWORK는 애러날 확률이 다분하기에 switch를 써주는게 좋다.
            switch response.result {
            case .success(let value) :
                self.data = JSON(value)
                //NON SwiftyJSON VERSION
//                self.data = value as! NSArray
                self.refreshTableView()
                break
            case .failure(let error) :
                print(error)
                break
            }
        }
        

        //NON ALAMOFIRE VERSION
//        let url = URL(string: "http://localhost:1337/user")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        
//        let task = URLSession.shared.dataTask(with: request) {
//            data, response, error in
//            
//            // guard 문으로 optional chaning 하면 dataStr에서 data! 하지 않아도 된다.
//            guard let data = data else { return }
//            
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
//                self.data = NSMutableArray(array: json)
//                self.refreshTableView()
//            }
//        }
//        task.resume()
    }
    
    
    func createUserData(email : String, password : String){

        let params = ["email" : email, "password" : password]
        
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
        
        
        //NON ALAMOFIRE VERSION
//        let params = [
//            "email" : email,
//            "password" : password
//        ]
//        
//        if let jsonStr = try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0)) {
//            let url = URL(string: "http://localhost:1337/user")
//            var request = URLRequest(url: url!)
//            request.httpMethod = "POST"
//            request.httpBody = jsonStr
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//            
//            let task = URLSession.shared.dataTask(with: request) {
//                data, response, error in
//                guard let data = data else { return }
//                
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> {
//                    self.refreshTableView()
//                }
//            }
//            task.resume()
//        }
    }
    
}



//MARK: EXTENSION/////////////////////////////////////
extension NSMutableData {
    func appendString(_ str: String){
        self.append(str.data(using: .utf8)!)
    }
}

