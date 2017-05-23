//
//  ViewController.swift
//  VendingMachine
//
//  Created by CLEE on 19/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: 전역변수
    var displayMessage:String = ""
    var moneyOutOfMyHand:Int = 0
    var selectItem:String = ""

//    // MARK: 돈. tag써서 똥됨.
//    let coin1:Coin = Coin(worth: 1)
//    let coin2:Coin = Coin(worth: 2)
//    let coin3:Coin = Coin(worth: 3)
    
    // MARK: item. 재고는 어떻게 할까?
    let rifle:Item = Item(itemName: "Rifle", itemPrice: 3)
    let knife:Item = Item(itemName: "Knife", itemPrice: 1)
    let grenade:Item = Item(itemName: "Grenade", itemPrice: 5)
    let bullets:Item = Item(itemName: "Bullets", itemPrice: 3)
    let mjolnir:Item = Item(itemName: "Mjolnir", itemPrice: 100)
    let captain:Item = Item(itemName: "Captain", itemPrice: 100)
    
    // 상태
    @IBOutlet weak var displayModule:   UILabel!
    // 잔돈 표시
    @IBOutlet weak var changeDisplay:   UILabel!
    // Error 표시
    @IBOutlet weak var inserErrorDisplay: UILabel!
    //    // 금액 입력 창
    //    @IBOutlet weak var insertMoneyText: UITextField!
    // 받은 상품 또는 돈!
    @IBOutlet weak var receivedItem: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.displayModule.layer.cornerRadius = 5
//        self.changeDisplay.layer.cornerRadius = 5
//        self.inserErrorDisplay.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


    // MARK: 돈 넣기
    @IBAction func insertCoin(_ sender: UIButton) {
        let inputCoinValue:Int = sender.tag
        
        self.inserErrorDisplay.text = ""
        self.receivedItem.image = UIImage(named:"")
        self.moneyOutOfMyHand += sender.tag
        self.changeDisplay.text = String(moneyOutOfMyHand)
        self.displayModule.text = "+\(inputCoinValue)c 넣어서 \(self.moneyOutOfMyHand) c만큼 있습니다."
        }
    
    // MARK: 돈 반환
    @IBAction func changeButton(_ sender: UIButton) {
        if self.moneyOutOfMyHand > 0 {
            self.changeDisplay.text = "0"
            self.receivedItem.image = UIImage(named:"legoCoin.png")
            
            self.displayModule.text = "\(self.moneyOutOfMyHand)c만큼 거슬러 줌."
            self.moneyOutOfMyHand = 0
        }else{
            self.displayModule.text = "없어!!"
            self.inserErrorDisplay.text = "잔액이 없어 인출 불가"
        }
    
    }
    
    // MARK: 아이템 리스트
    @IBAction func pickItem(_ sender: UIButton) {
//tag 값을 배열로 호출받을 수 있다.
        switch sender.tag {
        // 라이플
//        case 101:
//            if moneyOutOfMyHand >= self.rifle.itemPrice {
//                self.moneyOutOfMyHand -= self.rifle.itemPrice
//                self.receivedItem.image =
//            }else{
//                
//            }
    ////        case 201:
    ////        case 301:
    ////        case 401:
    ////        case 501:
    ////        case 1001:
            default:
                return
            }
    
        }

    
//    if self.aPTray.tray.count > 0 {
//    
//    if currentInputValue >= self.airPods.price {
//    self.currentInputValue -= self.airPods.price
//    self.insertLabel.text = "0"
//    self.changeLabel.text = String(currentInputValue)
//    self.noticeLabel.text = "You Got an Airpods🎉"
//    self.ResultImageLabel.image = #imageLiteral(resourceName: "AirPods 159.jpeg")
//    
//    if self.aPTray.tray.count > 0 {
//    self.aPTray.tray.remove(at: 0)
//    self.aPCountLabel.text = String(self.aPTray.tray.count)
//    }
//    
//    }
//    else if currentInputValue < self.airPods.price {
//    self.noticeLabel.text = "INSURFFICIENT CASH💸 :("
//    }
//    
//    }
//    else {
//    self.aPCountLabel.text = String(self.aPTray.tray.count)
//    self.noticeLabel.text = "SOLD OUT"
//    }
//}

}

