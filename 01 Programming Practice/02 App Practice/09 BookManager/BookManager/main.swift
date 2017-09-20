//
//  main.swift
//  BookManager
//
//  Created by CLEE on 25/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

var book1 = Book()
    book1.name = "햄릿"
    book1.genre = "비극"
    book1.author = "셰익스피어"

var book2 = Book()
    book2.name = "누구를 위하여 종을 울리나"
    book2.genre = "전쟁소설"
    book2.author = "해밍웨이"


var book3 = Book()
    book3.name = "죄와벌"
    book3.genre = "사실주의"
    book3.author = "톨스토이"

//book1.bookPrint()
//book2.bookPrint()
//book3.bookPrint()


var myBook = BookManger()
myBook.addBook(book1)
myBook.addBook(book2)
myBook.addBook(book3)


print("전체보기 : \(myBook.showAllBook())")
print("전체수량 : \(myBook.countBook())")

// 햄릿 검색해보기
var findResult = myBook.findBook("햄릿")
if findResult != nil {
    print("\(findResult!) 를 찾았습니다.")
} else {
    print("찾으시는 책이 없습니다.")
}

myBook.removeBook("죄와벌")

print(myBook.showAllBook())
