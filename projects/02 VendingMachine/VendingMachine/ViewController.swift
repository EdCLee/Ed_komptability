//
//  ViewController.swift
//  VendingMachine
//
//  Created by CLEE on 19/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: 전역변수//////////////////////////////////
    var moneyOutOfMyHand:Int = 0
//    var displayMessage:String = ""
//    var selectItem:String = ""

    
    //MARK: 돈. class Coin은 tag써서 똥됨./////////////
//    let coin1:Coin = Coin(worth: 1)
//    let coin2:Coin = Coin(worth: 2)
//    let coin3:Coin = Coin(worth: 3)
    
    
    //MARK: item///////////////////////////////////
    let rifle:Item = Item(itemName: "Rifle", itemPrice: 5)
    let knife:Item = Item(itemName: "Knife", itemPrice: 3)
    let grenade:Item = Item(itemName: "Grenade", itemPrice: 10)
    let ammo:Item = Item(itemName: "ammo", itemPrice: 2)
    let legoBrick:Item = Item(itemName: "Lego Brick", itemPrice: 1)
    let mjolnir:Item = Item(itemName: "Mjolnir", itemPrice: 100)
    
    
    //MARK: 재고 컨트롤러/////////////////////////////
    var rifleStock:ItemStock = ItemStock(stock: [])
    var knifeStock:ItemStock = ItemStock(stock: [])
    var grenadeStock:ItemStock = ItemStock(stock: [])
    var ammoStock:ItemStock = ItemStock(stock: [])
    var legoBrickStock:ItemStock = ItemStock(stock: [])
    var mjolnirStock:ItemStock = ItemStock(stock: [])
    
    
    //MARK: DISPLAYER/////////////////////////////
    // 상태 Displayer
    @IBOutlet weak var displayModule:   UILabel!
    // 잔돈 Displayer
    @IBOutlet weak var changeDisplay:   UILabel!
    // Error Displayer
    @IBOutlet weak var inserErrorDisplay: UILabel!
    // 금액 입력 창
