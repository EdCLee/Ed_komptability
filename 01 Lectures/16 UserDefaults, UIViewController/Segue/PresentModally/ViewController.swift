//
//  ViewController.swift
//  PresentModally
//
//  Created by CLEE on 30/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isAbleSegue:Bool = true

    @IBOutlet weak var segButton: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segueCheck(_ sender: UISegmentedControl) {
        
        if segButton.selectedSegmentIndex == 0 {
            isAbleSegue = true
            
        }else {
            isAbleSegue = false
        }
    }

    //
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if isAbleSegue {
            return true
        }else {
            return false
        }
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sampleVar:SegueViewController = segue.destination as! SegueViewController
        sampleVar.data = "Ed"
    }
    
    @IBAction func unwindSegue(for unwindSegue: UIStoryboardSegue) {
        print("Return Home냥")
    }
    
}

