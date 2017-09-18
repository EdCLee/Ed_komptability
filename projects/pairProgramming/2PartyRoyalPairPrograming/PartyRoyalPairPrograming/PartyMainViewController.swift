//
//  PartyMainViewController.swift
//  PartyRoyalPairPrograming
//
//  Created by HwangGisu on 2017. 6. 15..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

import UIKit

/*
  배열로 로우갯수를 카운트 하는 방법으로 구현된 방법을 cell을 reque하지 않고 생성 하여 해보자

  현재 구현상태 
  - UITextFieldDelegate를 선언하는 부분은 당연히 테이블뷰의 셀에서 선언하여 사용하지만 해당기능을 담당하는 셀에서 처리하여 뷰가 받는 식으로 바꿀필요가 있다.
  - 객체 지향 프로그래밍 관점에서 접근하자.
  - 개선방법(강사님 조언) : 테이블의 셀이 해야할 역할을 뷰컨트롤이 하는것 보다 테이블뷰셀의 상위개념인 테이블뷰에서 컨트롤 할필요가 있다.
                     컨트롤할 프로토콜을 선언하고 델리게이트 패턴을 이용하여 적용시켜보자
                     그리고, 배열도 좋지만 해당셀의 인덱스패스를 키값으로 해당 텍스트를  벨류로 할당할수있게 딕셔너리를 써보자.
 */


class PartyMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var userCount: Int?
    var userInfoArry: [String] = []  //옵셔널로 선언하지 않아 닐 병합 연산자 불가!
