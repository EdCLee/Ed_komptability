# UI에 관해서..
>Frame-base로 개발하는 UI는 iOS6.xx 이전부터 지원.
>
>AutoLayout로 개발하는 UI는 iOS6.xx 이상부터 지원.
>
>StackView로 개발하는 UI는 iOS9.xx 이상부터 지원.

프로그램이 사용될 환경에 따라 선택적으로 사용할 수 있어야 한다. 대형 포털사이트의 경우 사용자가 다양하기 때문에 사용될 국가 등 인프라에 맞게 사용 중에 있다.

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
