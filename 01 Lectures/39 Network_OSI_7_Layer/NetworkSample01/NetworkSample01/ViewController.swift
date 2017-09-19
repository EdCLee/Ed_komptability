//
//  ViewController.swift
//  NetworkSample01
//
//  Created by CLEE on 20/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //Mutable이 있으면 데이터를 추가 삭제 등을 할 수 있고 없는경우 리퍼런스를 갈아주어야 한다.
    var data = NSMutableArray() // add 함수가 있음
    var normalArray = NSArray() // normalArray 생성자를 통해서 데이터를 넣어줘야 함.
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func reloadData() {
        
        let url = URL(string: "http://localhost:1337/user")
        var request = URLRequest(url : url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            // data는 실제 Data 자료형. body에 담겨서 옴.
            // response는
            // error는
            data, response, error in
            
            // guard문으로 optional chaning 하면 dataStr에서 data! 하지 않아도 된다.
            guard let data = data else {return }
            
            let dataStr = String.init(data: data, encoding: .utf8)
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Array<Any> {
                
                self.data = NSMutableArray(array: json)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                debugPrint(json)
                
                
                // Dictionary version
                //for obj in json {
                //    let pair = obj as! Dictionary<String, Any>.Element
                //    let email = pair["email"] as! String
                //    print(email)
                //}
                
                // NSDictionary version
                //for obj in json {
                //    let pair = obj as! NSDictionary
                //   print(pair["email"]!)
                //}
                
            }
            
            //print(dataStr)
            //print("data: \(String(describing: String.init(data: data!, encoding: .utf8)))")
            //print("response: \(String(describing: response))")
            //print("error: \(String(describing: error))")
            
        }
        // 필수적으로 실행은 해줘야 한다.
        task.resume()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let pair = data.object(at: indexPath.row) as! Dictionary<String, Any>
        
        let email = pair["email"] as! String
        let password = pair["password"] as! String
        
        cell.textLabel?.text = email
        cell.detailTextLabel?.text = password
        
        return cell
        
    }

}

