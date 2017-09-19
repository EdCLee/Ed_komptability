//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 4 adopt the protocol here

class ClassAVC: UIViewController, ClassBVCDelegate {

//    override func loadView() {
//        print("ClassAVC loadView()")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ClassAVC viewDidload()")

    }
    override func viewWillLayoutSubviews() {
         print("ClassAVC viewWillLayoutSubviews()")
    }
    override func viewDidLayoutSubviews() {
         print("ClassAVC viewDidLaySubviews()")
    }
    override func viewWillAppear(_ animated: Bool) {
         print("ClassAVC viewWillApear()")
    }
    override func viewDidAppear(_ animated: Bool) {
         print("ClassAVC viewDidAppear()")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("ClassAVC viewWillDisappear")
    }
    
    
    //segue.destination으로 마지막 UIViewController가 있는지 확인 and instance 만들기.
    
    //create nav which is the pointer to the segue’s destination view controller.
    /* destination viewcontroller is of type AnyObject!
     * We need to cast, or more technically downcast to the correct object type with the
     * as operator, and make vc an instance of FooTwoController.
     * Once we do that, we can access the colorString property in line 4,
     * sending our current text to the property in the new controller.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //MARK: step 5 create a reference of Class B and bind them through the prepare for segue method

        if let nav = segue.destination as? UINavigationController,
            let classBVC = nav.topViewController as? ClassBVC
        {
            print("ClassAVC prepare")
            classBVC.delegate = self
//            print(classBVC.)
        }

    }
    
    //MARK: step 6 finally use the method of the contract here
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    

}

