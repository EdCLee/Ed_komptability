//
//  SecondViewController.swift
//  AboutAppDelegate
//
//  Created by CLEE on 23/05/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("SecondVC loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC viewDidLoad")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondVC viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondVC viewWIllLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("SecondVC viewDidLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondVC viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SecondVC viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SecondVC viewDidDisappear")
    }

    @IBOutlet weak var heheheh: UILabel!
    @IBAction func coinCoin(_ sender: UIButton) {
        heheheh.text = ""
        heheheh.text = "heh"
    }
    @IBAction func coinCoin2(_ sender: UIButton) {
        heheheh.text = ""
        heheheh.text = "heh heh"
    }
    @IBAction func coinCoin3(_ sender: UIButton) {
        heheheh.text = ""
        heheheh.text = "heh heheheh"
    }
    @IBAction func coinRefund(_ sender: UIButton) {
        heheheh.text = ""
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
