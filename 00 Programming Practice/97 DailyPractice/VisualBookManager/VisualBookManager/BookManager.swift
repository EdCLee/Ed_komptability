//
//  BookManager.swift
//  BookManager
//
//  Created by CLEE on 25/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class BookManger {
    
    var bookList = [Book]() //mutable arry로 데이터의 추가,삭제 등을 관리
    
    //일단 Array에 담기
    func addBook(_ bookObject:Book) {
        bookList += [bookObject]
    }
    
    
    //전체 책 목록 보기
    func showAllBook() -> String {
        
        var strTemp = ""
        
        for bookTemp in bookList {
            strTemp += "Name : \(bookTemp.name)\n"
            strTemp += "Genre : \(bookTemp.genre)\n"
            strTemp += "Author : \(bookTemp.author)\n"
            strTemp += "===========================\n"
        }
        
        return strTemp
    }

    
    //책 수량
    func countBook() -> Int {
        return bookList.count
    }
    
    
    //이름만 받아서 검색하게끔
    func findBook(_ name:String)->String? { //return 을 nil을 쓰려면 옵셔널 밸류
        
        var strTemp = ""
        
        for bookTemp in bookList {
            if bookTemp.name == name {
                strTemp += "Name : \(bookTemp.name)\n"
                strTemp += "Genre : \(bookTemp.genre)\n"
                strTemp += "Author : \(bookTemp.author)\n"
                strTemp += "===========================\n"
                
                return strTemp
            }
        }
        return nil
        //return "no"
    }
 
    
    //책 지우기
    func removeBook(_ name:String) -> Bool {
        
        for bookTemp in bookList {
            if bookTemp.name == name {
                
                //Book이라는 class가 담긴
                //array에서 index(of:)를 사용하려면 
                //value는 Equatable Protocol을 따라야 사용할 수 있다.
                //let index:Int = bookList.index(of: bookTemp)!

                //검색한것을 지우게 하기 위해 NSArray로 downCasting
                let index = (bookList as NSArray).index(of: bookTemp)
                
                bookList.remove(at: index)
                return true
            }
        }
        return false
    }
}