//    @IBOutlet weak var insertMoneyText: UITextField!
    // 받은 상품 또는 돈 Displayer
    @IBOutlet weak var receivedItem: UIImageView!
    // 아이템 수량 Displayer
    @IBOutlet weak var rifleStockIndicator: UILabel!
    @IBOutlet weak var knifeStockIndicator: UILabel!
    @IBOutlet weak var grenadeStockIndicator: UILabel!
    @IBOutlet weak var ammoStockIndicator: UILabel!
    @IBOutlet weak var brickStockIndicator: UILabel!
    @IBOutlet weak var mjolnirStockIndicator: UILabel!
    
    
    //MARK: 돈 넣기/////////////////////////////////
    @IBAction func insertCoin(_ sender: UIButton) {
        let inputCoinValue:Int = sender.tag
        
        self.inserErrorDisplay.text = ""
        self.receivedItem.image = UIImage(named:"")
        self.moneyOutOfMyHand += sender.tag
        self.changeDisplay.text = "Coins: \(moneyOutOfMyHand)c"
        self.displayModule.text = "Insert \(inputCoinValue)c"
    }
    
    
    //MARK: 돈 반환/////////////////////////////////
    @IBAction func changeButton(_ sender: UIButton) {
        if self.moneyOutOfMyHand > 0 {
            self.changeDisplay.text = "0c"
            self.receivedItem.image = UIImage(named:"coin3")
            
            self.displayModule.text = "Return back \(self.moneyOutOfMyHand) coins"
            self.moneyOutOfMyHand = 0
        }else{
            self.displayModule.text = "There is no money for you."
            self.inserErrorDisplay.text = "not in money"
        }
        
    }
    
    
    //MARK: 아이템 리스트/////////////////////////////
    // tag 값을 배열로 호출받을 수 있다.
    @IBAction func pickItem(_ sender: UIButton) {
        switch sender.tag {
        case 201:
            if self.rifleStock.stock.count < 0 {
                //재고량에 따라 alpha값을 조정하는 함수. 추후에 다시 손 봐야 함.
                sender.alpha = 1.0
                if moneyOutOfMyHand >= self.rifle.itemPrice {
                    self.moneyOutOfMyHand -= self.rifle.itemPrice
                    self.rifleStock.stock.remove(at: 0)
                    
                    self.rifleStockIndicator.text = String(rifleStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-5c, SQUIRREL!!!!!"
                }else if moneyOutOfMyHand < self.rifle.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                sender.alpha = 0.2
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"
            }
        case 202:
            if self.knifeStock.stock.count > 0 {
                if moneyOutOfMyHand >= self.knife.itemPrice {
                    self.moneyOutOfMyHand -= self.knife.itemPrice
                    self.knifeStock.stock.remove(at: 0)
                    
                    self.knifeStockIndicator.text = String(knifeStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-3c, NINJA!!"
                }else if moneyOutOfMyHand < self.knife.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"
            }
        case 203:
            if self.grenadeStock.stock.count > 0 {
                if moneyOutOfMyHand >= self.grenade.itemPrice {
                    self.moneyOutOfMyHand -= self.grenade.itemPrice
                    self.grenadeStock.stock.remove(at: 0)
                    
                    self.grenadeStockIndicator.text = String(grenadeStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-10c, Thanks for purchasing a *SEXY* Grenade."
                }else if moneyOutOfMyHand < self.grenade.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"
            }
        case 204:
            if self.ammoStock.stock.count > 0 {
                if moneyOutOfMyHand >= self.ammo.itemPrice {
                    self.moneyOutOfMyHand -= self.ammo.itemPrice
                    self.ammoStock.stock.remove(at: 0)
                    
                    self.ammoStockIndicator.text = String(ammoStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-2c, Thanks for purchasing spiky ammo."
                }else if moneyOutOfMyHand < self.ammo.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"
            }
        case 205:
            if self.legoBrickStock.stock.count > 0 {
                if moneyOutOfMyHand >= self.legoBrick.itemPrice {
                    self.moneyOutOfMyHand -= self.legoBrick.itemPrice
                    self.legoBrickStock.stock.remove(at: 0)
                    
                    self.brickStockIndicator.text = String(legoBrickStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-1c, Destroy toe of enemies!"
                }else if moneyOutOfMyHand < self.legoBrick.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"
            }
        case 206:
            if self.mjolnirStock.stock.count > 0 {
                if moneyOutOfMyHand >= self.mjolnir.itemPrice {
                    self.moneyOutOfMyHand -= self.mjolnir.itemPrice
                    self.mjolnirStock.stock.remove(at: 0)
                    
                    self.mjolnirStockIndicator.text = String(mjolnirStock.stock.count)
                    self.changeDisplay.text = String(moneyOutOfMyHand)
                    self.displayModule.text = "-100c, May *Valhalla* be with you!"
                }else if moneyOutOfMyHand < self.mjolnir.itemPrice {
                    self.displayModule.text = "Need more money"
                    self.inserErrorDisplay.text = "Need more money"
                }
            }else {
                self.inserErrorDisplay.text = "Please refill items"
                self.displayModule.text = "Out of stock"


            }
        default:
            return
        }
    }
    
    //MARK: 재고, 돈 모두 초기화!
    @IBAction func resetButton(_ sender: UIButton) {
        resetAll()
    }
    
    func resetAll() {
        viewDidLoad()
        showDialog(title: "YEEEEEEHA!!", message: "system reloaded!")
    }
    
    
    //MARK: 다이얼로그 띄우는 함수///////////////////////
    func showDialog(title: String, message: String) {
        
        let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
        dialog.addAction(action)
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    //MARK: 금액에 세자리수마다 콤마(,)를 찍는 함수/////////
    func addCommafor(money:Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let result = numberFormatter.string(from: NSNumber(value:money))!
        
        return result
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.displayModule.layer.cornerRadius = 5
//        self.changeDisplay.layer.cornerRadius = 5
//        self.inserErrorDisplay.layer.cornerRadius = 5
        
        //reset!
        displayModule.text = "WELCOME WEAPON STORE!"
        inserErrorDisplay.text = ""
        changeDisplay.text = ""
        moneyOutOfMyHand = 0
        self.rifleStock.stock = []
        self.knifeStock.stock = []
        self.grenadeStock.stock = []
        self.ammoStock.stock = []
        self.legoBrickStock.stock = []
        self.mjolnirStock.stock = []
        
        //rifle 재고 추가
        
        for _ in 1...10 {
            self.rifleStock.stock.append(rifle)
        }
        self.rifleStockIndicator.text = String(rifleStock.stock.count)
        
        //knife 재고 추가
        for _ in 1...20 {
            self.knifeStock.stock.append(knife)
        }
        self.knifeStockIndicator.text = String(knifeStock.stock.count)
        
        //grenade 재고 추가
        for _ in 1...5 {
            self.grenadeStock.stock.append(grenade)
        }
        self.grenadeStockIndicator.text = String(grenadeStock.stock.count)
        
        //ammo 재고 추가
        for _ in 1...20 {
            self.ammoStock.stock.append(ammo)
        }
        self.ammoStockIndicator.text = String(ammoStock.stock.count)
        
        //legoBrick 재고 추가
        for _ in 1...50 {
            self.legoBrickStock.stock.append(legoBrick)
        }
        self.brickStockIndicator.text = String(legoBrickStock.stock.count)
        
        //mjolnir 재고 추가
        for _ in 1...1 {
            self.mjolnirStock.stock.append(mjolnir)
        }
        self.mjolnirStockIndicator.text = String(mjolnirStock.stock.count)
    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    



}

