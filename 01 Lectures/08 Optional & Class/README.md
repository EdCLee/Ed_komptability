# Optional

> Optional은 이 두가지 기호로 표시한다.
>
> `!` 값이 있음. `?` nil 가능성을 내포 함.

<br>

## nil?

```swift
	// 공백이라는 값이 있음
	var name = ""
	// nil 상태
	var name
```

<br>

## Type Safety

- swift의 중요한 특징 중 하나.
- 컴파일러 수준의 `nil` 체크.
- `nil` 변수를 선언할 경우 optional을 사용.
- nil인 상태에서 속성을 참조하거나, 함수를 실행시 발생하는 error로 인한 코드의 불안정성 내포

```swift
	var name //nil이라서 애러.
	name = "Ed"
	
	var name:String? //String 타입의 옵셔널로 
	name = "Ed"
```
- `nil`에 의해 일어나는 오류를 잡기위해 Optional을 사용한다 Exception 같은 기능.

```swift
	var strNum:String = "4번"
	var list:[Int] = [1,2,3]
	
	//list.append(Int(strNum)) String "4번"이 Int로 변환 되는 과정에 "번" 때문에 nil이 됨.
	list.append(Int(strNum)!) !을 넣어서 값이 있음을 보증해도 결국 캐스팅과정에 nil 처리 됨.
	
	//결론: 코드가 잘못 됨.
```

<br>

## Unwrapping
- Optional 변수에 값이 있음을 확인하여 일반 변수로 전환해준다.
	- forced unwrapping (!)
	
	```swift
		// 강제로 Optional 변경!
		func testFuc(optionalStr:String?) {
			if optionalStr != nil {
			let unwrapStr:String = optionalStr!
			print(unwrapStr)
			}
		}	
	```
	
	- Optional Binding (많이 사용)
	
	```swift
		//Optional 변수를 새로운 변수로 변경. Optional Binding
		func testFuc(optionalStr:String?) {
			
			if let unwrapStr:String = optionalStr {
				print(unwrapStr)
			}
		}	
	```
	
	- Early Exit
	
	```swift
		// guard문 일반화
		guard 조건값 else {
			//조건값이 거짓일떄 실행
		}
		
		// if문은 조건이 true일때,
		// guard문은 조건이 false일때.
	```
	```swift
		func testFunc(optionalStr:String?) {
			guard let unwrapStr:String = optionalStr else {
				// retrun을 통해 함수 실행 종료
				return
			}
			print(unwrapStr)
		}
		
		// 조건이 true이면 print(unwrapStr)
		// 조건이 false이면 return하고 종료
	```

<br>	

###### Optional Binding 예제

```swift
	func isNumber(inputNum1:String, inputNum2:String) - > Bool {
		if let firstNumber:Int = Int(inputNum1), let secondNumber:Int = Int(inputNum2) {
			return true
		}else{
			return false
		}
	}
	
	isNumber(inputNum1: "222", inputNum2:"hi")
```

<br>

###### Optional Binding 예제2

```swift
    var friendList:Array<Dictionary<String,String>>?
    //var friendList:Array<[String:String]>?
    //var friendList:[[String:String]]?
    
    
    func addFriend(name:String, gender:String) {
        var friend:[String:String] = [String:String]()
        friend.updateValue(name, forKey: "name")
        friend.updateValue(gender, forKey: "gender")
        addFriend(friendData: friend)
    }
    
    func addFriend(friendData:[String:String]) {
        if friendList == nil {
            friendList = []
        }  
        friendList!.append(friendData)
    }
    
    //친구의 이름 리스트 만들기 함수
    func friendNames() -> [String] {
        guard let friends = friendList else {
            return []
        }
        var returnList:[String] = []
        
        let f1 = friends[0]
        let f2 = friends[1]
        
        let f1Name:String = f1["name"]!
        returnList.append(f1Name)
        
        let f2Name:String = f2["name"]!
        returnList.append(f2Name)
        
        /*
         for friend in friends {
         let name:String = friend["name"]!
         returnList.append(name)
         }
         */
        return returnList
    }
    
    //친구의 이름 모두 출력
    func printFriendName() {
        if let friends:[[String:String]] = friendList {
            for friend:[String:String] in friends {   
                for (key,value) in friend {
                    if key == "name" {
                        print(value)
                    }
                }
                let name:String = friend["name"]!
                //print(name)
            }       
        }
    }
```