//    var nowIndexPath: IndexPath? //이제 필요없는 놈
    var stateTemp: Int = 0
    @IBOutlet var userInputTableView: UITableView!
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet var moneyTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate Pattern 사용할거라 선언
        userInputTableView?.dataSource = self
        userInputTableView?.delegate = self
        
        stepperOutlet.minimumValue = 0.0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MAKR: - UITableViewDataSource 필수 구현 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(userInfoArry.count)
        return userInfoArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: "customCell_ID", for: indexPath) as! CustomTableViewCell
            userCell.userInfoTextField?.indexPath = indexPath
        
            userCell.userInfoTextField?.text = userInfoArry[indexPath.row]
        
            //UITextFieldDelegate 선언-음..이해한거같은데 아직 부족한듯...뷰컨에 직접하면 모든 텍스트 필드 적용
            userCell.userInfoTextField?.delegate = self
            //nowIndexPath = indexPath
        

        
        return userCell
    }
    
    @IBAction func stepperTouched(_ sender: UIStepper){  // Button 외에는 대부분이 valueChange : 현재 메서드명을 바꿀필요잇다!
        //현재 문제점은 로우를 가리기만함....
        let stepValue = Int(sender.value)// 1
        
        
        
//        userInputTableView?.beginUpdates()
//        if nowIndexPath?.row ?? 0 == stempValue {  // 최초 클릭시 1 nowIndePat.row = 0
        //if stempValue >= 0 && stateTemp >= 0  {
        //Stepper 액션에 따른 분기처리 : 만약 value가 userInfoArry.count와 같다면 그대로 두고, 크다면 어팬드, 작다면 리무브.
        //'+' 클릭시
        if stepValue > userInfoArry.count {
            userInfoArry.append("")
        }
        else if stepValue < userInfoArry.count {
            userInfoArry.removeLast()
        }
        
//        * 기존 분기 처리 : 임시공간 변수를 전역변수로 선언하여 그값을 현재 스탭퍼 벨류와 비교하여 하였다..참 ...생각 없다....
//        if stateTemp < stempValue{ //최초 0< 1->1<2
//            print("추가할때만 떠라")
//            userInfoArry.append("")
//            //userInputTableView?.insertRows(at: [nowIndexPath!], with: UITableViewRowAnimation.bottom)
//            stateTemp += 1
//            print(stateTemp)
//            print(nowIndexPath)
//            
//        }
//        //'-'클릭시
//        else if stempValue >= 0 && stateTemp > stempValue {
//            print("값 줄일때 떠라")
//            
//            //self.userInputTableView?.beginUpdates()
//            stateTemp -= 1
//            print(stateTemp)
//            print(nowIndexPath)
//            userInfoArry.removeLast()
//            //userInputTableView?.deleteRows(at: [nowIndexPath!], with: UITableViewRowAnimation.bottom)
//            
//            //userInputTableView?.endUpdates()
//
//        }
        
        self.userInputTableView?.reloadData()

        
        //}
//        if let now = nowIndexPath{
//           // userInputTableView?.deleteRows(at: [now], with: UITableViewRowAnimation.automatic)
//            print(now.row)
//        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //현재 받는 주체 textField를 커스텀 텍스트 필드로 다운캐스팅
        let userInfoTextField: UserInfoTextField = textField as! UserInfoTextField
        //현재 글 작성이 끝난 셀을 반환
        let nowCell = userInputTableView?.cellForRow(at: userInfoTextField.indexPath!) as! CustomTableViewCell
        print(userInfoTextField.indexPath) // 인덱스패스
        print(nowCell.userInfoTextField?.text)
        
        //최초의 row생성시 userInfoArray에 생성 갯수만큰 생성되어 해당 카운트 값을 통해 중복 삽입 처리-문제가많다...'-'를햇을경우 이런방법은 안될텐데..
        //if userInfoTextField.indexPath?.row == userInfoArry.count{
        print("인덱스패스로우:  \(userInfoTextField.indexPath?.row)")
        //userInfoArry.insert((nowCell.userInfoTextField?.text!)!, at: (userInfoTextField.indexPath?.row)!)
        // 중복 값 할당 방지-현재 셀의 로우의 인덱스에 값을 할당
        
        // 해당 인덱스패스의 로우를 받아 기존에 만든  Array인덱스에 텍스트 정보 삽입
        userInfoArry[(userInfoTextField.indexPath?.row)!] = (nowCell.userInfoTextField?.text)!
        print(userInfoArry)
        
        print("섹션 : \(userInfoTextField.indexPath?.section)")
        
    }
    
    // MARK: - 랜덤 함수
    // 참여 인원정보와 금액 정보를 받아 랜덤을 통해 특정 한명에게는 금액을 나누지 않고 남은 인원들에게 금액 부과
    func random(userInfo: [String], money: Int)-> [String] {
//        var userInfoRandom = userInfo
        // 새롭게 담을 array 변수에 초기화
        var userInfoRandom: [String] = []
        // 금액계산부분 '이름':'금액' 키 벨류 형식에 딕셔너리로 변경예정
        var moneyInfo = money
        var resultDic: [String:Int] = [:]
        var randomIndex: Int = 0
        // 현재 userInfoArr를 받아 호출시 랜덤으로 정리할 빈 배열 선언하여 배열에 현재 배열 인덱스에
        randomIndex = Int(arc4random_uniform(UInt32(userInfo.count)))
        print("userInfo.count: \(userInfo.count)")
        print("randomIndex: \(randomIndex)")
        
        
        // userInfoRandom array에 해당 값이 존재 하지않을때 : 중복제거 최초의 승리자를 선정
        userInfoRandom.append(userInfo[randomIndex])
        
        print("userInfo.count : \(userInfo.count)")
//        for _ in 1...userInfo.count{
//            print(userInfo.count)
//            // 0부터 해당 어레이에 인덱스 번호 까지 - 배열에 값이 4개일 경우 0~3 개중 랜덤
//            randomIndex = Int(arc4random_uniform(UInt32(userInfo.count)))
//            print(userInfoRandom)
//            // 중복제거이지만... userInfo.count의 갯수는 정해져있기에 해당 횟수만큼만 호출되어 값이 다들어가지 않는다.
//            if !userInfoRandom.contains(userInfo[randomIndex]){
////                print("index: \(index)  randomIndex: \(randomIndex)")
////                userInfoRandom[index] = userInfo[randomIndex]
//                randomIndex = Int(arc4random_uniform(UInt32(userInfo.count)))
//            }
//            userInfoRandom.append(userInfo[randomIndex])
//            //money
//        }
//        
        while userInfoRandom.count < userInfo.count {
            randomIndex = Int(arc4random_uniform(UInt32(userInfo.count)))
            if !userInfoRandom.contains(userInfo[randomIndex]){
               userInfoRandom.append(userInfo[randomIndex])
            }
           
        }
        
        
        print("userInfoRandom: \(userInfoRandom)")
        
  
        print(userInfoRandom)
        return userInfoRandom
        
    }
    
    // Segue를 타기전 확인해보자
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var flag = false
        if !userInfoArry.isEmpty && moneyTextField.text != nil {
            flag =  true
        }
        
        return flag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! ReturnViewController
        nextViewController.userInfoArry = random(userInfo: self.userInfoArry, money: Int(self.moneyTextField.text!)!)
        
        
    }

}
