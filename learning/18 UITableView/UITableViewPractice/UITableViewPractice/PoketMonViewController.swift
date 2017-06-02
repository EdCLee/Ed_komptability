//
//  PocketMonViewController.swift
//  UITableViewPractice
//
//  Created by CLEE on 02/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class PoketMonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //PoketMonData class안에 변수가 property type으로 사용하기 위해 static을한 경우
        return PoketMonData.names.count
        
        //PoketMonData class안에 변수가 static이 아닌경우
        //let PoketMon:PoketMonData = PoketMonData()
        //return PoketMon.names.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoketMonView", for: indexPath)
        
        cell.textLabel?.text = PoketMonData.names[indexPath.row]
        cell.imageView?.image = UIImage(named : "\(indexPath.row + 1)")
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("작동 안되는 중")
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC:DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailView") as! DetailViewController
        
        nextVC.imageName = "\(indexPath.row+1)"
        nextVC.titleName = PoketMonData.names[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(nextVC.imageName!)
        print(nextVC.titleName!)
    }
    
    
}
