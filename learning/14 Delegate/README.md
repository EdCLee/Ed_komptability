# Delegate
> protocol을 사용하는 디자인 pattern
>
> protocol의 대표적인 메소드

<br>

## Protocol
> java의 interface와 유사
> 
> 클래스, 메소드, 프로퍼티등 및 기타 요구사항을 정의 함
>
> class, structure, 열거형은 protocol을 채택해서 정의된 요구사항을 구현해야 함.

- http protocol : 통신할때 사용되는 통신 규약
- 물리적 측면의 프로토콜 : 통신을 할때 사용되는 회선등의 규격
- 논리적 측면의 프로토콜 : 프레임(Frame, 자료의 표현 형식 단위) 구성, 프레임 안에 있는 각 항목의 뜻과 기능, 자료 전송의 절차 등.
- swift에서의 프로토콜 : 클래스, 구조체 등 간에 통신을 하기 위한 규약.

#### protocol 문법

```swift
protocol SomeProtocol {
	//protocol definition goes here
	// 프로토콜에 정의를 하고 클래스에서 사용하면 반드시 구현해야 한다.
	func someMethod(- inputStr:String);
}

struct SomeStructue: SomeProtocol, AnotherProtocol {
	// structure definition goes here
}

class SomeClass: SomeSuperclass, SomeProtocol, AnotherProtocol {
	//class definition goes here
	func someMethod(_ inputStr:String) {
		print(inputStr)
	}
}

// protocol은 청사진, 어느정도는 protocol을 상속의 개념으로 이해해도 무방하다.
```

<br>

## Delegate Design Pattern
> Delegate : 위임하다.

- 다른 class가 해야할 일을 대신 실행하는 등 class나 structure에서 일부분의 할 일을 다른 인스턴스에게 대신하게 하는 디자인 패턴.

###### UITextFieldDelegate 를 이용한 Delegate 이해하기.

```swift
//textField Delegate를 사용하라면
//UITextFieldDelegate 메소드를 호출 해야 함.
class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf1.delegate = self
        tf1.placeholder = "tf1"
        tf1.tag = 1
        
        tf2.delegate = self
        tf2.placeholder = "tf2"
        tf2.tag = 2
        
        tf3.delegate = self
        tf3.placeholder = "tf3"
        tf3.tag = 3

        print(_NSRange.init(location: 5, length: 5))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            tf2.becomeFirstResponder()
        case 2:
            tf3.becomeFirstResponder()
        case 3:
            tf3.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        print("return button!!")
        return true
    }
    
    //MARK: length와 location을 이용한 글자수 카운트 메소드
    // Bug report: location으로 잡기 때문에 글을 쓴 후 뒤로 이동한 뒤 작성하면 추가 작성이 가능 함.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    
//        print("location: \(range.location)")
//        print("length: \(range.length)")
//        print("string: " + string)
//        
//        // 조건에 range.length == 0 를 추가해서 버그를 잡는다.
//        if range.location <= 9 && range.length == 0 {
//            return true
//        }else{
//            return false
//        }
//    }
    
    //MARK: characters.count를 이용한 글자수 카운트 메소드
    // Bug report: 글을 최대 길이까지 작성 한 후 back space가 안됨.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        print("location: \(range.location)")
//        print("length: \(range.length)")
//        print("string: " + string)
//        
//        // 조건에 10 && string != "" 를 추가해서 버그를 잡는다.
//        if (textField.text?.characters.count)! < 10 && string != ""{
//            return true
//        }else {
//            return false
//        }
//    }
    
    //MARK: 정답같은 글자수 카운트 메소드
    // textfield의 조건에 따라 format을 입력하려면 switch를 태운다.
    // NSString, NSRange에 대해 알아야 함.
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        var textCount = textField.text! as NSString
//        textCount = textCount.replacingCharacters(in: range, with: string) as NSString
//        
//        return textCount.length <= 10
//    }

}
```