//
//  ViewController.swift
//  WeatherTable
//
//  Created by CLEE on 27/09/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate {

    var datalist:[[String:String]] = [[:]]
    var detaildata:[String:String] = [:]
    var elementTemp:String = ""
    var blank:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let baseURL = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        //delegate를 준수해야 함.
        parser!.delegate = self
        parser!.parse()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
       
        print("didStartElement : \(elementName)")
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo"{
            print("foundCharacters : \(string)")
            detaildata[elementTemp] = string
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            datalist += [detaildata]
            print(detaildata)
        }
        print("didEndElement : \(elementName)")
        blank = false
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
        
        if weatherStr == "맑음" {
            cell.imageView!.image = UIImage(named: "sunny")
        } else if weatherStr == "흐림" {
            cell.imageView!.image = UIImage(named: "cloudy")
        } else if weatherStr == "비" {
            cell.imageView!.image = UIImage(named: "rainy")
        } else if weatherStr == "눈" {
            cell.imageView!.image = UIImage(named: "snow")
        } else {
            cell.imageView!.image = UIImage(named: "blizzard")
        }
        
        return cell
    }

}

//NOTE:
// 스토리보드 셀은 정형화된 Style이 있다
// Subtitle을 사용하면 textLabel, detailTextLabel 사용가능.
//
// event driven 방식의 XMLParser를 사용.
// 데이터 용량이 큰 경우 괜찮은 방식임.
