//
//  Book.swift
//  BookManager
//
//  Created by CLEE on 25/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import Foundation

class Book {
    var name = ""
    var genre = ""
    var author = ""
    
    //method
    func bookPrint() {
        print("Name : \(name)")
        print("Genre : \(genre)")
        print("Author : \(author)")
    }
    
}

//NSArray를 사용하지 않고 array에서 index(of:)를 사용하려면 Equatable Protocol을 따라야 한다.
//extension Book: Equatable {
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    static func ==(lhs: Book, rhs: Book) -> Bool {
//        return lhs.isbn == rhs.isbn
//    }
//}
