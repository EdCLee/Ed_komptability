# The Tower of Hanoi

```swift
// 원판이 1개면 출발지 -> 목적지
// 원판이 1개가 아닌 경우.
// n-1개의 원판을 출발지에서 목적지를 거쳐 경유지로
// n 번을 출발지에서 목적지로
// n-1개를 경유지에서 출발지를 거쳐 목적지로
var count:Int = 0

func hanoiTower(diskCount:Int, pegA:String, pegB:String, pegC:String) {
    
    // 1개면 출발지에서 목적지로
    if diskCount == 1 {
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
    }else if diskCount != 1 {
        // 디스크 갯수가 1이 아닌경우 재귀함수를 이용해 재호출 후 디스크 갯수 -1을 수행하고
        // parameter 값을 다른 변수 자리에 binding 해줌으로써 loop가 가능해진다.
        hanoiTower(diskCount: diskCount - 1, pegA: pegA, pegB: pegC, pegC: pegB)
        print("Move disk \(diskCount) from \(pegA) to \(pegC)")
        hanoiTower(diskCount: diskCount - 1, pegA: pegB, pegB: pegA, pegC: pegC)
    }
    count += 1
}
// peg의 위치를 바꾼다고 생각하고 접근하면 조금 더 쉽게 풀 수 있다.
// peg를 움직인다는 생각이 결국 재귀함수와 연결이 된다.

hanoiTower(diskCount: 3, pegA: "A", pegB: "B", pegC: "C")
print("\(count)번 수행 했다")

// Move disk 1 from A to C
// Move disk 2 from A to B
// Move disk 1 from C to B
// Move disk 3 from A to C
// Move disk 1 from B to A
// Move disk 2 from B to C
// Move disk 1 from A to C
// 7번 수행 했다
```

<br>
<br>
<br>

# AutoLayout

> 모든 뷰의 사이즈와 위치를 다이나믹하게 만들어 주는 기능.

<br>

## AutoLayout vs Frame-Based Layout

- AutoLayout : 화면 사이즈의 margin값 기준으로 소스의 크기는 반응형으로 사용 함
- Frame-Based : 화면 사이즈에 따라 좌표값을 이용함

<br>

#### Constraint : 각 뷰의 거리, 길이, 위치등을 표현하기 위한 제약사항

```swift
	RedView.Leading = 1.0 x BlueView.trailling + 8.0

```

###### Attribute

- Size attributes
	- width
	- height
- Location attributes
	- Leading : left or leading
	- Trailing : right or trailing
		- 다국어 차원에서 왼쪽 오른쪽 대신 leading과 trailing을 사용한다.
	- Top
	- Bottom
	- Vertical
	- Horizontal

###### Multifilier
- 비율을 설정하기위한 속성

###### Constant
- 간격을 유지하기 위한 속성

###### Constraint 공식
- 대상 view의 attribute는 기준 view의 attribute x 비율 + 간격이다.

	`Item1.Attribute = 비율 x Item2.Attribute + 간격`

<br>

#### 제한 사항
> AutoLayout을 사용하려면 각 view의 거리, 정렬, 상대적크기 등을 고려해 제약을 설정해야 한다. 하지만 모든 설정들이 호환되지는 않는다.

<br>

#### Tips : Autolayout 뷰 생성시
- 화면 배치의 기준이 되는 뷰를 잡고 시작하는것이 좋다.