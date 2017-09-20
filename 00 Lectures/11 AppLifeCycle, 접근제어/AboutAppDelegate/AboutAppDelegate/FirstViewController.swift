//
//  FirstViewController.swift
//  AboutAppDelegate
//
//  Created by CLEE on 23/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("FirstVC loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FirstVC viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("FirstVC viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("FirstVC viewWIllLayoutSubviews")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("FirstVC viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FirstVC viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("FirstVC viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("FirstVC viewDidDisappear")
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
