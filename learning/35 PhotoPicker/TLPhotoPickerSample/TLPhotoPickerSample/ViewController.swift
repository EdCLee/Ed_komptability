//
//  ViewController.swift
//  TLPhotoPickerSample
//
//  Created by CLEE on 04/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit
import TLPhotoPicker

class ViewController: UIViewController, TLPhotosPickerViewControllerDelegate  {
    
    @IBOutlet weak var imageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func buttonTouched(_ sender: UIButton) {
        let imagePickerController: TLPhotosPickerViewController = TLPhotosPickerViewController()
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.imageView.image = withTLPHAssets.first!.fullResolutionImage
    }
}

