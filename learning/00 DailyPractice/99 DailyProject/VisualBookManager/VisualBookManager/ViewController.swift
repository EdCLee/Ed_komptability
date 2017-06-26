//
//  ViewController.swift
//  VisualBookManager
//
//  Created by CLEE on 25/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Global 영역으로 올려서 변수 사용
    let myBook = BookManger()
    
    @IBOutlet var outputTextView:UITextView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var genreTextField:UITextField!
    @IBOutlet var authorTextField:UITextField!
    
    @IBOutlet var countLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let book1 = Book()
        book1.name = "햄릿"
        book1.genre = "비극"
        book1.author = "셰익스피어"
        
        let book2 = Book()
        book2.name = "누구를 위하여 종을 울리나"
        book2.genre = "전쟁소설"
        book2.author = "해밍웨이"
        
        
        let book3 = Book()
        book3.name = "죄와벌"
        book3.genre = "사실주의"
        book3.author = "톨스토이"
        
        
        myBook.addBook(book1)
        myBook.addBook(book2)
        myBook.addBook(book3)

        countLabel.text = "\(myBook.countBook())"
        
        // 햄릿 검색해보기
//        let findResult = myBook.findBook("햄릿")
//        if findResult != nil {
//            print("\(findResult!) 를 찾았습니다.")
//        } else {
//            print("찾으시는 책이 없습니다.")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    @IBAction func showAllBookAction(_ sender:AnyObject) {
        print("showAllBookAction")
        outputTextView.text = myBook.showAllBook()
        countLabel.text = "\(myBook.countBook())"
    }

    @IBAction func addBookAction(_ sender:AnyObject) {
        let bookTemp = Book()
        
        bookTemp.name = nameTextField.text!
        bookTemp.genre = genreTextField.text!
        bookTemp.author = authorTextField.text!
        
        myBook.addBook(bookTemp)
        outputTextView.text = "\(nameTextField.text!) 도서가 등록되었습니다."
        countLabel.text = "\(myBook.countBook())"
    }
    
    @IBAction func findBookAction(_ sender:AnyObject) {
        let resultBook = myBook.findBook(nameTextField.text!)
        if resultBook != nil {
            outputTextView.text = resultBook
        }else {
            outputTextView.text = "no result"
        }
        countLabel.text = "\(myBook.countBook())"
    }
    
    @IBAction func removeBookAction(_ sender:AnyObject) {
        let deleteBook = myBook.removeBook(nameTextField.text!)
        if deleteBook == true {
            outputTextView.text = "\(nameTextField.text!) has been deleted."
        }else {
            outputTextView.text = "no result"
        }
        countLabel.text = "\(myBook.countBook())"
    }

}

