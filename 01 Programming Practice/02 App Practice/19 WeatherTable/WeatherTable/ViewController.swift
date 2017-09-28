//
//  ViewController.swift
//  WeatherTable
//
//  Created by CLEE on 27/09/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var datalist:[[String:String]] = [[:]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dict1 = ["location":"Seoul","weather":"Rainy"]
        let dict2 = ["location":"Tokyo","weather":"Sunny"]
        let dict3 = ["location":"Hong Kong","weather":"Snowy"]
        let dict4 = ["location":"New York","weather":"Blizzard"]
        let dict5 = ["location":"Barcelona","weather":"Rainy"]
        let dict6 = ["location":"Paris","weather":"Cloudy"]
        let dict7 = ["location":"London","weather":"Cloudy"]
        let dict8 = ["location":"Los Angeles","weather":"Cloudy"]
        let dict9 = ["location":"Busan","weather":"Cloudy"]
        let dict10 = ["location":"Osaka","weather":"Sunny"]
        let dict11 = ["location":"Sanghai","weather":"Blizzard"]
        let dict12 = ["location":"Madrid","weather":"Cloudy"]
        let dict13 = ["location":"Manchester","weather":"Rainy"]
        let dict14 = ["location":"Chicago","weather":"Snowy"]
        
        datalist = [dict1, dict2, dict3, dict4, dict5, dict6, dict7, dict8, dict9, dict10, dict11, dict12, dict13, dict14]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // 스토리보드 셀은 정형화된 Style이 있다
        // Subtitle을 사용하면 textLabel, detailTextLabel 사용가능.
        // cell style 하드코딩 버전.
//        if cell == nil {
//            cell = UITableViewCell(style: UITableViewCellStyle, reuseIdentifier: "Cell")
//        }
        
        var dicTemp = datalist[indexPath.row]
        let locationStr = dicTemp["location"]
        let weatherStr = dicTemp["weather"]
        
        print("indexPath row : \(indexPath.row)")
        
        cell.textLabel!.text = locationStr
        cell.detailTextLabel!.text = weatherStr
        
        if weatherStr == "Sunny" {
            cell.imageView!.image = UIImage(named: "sunny.png")
        } else if weatherStr == "Cloudy" {
            cell.imageView!.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "Rainy" {
            cell.imageView!.image = UIImage(named: "rainy.png")
        } else if weatherStr == "Snowy" {
            cell.imageView!.image = UIImage(named: "snow.png")
        } else {
            cell.imageView!.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }

}

//NOTE:
// 스토리보드 셀은 정형화된 Style이 있다
// Subtitle을 사용하면 textLabel, detailTextLabel 사용가능.

