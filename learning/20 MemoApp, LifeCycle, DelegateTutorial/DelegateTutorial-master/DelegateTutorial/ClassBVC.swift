//
//  ClassBVC.swift
//  DelegateTutorial
//
//  Created by James Rochabrun on 2/7/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

//MARK: step 1 Add Protoclo here
protocol ClassBVCDelegate : class
{
    func changeBackgroundColor(_ color: UIColor?)
}

class ClassBVC: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
//MARK: step 2 Create a delegate property here, don't forget to make it weak!
    weak var delegate: ClassBVCDelegate?

//    override func loadView() {
//        print("-------------ClassBVC loadView()")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2 ClassBVC viewDidLoad()")
        firstView.backgroundColor = .cyan
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 2.0
        firstView.layer.cornerRadius = firstView.frame.width / 2
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        secondView.backgroundColor = .brown
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 2.0
        secondView.layer.cornerRadius = secondView.frame.width / 2
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    override func viewWillLayoutSubviews() {
        print("2 ClassBVC viewWillLayoutSubviews()")
    }
    override func viewDidLayoutSubviews() {
        print("2 ClassBVC viewDidLaySubviews()")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("2 ClassBVC viewWillApear()")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("2 ClassBVC viewDidAppear()")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("2 ClassBVC viewWillDisappear -------")
    }
    
    
    @IBAction func dismissView(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    func handleTap(_ tapGesture: UITapGestureRecognizer) {
        
        view.backgroundColor = tapGesture.view?.backgroundColor
        //MARK: step 3 Add the delegate method call here
        self.delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
    }
}
