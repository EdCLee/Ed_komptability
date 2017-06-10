//
//  ItemViewController.swift
//  MemoPairPrograming
//
//  Created by HwangGisu on 2017. 6. 8..
//  Modified by HwangGisu, CLEE on 2017. 6. 9..
//  Copyright © 2017년 HwangGisu. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
    
//UI////////////////////////////////////////////////////////////////
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contenteTextView: UITextView!
    
    
//PROPERTIES////////////////////////////////////////////////////////
    var memoArry: [[String:Any]]?   //data
    var editMode: Bool = false      //edit여부
    var editIndex: Int?             //edit중인 cell 인덱스
    
    
//LIFE CYCLE////////////////////////////////////////////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoArry = UserDefaults.standard.array(forKey: "list") as? [[String:Any]]  ?? []
        
        if editMode {
            var memoList = memoArry?[editIndex!]
            titleTextField.text = memoList?["title"] as? String
            contenteTextView.text = memoList?["content"] as! String
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
//METHOD///////////////////////////////////////////////////////////
    //MARK: Add Button Action
    @IBAction func addBtunTouched(_ sender: UIButton) {
        
        // 수정여부 분기처리
        if editMode {
            memoArry?.remove(at: editIndex!)
        }
        var memoInfo: [String:Any] = [:]
        
        memoInfo.updateValue(titleTextField.text!, forKey: "title")
        memoInfo.updateValue(contenteTextView.text, forKey: "content")
        memoArry!.insert(memoInfo, at: 0)
        UserDefaults.standard.set(memoArry!, forKey: "list")
        
        //이걸 사용한다면 위에 remove도 지워야 함.
        //memoArry[editIndex] = memoInfo
        
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: NOTE
// perfomeSegue(withIdentifier:"" sender:nil)  //It's manual segue.
//
