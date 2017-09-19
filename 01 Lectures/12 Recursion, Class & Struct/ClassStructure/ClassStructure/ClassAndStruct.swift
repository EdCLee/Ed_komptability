//
//  ClassAndStruct.swift
//  ClassStructure
//
//  Created by CLEE on 24/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

//MARK: Struct
struct Book {
    // 자동으로 memberwise initializers가 만들어져서
    // 필요에 따라 custom initialize를 할 필요가 없다.
    var name:String
    var cost:Int
    var isbn:UInt
    
    // struct에서 함수를 사용하려면 mutating 키워드를 넣어야 한다.
    mutating func addIsbn() {
        self.isbn = isbn + UInt(cost)
    }
}


//MARK: Class
// custom initialize를 한다.
// init()을 추가하거나 변수에 초기값을 설정해주지 않으면 에러 발생
// name과 address는 init()을 주고, books는 초기값 = [] 을 줌.
class BookStore {
    var books:[Book] = []
    var name:String
    var address:String

    init(name:String, address:String) {
        self.name = name
        self.address = address
    }
        
    func addBook(name:String, cost:Int){
        let book:Book = Book(name:"스위프트 따라잡기", cost:10000, isbn:UInt(books.count + 1))
        self.books.append(book)
    }
    
    deinit {
        <#statements#>
    }

}

