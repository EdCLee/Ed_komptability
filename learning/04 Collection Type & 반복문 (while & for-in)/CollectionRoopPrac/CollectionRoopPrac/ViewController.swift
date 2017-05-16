//
//  ViewController.swift
//  CollectionRoopPrac
//
//  Created by CLEE on 16/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

//딱 하나의 플로우를 만들어서 반복 구간을 설정하는게 반복문 잘 만드는 팁

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // 로또 숫자 뽑기(arc4random_uniform(maxNum)) 중복 허용
    // max 45, 숫자 6개 뽑기
    func findLotto() -> [Int] {
        var lottoNumbers:[Int] = []
        
        for _ in 1...6  {
            let randomNum:UInt32 = arc4random_uniform(45)
            lottoNumbers.append(Int(randomNum))
        }
        return lottoNumbers
    }
    
    // 로또 숫자 6개 뽑기
    // 중복 숫자 불가
    func getLottoNum() -> [UInt32] {
        var lottoNumbers:[UInt32] = []
        
        while lottoNumbers.count < 6 {
            let randomNum:UInt32 = arc4random_uniform(45)
            //중복 숫자 체크
            if !lottoNumbers.contains(randomNum) && randomNum != 0 {
                lottoNumbers.append(randomNum)
            }
        }
        // sorted 정렬
        return lottoNumbers.sorted()
    }

}

