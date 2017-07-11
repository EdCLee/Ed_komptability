//
//  ViewController.swift
//  Generic
//
//  Created by CLEE on 11/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0,0] = 1
        matrix[0,1] = 2.5
        
        print(matrix.grid)
        
        
        
        let list = Array<Int>()
        // Array가 Generic이기 때문에 타입을 지정해 주어야 한다.
        
        let list2:[Int] = []
        
        //let list3:Array<Int> = ()
        //let list4 = Array<Int>()
        
        //let list5 = []
        
        let strList:[String] = []
        
//        list2.sorted { (Int, Int) -> Bool in
//            code
//        }
//        
//        strList.sorted { (String, String) -> Bool in
//            code
//        }
        
//        list2.map { (Int) -> T in
//            code
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

struct IntStack {
    var items = [Int]()
    
    mutating func push(_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}


struct GenericStack<T> {
    var items = [T]()
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}
