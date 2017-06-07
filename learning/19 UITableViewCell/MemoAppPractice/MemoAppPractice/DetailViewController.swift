//
//  DetailViewController.swift
//  MemoAppPractice
//
//  Created by 박종찬 on 2017. 6. 7..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    var editingMode: Bool = false
    var editingItemIndex: Int?
    var dataArray: [[String:Any]]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let itemIndex = editingItemIndex, let itemArray = dataArray {
            let item = itemArray[itemIndex]
            self.titleTextField.text = item["title"] as? String
            self.contentTextView.text = item["content"] as! String
            self.contentTextView.becomeFirstResponder()
        } else {
            self.titleTextField.becomeFirstResponder()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonTouched(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(true, forKey: "ReloadFlag")
        
        let editedItem: [String:Any] = ["title":self.titleTextField.text!, "content": self.contentTextView.text]
        
        if self.editingMode {
            dataArray?.remove(at: editingItemIndex!)
        }
        
        dataArray?.insert(editedItem, at: 0)
        UserDefaults.standard.set(self.dataArray, forKey: "MemoData")
        
        self.navigationController?.popViewController(animated: true)
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
