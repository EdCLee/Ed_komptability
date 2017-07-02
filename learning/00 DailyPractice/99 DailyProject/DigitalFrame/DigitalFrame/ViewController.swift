//
//  ViewController.swift
//  DigitalFrame
//
//  Created by CLEE on 02/07/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 이미지는 PNG를 많이 사용한다. -> 무손실 압축이기 때문에
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var buttonLabel:UIButton!
    @IBOutlet var sliderSpeed:UISlider!
    @IBOutlet var sliderSpeedLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //변수에 UIImage 클래스를 담는다.
        let imageArray = [UIImage(named:"GPTempDownload (0).jpg")!,
                          UIImage(named:"GPTempDownload (1).jpg")!,
                          UIImage(named:"GPTempDownload (2).jpg")!,
                          UIImage(named:"GPTempDownload (3).jpg")!,
                          UIImage(named:"GPTempDownload (4).jpg")!,
                          UIImage(named:"GPTempDownload (5).jpg")!,
                          UIImage(named:"GPTempDownload (6).jpg")!,
                          UIImage(named:"GPTempDownload (7).jpg")!,
                          UIImage(named:"GPTempDownload (8).jpg")!,
                          UIImage(named:"GPTempDownload (9).jpg")!,
                          UIImage(named:"GPTempDownload (10).jpg")!,
                          UIImage(named:"GPTempDownload (11).jpg")!,
                          UIImage(named:"GPTempDownload (12).jpg")!,
                          UIImage(named:"GPTempDownload (13).jpg")!,
                          UIImage(named:"GPTempDownload (14).jpg")!,]
        
        // animationImages 함수에 imageArray를 넣는다.
        imgView.animationImages = imageArray
        
        // 애니메이션 시간?
        imgView.animationDuration = 7.5
        
        // 반복 횟수에 대한것. 0이면 무한대. 0이 default
        //imgView.animationRepeatCount = 0
        
        // 애니메이션 실행 시키는 함수
        //imgView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func toggleAction(_ sender:Any) {
        
        //toggle버튼이 눌리기 전에 속도를 가져오게 함
        //imgView.animationDuration = Double(sliderSpeed.value)
        
        if imgView.isAnimating {
            print("animating 정지")
            // 버튼 텍스트 수정방법 및 상태 = normal
            imgView.stopAnimating()
            buttonLabel.setTitle("START", for: UIControlState.normal)
        }else {
            // toggle버튼이 눌리기 전에 속도를 가져오게 함
            // 이게 위에서 선언시, Duration의 값이 변하면 멈추게 되서 stop버튼이 안되게 된다.
            // 일단 stop 버튼의 기능이 되더라도 값이 변하면 멈추게 된다.
            // 원하는 기능은 이게 아니므로 주석처리하고 func으로 빼서 사용하도록 한다.
            //imgView.animationDuration = Double(sliderSpeed.value)
            print("animating 시작")
            // 버튼 텍스트 수정방법 및 상태 = normal
            imgView.startAnimating()
            buttonLabel.setTitle("STOP", for: UIControlState.normal)
        }
    
    }
    
    // value change로 연결한다.
    @IBAction func changeSpeedAction(_ sender:Any) {
        //print("animation은 이제 changeSpeedAction의 영역")
        imgView.animationDuration = Double(sliderSpeed.value)
        imgView.startAnimating()
        buttonLabel.setTitle("STOP", for: UIControlState.normal)
        
        // 받는 값 sliderSpeed.value의 소수점 첫번째 까지 표현. %.1f
        sliderSpeedLabel.text = String.init(format: "%.1f", sliderSpeed.value)
    }
    // value change 자체가 start 버튼이 되버렸기 때문에
    // 정지상태에서 값이 변해도 시작이 안되게 하려면
    // toggleAction 버튼에서처럼 분기 처리를 해줘야 한다.
    
}