* `,`를 통해 옵셔널 바인딩을 추가하고, 또 조건도 추가 할 수 있다. `&&` 처럼 둘다 `true`여야 넘어 감. `&&`나 `||`를 사용할 수 없는게 `if` 조건 안에서는 실행됐을 경우에 대해 작성해야하기 때문에 변수 선택에 있어 문제가 생김.

---

<br>
<br>
<br>

# 클래스와 객체

<br>

## 구조

```swift
Class Hat {
	//프로퍼티
	var color:String = "흰색"
	var shape:String = ""
	var size:Int = 0
}

//객체 myHat, yourHat
var myHat:Hat = Hat() //객체. 인스턴스. 메모리에 적재 됨.
var yourHat:Hat //nil이 들어가있는 객체. 생성된게 없음
```

- Property(속성) : 클래스 내부에서 사용되는 변수.
- Variable(변수) : 함수 안에서 사용되는 변수.
- Method() : 클래스 내부에서 사용되는 함수.
- function : 일반적으로 사용되는 함수.


```swift
	var myHat:Hat = Hat() //객체. 인스턴스. 메모리에 적재 됨.
	var yourHat:Hat //nil이 들어가있는 객체. 생성된게 없음
```

- **인스턴스화 된것이 객체.** (instanciated thing)
- 객체에있는 함수, 속성은 `.`을 사용한다.

```swift
	myHat.color = "블랙"
	print(myHat.color) // 블랙	
```

<br>

## init() 함수

- 초기화 함수 `init()` 함수를 사용한다.

```swift
	init() {
		// perform some initialization here
	}
```
```swift
class Hat {
	var color:String = "흰색"
	var shape:String = ""
	var size:Int = 0
	
	init(color:String, size:Int) {
		self.size = 52
		self.shape = "라운드 형태"
	}
}
```

- `init()`에 parameter를 추가해서 custom 한다.

<br>

## self

- 자기 자신 인스턴스를 가르키는 포인트
- 명시적 표시, 중복 구분을 위해 사용

<br>

###### 클래스와 객체 예제

- ViewController.swift

```swift
import UIKit
	
class ViewController: UIViewController {

	//app에서 화면이 loading되는 순간에 ViewController의 객체가 생성됨과 동시에
	//viewDidLoad 호출된다.
	override func viewDidLoad() {
       super.viewDidLoad()
        	         
       let s1:Student = Student(name: "Ed")
       s1.add(subjectName: "Math", score: 99)
       s1.add(subjectName: "English", score: 80)
       s1.add(subjectName: "Science", score: 100)
       s1.add(subjectName: "Society", score: 100)
       s1.add(subjectName: "History", score: 60)
        
       let s2:Student = Student(name: "Irene")
       s2.add(subjectName: "Math", score: 80)
       s2.add(subjectName: "English", score: 100)
       s2.add(subjectName: "Science", score: 60)
       s2.add(subjectName: "Society", score: 90)
       s2.add(subjectName: "History", score: 60)
        
       let manager:ScoreManager = ScoreManager()
       let s1Average = manager.average(forStudent: s1)
       let s2Average = manager.average(forStudent: s2)
        
       print(s1Average)
       print(s2Average)
        
   }

   override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
       // Dispose of any resources that can be recreated.
   }
}
```

- Student.swift

```swift
import Foundation
	
class Student {
    
    var name:String
    var average:Double?
    //Type을 class Subject로 사용한다.
    var subjects:[Subject]?
    
    init(name:String) {
        self.name = name
    }
	
    // 과목을 추가하는 함수
    func add(subjectName name:String, score:Int) {
        if subjects == nil {
            subjects = []
        }
        
        let sj:Subject = Subject(name: name, score: score)
        subjects?.append(sj)
        
        
    }
}
```

- Subject.swift

```swift
import Foundation
	
class Subject {
    
    let name:String
    var score:Int
    
    //init을 할땐 property에 대입값을 안줘도 된다.
    init(name:String, score:Int) {
        self.name = name
        self.score = score
    }
    
    
}
```

- ScoreManager.swift

```swift
import Foundation

class ScoreManager {
    
    func average(forStudent student:Student) -> Double {
        
        var returnAverage:Double = 0.0
        
        if let subjects = student.subjects {
            
            var total:Int = 0
            
            for subject in subjects {
                total += subject.score
            }
            
            returnAverage = Double(total) / Double(subjects.count)
            
        }
        
        return returnAverage
        
    }
    
}
```








