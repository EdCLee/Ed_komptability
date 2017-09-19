//
//  MemoDetailViewController.swift
//  fifthSaturdayProject
//
//  Created by 김태형 on 2017. 6. 12..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var titleString:String?
    var contentsString:String?
    var isEditingMode = false
    var editingInt:Int?
    var whoIsFirstResponder = false
    
    @IBAction func doneButtonTouched(_ sender: UIBarButtonItem) {
        
        if (titleTextField.text?.isEmpty)! || textView.text.isEmpty
        {
            let alertCollect = UIAlertController(title: "모두 기입해주세요", message: "플리즈", preferredStyle: .alert)
            let alertAct = UIAlertAction(title: "ㅇㅋ", style: .default, handler: nil)
            alertCollect.addAction(alertAct)
            present(alertCollect, animated: true, completion: nil)
        }else{
            doneRequest()
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textView.becomeFirstResponder()
        return true
    }

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    func doneRequest()
    {
        
        
        
        if isEditingMode == false
        {
            var memo = UserDefaults.standard.array(forKey: Need.memo) ?? []
            let memoData = [Need.memoTitle:titleTextField.text , Need.memoContents:textView.text]
            memo.insert(memoData, at: 0)
            UserDefaults.standard.set(memo, forKey: Need.memo)
            
        }else
        {
            var memo = UserDefaults.standard.array(forKey: Need.memo) ?? []
            let memoData = [Need.memoTitle:titleTextField.text , Need.memoContents:textView.text]
            memo[editingInt!] = memoData
            UserDefaults.standard.set(memo, forKey: Need.memo)
            
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleTextField.text = titleString
        textView.text = contentsString
        if whoIsFirstResponder == false
        {
            titleTextField.becomeFirstResponder()
        }else
        {
            textView.becomeFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
