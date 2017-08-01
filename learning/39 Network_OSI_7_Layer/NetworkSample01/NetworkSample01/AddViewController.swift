//
//  AddViewController.swift
//  NetworkSample01
//
//  Created by CLEE on 20/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

extension NSMutableData {
    func appendString(_ str: String) {
        self.append(str.data(using: .utf8)!)
    }
}

class AddViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pwTextField: UITextField!
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func saveData() {
        
        let params = [
            "email" : email,
            "password" : password
        ]
        
        if let jsonStr = try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0)) {
            let url = URL(string: "http://localhost:1337/user")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.httpBody = jsonStr
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                guard let data = data else { return }
                
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String, Any> {
                    self.refreshTableView()
                }
            }
            task.resume()
        }
        
        
    }
}
