//
//  ComposePopUpView.swift
//  TwitterDynamicCellPractice
//
//  Created by 박종찬 on 2017. 7. 14..
//  Copyright © 2017년 Jongchan Park. All rights reserved.
//

import UIKit

typealias ComposeActionHandler = ((ComposePopUpView) -> Void)

class ComposePopUpView: UIView, UITextViewDelegate {
    
    private var cancelHandler: ComposeActionHandler?
    private var saveHandler: ComposeActionHandler = { (self) in }
    private let backgroundShadeView: UIView = UIView()
    private var movingDistance: CGFloat = UIScreen.main.bounds.height

    //MARK: - IBOutlet
    
    @IBOutlet weak var textView: UITextView!
    
    //MARK: - IBAction
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        if let cancelHandler = self.cancelHandler {
            cancelHandler(self)
        }
        self.dismiss()
    }
    
    @IBAction func saveButtonTouched(_ sender: UIButton) {
        self.saveHandler(self)
        self.dismiss()
    }
    
    private func dismiss() {
        self.endEditing(true)
        
        UIView.animate(withDuration: 0.4, animations: { [unowned self] in
            self.alpha = 0.0
            self.frame.origin.y += self.movingDistance
        }) { [unowned self] (bool) in
            self.backgroundShadeView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
    
    //MARK: - initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, saveHandler: @escaping ComposeActionHandler, cancelHandler: ComposeActionHandler?) {
        super.init(frame: frame)
        loadNib()
        self.backgroundShadeView.backgroundColor = UIColor.black
        self.backgroundShadeView.alpha = 0.5
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.saveHandler = saveHandler
        self.cancelHandler = cancelHandler
        self.movingDistance -= self.frame.origin.y
        self.textView.delegate = self
    }
    
    private func loadNib() {
        let viewFromNib: UIView = Bundle.main.loadNibNamed("ComposePopUpView", owner: self, options: nil)!.first as! UIView
        viewFromNib.frame = self.bounds
        viewFromNib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(viewFromNib)
    }
    
    //MARK: - interface
    
    func popUp(on superView: UIView) {
        var rect:CGRect = superView.bounds
        rect.origin.y += 64.0
        rect.size.height -= 64.0
        self.backgroundShadeView.frame = rect
        
        superView.addSubview(self.backgroundShadeView)
        
        self.alpha = 0.0
        self.frame.origin.y += self.movingDistance
        superView.addSubview(self) //애니메이션 전상황
        UIView.animate(withDuration: 0.4) {[unowned self] in
            self.frame.origin.y -= self.movingDistance
            self.alpha = 1.0 //애니메이션 후 상황
        }
        self.textView.becomeFirstResponder()
    }
    
    //MARK: - TextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newLength = textView.text.characters.count + text.characters.count - range.length
        return !(newLength > 144)
    }
    
}
