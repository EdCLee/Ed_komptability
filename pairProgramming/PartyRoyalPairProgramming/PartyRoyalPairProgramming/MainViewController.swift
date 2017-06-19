//
//  MainViewController.swift
//  PartyRoyalPairProgramming
//
//  Created by CLEE on 15/06/2017.
//  Copyright © 2017 Jonghun, CLEE, HwangGisu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var userCount:Int?
    var userNameArray:[String] = []
    var currentIndex: IndexPath?
    var stateTemp:Int = 0
    
    var error:Error
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad().userNameArray:[String] ==> \(userNameArray)")
        
        mainTableView?.delegate = self
        mainTableView?.dataSource = self
        
        stepperOutlet.minimumValue = 0.0
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection.userNameArray.count ==> \(userNameArray.count)")
        return userNameArray.count
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        var selectedCell:CustomTableViewCell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell_Id", for: indexPath) as! CustomTableViewCell
        
        cell.textFieldAtCell?.index
        
        // 왜 delegate?
        cell.textFieldAtCell?.delegate = self
        
        currentIndex = indexPath
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController:DetailViewController = segue.destination as! DetailViewController
        nextViewController.userNameArray = self.userNameArray
    }

}


//prepare -> 데이터가 있다고 가정하에 segue
//shouldPerformSegue -> 여기서 예외처리 가능. 데이터가 있는지 없는지.


//}
//
//@IBAction func stepperTouched(_ sender: UIStepper){
//    //현재 문제점은 로우를 가리기만함....
//    userCount =  Int(sender.value)
//    var stempValue = Int(sender.value)// 1
//    
//    
//    
//    //        userInputTableView?.beginUpdates()
//    //        if nowIndexPath?.row ?? 0 == stempValue {  // 최초 클릭시 1 nowIndePat.row = 0
//    //if stempValue >= 0 && stateTemp >= 0  {
//    
//    //Stepper 액션에 따른 분기처리
//    //'+' 클릭시
//    if stateTemp < stempValue{ //최초 0< 1->1<2
//        print("추가할때만 떠라")
//        userInfoArry.append("")
//        //userInputTableView?.insertRows(at: [nowIndexPath!], with: UITableViewRowAnimation.bottom)
//        stateTemp += 1
//        print(stateTemp)
//        print(nowIndexPath)
//        
//    }
//        //'-'클릭시
//    else if stempValue >= 0 && stateTemp > stempValue {
//        print("값 줄일때 떠라")
//        
//        //self.userInputTableView?.beginUpdates()
//        stateTemp -= 1
//        print(stateTemp)
//        print(nowIndexPath)
//        userInfoArry.removeLast()
//        //userInputTableView?.deleteRows(at: [nowIndexPath!], with: UITableViewRowAnimation.bottom)
//        
//        //userInputTableView?.endUpdates()
//        var cell = userInputTableView?.cellForRow(at: nowIndexPath!) as! CustomTableViewCell
//        cell.userInfoTextField?.text = ""
//    }
//    self.userInputTableView?.reloadData()
//    
//    
//    //}
//    //        if let now = nowIndexPath{
//    //           // userInputTableView?.deleteRows(at: [now], with: UITableViewRowAnimation.automatic)
//    //            print(now.row)
//    //        }
//}
//
//
//func textFieldDidEndEditing(_ textField: UITextField) {
//    //현재 받는 주체 textField를 커스텀 텍스트 필드로 다운캐스팅
//    let userInfoTextField: UserInfoTextField = textField as! UserInfoTextField
//    //현재 글 작성이 끝난 셀을 반환
//    let nowCell = userInputTableView?.cellForRow(at: userInfoTextField.indexPath!) as! CustomTableViewCell
//    print(userInfoTextField.indexPath) // 인덱스패스
//    print(nowCell.userInfoTextField?.text)
//    
//    //최초의 row생성시 userInfoArray에 생성 갯수만큰 생성되어 해당 카운트 값을 통해 중복 삽입 처리-문제가많다...'-'를햇을경우 이런방법은 안될텐데..
//    //if userInfoTextField.indexPath?.row == userInfoArry.count{
//    print("인덱스패스로우:  \(userInfoTextField.indexPath?.row)")
//    //userInfoArry.insert((nowCell.userInfoTextField?.text!)!, at: (userInfoTextField.indexPath?.row)!)
//    // 중복 값 할당 방지-현재 셀의 로우의 인덱스에 값을 할당
//    userInfoArry[(userInfoTextField.indexPath?.row)!] = (nowCell.userInfoTextField?.text)!
//    print(userInfoArry)
//    //}
//    
//}
//
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    let nextViewController = segue.destination as! ReturnViewController
//    nextViewController.userInfoArry = self.userInfoArry
//    
//}
