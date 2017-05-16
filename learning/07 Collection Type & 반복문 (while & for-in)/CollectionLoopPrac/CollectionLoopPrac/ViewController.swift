//
//  ViewController.swift
//  CollectionLoopPrac
//
//  Created by CLEE on 16/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//  COMMENT. 박보영님 주석 참조함. 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // MARK: array 생성
        var list:[Int] = [1,2,3,4,5,6,7,8]
        
        // 배열 추가
        list.append(10)
        
        // 어디에 넣어라
        list.insert(11, at:3)
        
        // index 0을 지워라
        list.remove(at:0)
        
        // list.index(of: Int) 를 이용해서, 배열에 숫자'4'를 지우라는 명령. 여기서 !를 붙이는 이유는, 리스트에 숫자'4'가 없을 수도 있기 때문
        list.remove(at: list.index(of: 4)!)
        
        //빈 배열 확인
        if !list.isEmpty {
            print(list)
            print(list.count)
        }
        
        // 배열 붙이기
        let list2:[Int] = [12,13]
        let list3 = list + list + list2
        print(list3)
        
        // 박보영님 복습 자료. 신기!해!
        var mammals:[String] = ["🐶", "🐯", "🐷", "🐰", "🐵"]
        print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵"]
        
        mammals.append("🐸")
        print(mammals) //print ["🐶", "🐯", "🐷", "🐰", "🐵", "🐸"]
        
        mammals.remove(at: 2)
        print(mammals) // print ["🐶", "🐯", "🐰", "🐵", "🐸"]
        
        print(mammals.count) // print 5
        
        if !mammals.isEmpty {
            print("이 Array의 Element 수는 \(mammals.count)개 입니다.")
        }
        else{
            print("이 Array는 비어있습니다")
        }
        
        
        // MARK: set 생성
        var letters = Set<Character>()
        print("letters is of type Set<Character> with \(letters.count) items")
        // Prints "letters is of type Set<Character> with 0 items."
        
        letters.insert("a")
        // letters now contains 1  value of type Character
        
        letters = []
        
        // MARK: Set 집합 연산
        // 홀수의 모임
        var oddDigits:Set = [1,3,5,7,9]
        
        // 짝수의 모임
        let evenDigits:Set = [2,4,6,8]
        
        // 소수의 모임
        let primeDigits:Set = [2,3,5,7]
        
        //홀수와 짝수의 교집합(Intersection) 만들기
        print(oddDigits.intersection(evenDigits))
        
        //홀수와 소수의 교집합을 제외한 수(symmetricDifference)
        print(oddDigits.symmetricDifference(primeDigits))
        
        //홀수와 짝수의 합집합(union)
        print(oddDigits.union(evenDigits).sorted())
        
        //홀수이면서 소수가 아닌 집합(subtracting) > 단 리턴값이 없어서 아무것도 출력되지 않음
        oddDigits.subtract(primeDigits)
        
        //여기까지 적용하고 oddDigits를 확인하면 [9,1] set가 나온다
        print(oddDigits)
        
        //이것을 sorted() 하면, Array의 형태로 정렬해서 출력된다
        print(oddDigits.sorted())
        
        
        // 혼자 해보는 복습
        var haveWings:Set = ["bird", "butterfly", "bet"]
        var mammal:Set = ["bet", "tiger", "pig"]
        var bugs:Set = ["butterfly", "ant", "spider"]
        
        print(haveWings.intersection(mammal))
        
        print(mammal.union(bugs)) // 순서 없이 나열
        
        print(mammal.union(bugs).sorted()) // sorted()를 이용해서 abc순으로 정렬
        
        print(bugs.symmetricDifference(haveWings)) // 순서 없이 나열
        
        print(bugs.symmetricDifference(haveWings).sorted()) // sorted()를 이용해서 abc순으로 정렬
        
        print(bugs.subtract(mammal)) // subtract는 리턴 값이 없음
        
        
        
        
        // MARK: Dictionary 만들기
        var iOSStudent:Dictionary<String,String> = ["박보영":"남성", "박종훈":"남성"]
        
        // 불러오기
        print("\(iOSStudent["박보영"])")
        
        // 몇 개의 elements를 가지고 있는지
        print(iOSStudent.count)
        
        // 새로운 elements 추가
        iOSStudent["조선미"] = "여성"
        
        // 기존 elements의 값 추가
        iOSStudent["박보영"] = "여성"
        print(iOSStudent)
        
        // 기존의 key:value 쌍을 dictionary에서 삭제
        iOSStudent.removeValue(forKey: "박종훈")
        print(iOSStudent)
        
        
        
        
        // MARK: 구구단 만들기 / 반복문 - while 문
        func multiplicationTable(firstNum:Int) -> Int {
            var times:Int = 1
            
            while times <= 9 {
                print("\(firstNum) * \(times) = \(firstNum * times)")
                times += 1
            }
            return times
        }
        
        multiplicationTable(firstNum: 4)
        
        

    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: 로또 숫자 뽑기(arc4random_uniform(maxNum)) 중복 허용
    // max 45, 숫자 6개 뽑기
    func findLotto() -> [Int] {
        var lottoNumbers:[Int] = []
        
        for _ in 1...6  {
            let randomNum:UInt32 = arc4random_uniform(45)
            lottoNumbers.append(Int(randomNum))
        }
        return lottoNumbers
    }
    
    // MARK: 로또 숫자 6개 뽑기
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
    
    // MARK: 약수 구하기
    func getDivisor(inNumber num:Int) -> [Int] {
        var result:[Int] = []
        
        for i in 1...num {
            if num % i == 0 {
                result.append(i)
            }
        }
        
        return result
    }
    
    
    // MARK: 소수 판별기
    func isPrimeNumberOf(number num:Int) -> Bool {
        var result:Bool = false
        
        if getDivisor(inNumber: num).count <= 2 {
            result = true
        }
        
        return result
    }

}

