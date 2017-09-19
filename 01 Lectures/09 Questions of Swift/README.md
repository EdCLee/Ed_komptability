## 정리

###### Optional, init

```swift
var str = String.init()
var str2 = ""

//String이 들어있는 Array
var strArray: [String] = ["ddd", "eee"]

//코드의 간편화 순서.
//var strArray2: Array<String> = []
//var strArray2: Array<String> = [String]
//var strArray2: Array<String> = Array<String>()
var strArray2: Array<String> = Array<String>.init()

/*
strArray와 strArray2는 완전히 같은 소스
*/

var optionalStr: String? = nil
type(of: optionalStr)   //->Optional Type String
type(of: optionalStr!)  //-> String Type

class Person {
    var name: String
    init(withName name:String) {
        self.name = name
    }
}

var someone: Person = Person.init(withName: "Ed")
```

###### 다운캐스팅
```swift
//Int = String < Any Any타입에 종속된다.

let num:Int = 1
let sample1:(Any, Any) = (num, "Ed")

//as에 Optional을 찍는 이유는 sample1.0이 
//Int타입이 아닐수도 있기 때문에 Int야! 라고 선언하는 것.
let anyTemp:Int = sample1.0 as! Int
print(anyTemp)
```

###### 인스턴스
- Instance : Object, Struct, Class를 `()` 초기화를 통해서 메모리안에 생기는 결과물을 부르는 말.
- Variable : Class 안에서 사용되면 Property. Function 안에서나 Class 밖에서 사용되는 전역 var or let.
- Function : func

###### Inheritance
- 

###### Overload & Override
- Override : 자식 Class에서 부모 Class의 함수를 재정의하는 것. Super Class에서 thisIsFunc라는게 있고, 자식 class에 마찬가지로 thisIsFunc라는게 같은 이름으로 존재하면 자식 class에서 thisIsFunc라는게 실행이 되는 것.
- Overload : 한 Class안에 동명의 여러 함수를 만드는 것. 단, 파라미터 값은 달라야 함. 같다면 여러개를 만들 이유가 없음.

```swift
	func test1(num:String) {
	}
	func test1(num:Int) {
	}
	//Objective-C로 상속 받으면 Overload를 지원하지 않는다.
```

###### for문
- Swift3.0 으로 넘어오면서 for-increment문은 안된다.

```swift
	//for-condition-increment문
	for(var i=0; i<10; i++) {
	    
	}
```

- 일반적으로 사용하는 for-in문의 형태

```swift
	let list:[Int] = [1,2,3,4,34,1333]
	
	// list:[Int]의 인덱스가 0~5까지 존재하기때문에 애러 발생
	//for i in 0..< 10 {
	// 한단계 발전해서 리스트의 갯수만큼.
	//for i in 0..< list.count {
	
	// 최종단계. 가장 일반적으로 많이 사용하는 문법
	for i in list {
	
	    // 간소화 하면서 i만 프린트하면 됨.
	    //    print(list[i])
	    print(i)
	}
```

<br>
<br>

## PoketMonster 예제

###### PoketMon.swift

```swift
class PoketMon {
    let name:String
    let type:String
    
    // Optional이 아니니 기본값을 줄때는 여기서 선언.
    var status:PokemonStatus = PokemonStatus.normal
    var hp:Int = 100
    
    var skills:[[String:Any]]?
    var exp:Int = 0
    var ownerTrainer:Trainer?
    
    
    init(name:String, type:String, status: PokemonStatus) {
        self.name = name
        self.type = type
        self.status = status
    }
    
    // MARK: 공격
    func attck(toMonster monster:PoketMon, skill skillNum:Int)
    {
        if let skillList = skills {
            let skill:[String:Any] = skillList[skillNum]
            
            // PowerPoint 갯수 체크. 0보다 작으면 원하는 스킬 사용 불가!
            if (skill["PowerPoint"] as! Int) > 0 {
                let skillName:String = skill["name"] as! String
                /* as : 다운 케스팅*/
                print("\(self.name)이 \(monster.name)에게 \(skillName)으로 공격합니다.")
                let skillDamage:Int = skill["damage"] as! Int
                monster.hp -= skillDamage
            }else{
                print("스킬포인트 없쪙")
            }
        }else{
            print("스킬 없쪙")
        }
    }
    
    // MARK: 도망
    func runAway(fromMonster monster:PoketMon){
        
    }
    
}

// MARK: 상태
enum PokemonStatus {
    case moral
    case normal
    case poisoned
    case paralyzed
}
```

###### Pikachu.swift

```swift
//피카츄
//부모타입 상속받음
class Pikachu:PoketMon {
    init() {
        super.init(name:"피카츄", type:"전기", status:PokemonStatus.normal)
        hp = 110
        skills = [["name":"몸통박치기","damage":10,"속성":"노멀","PowerPoint":20],
                  ["name":"전기충격","damage":30,"속성":"전기","PowerPoint":10],
                  ["name":"10만볼트","damage":80,"속성":"전기","PowerPoint":5]]
    }
    
    // MARK: 부모의 init을 사용하기 전까지는 self 라는 것 자체가 없는 껍데기인 init 함수.
    override init(name:String, type:String, status:PokemonStatus) {
        // super를 사용함으로써 부모의 init을 사용하고 부모의 프로퍼티 및 함수를 물려받는다.
        super.init(name:name, type:type, status:status)
    }
    
    // MARK: 진화
    func evolution() -> Raichu? {
        if exp >= 100 {
            let newRaichu:Raichu = Raichu()
            return newRaichu;
        }
        return nil
    }
}

```