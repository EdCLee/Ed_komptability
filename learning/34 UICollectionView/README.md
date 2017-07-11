# UICollectionView

#### CollectionView
- Cell
- Decoration view
- Supplementary view

<br>

#### UICollectionView
- 데이터 항목의 정렬 된 컬렉션을 관리하고 사용자 정의 레이아웃을 사용하여 데이터 항목을 제공하는 객체입니다.
- The classes and protocols for implementing collection views
- Manager
	- UICollectionView
	- UICollectionViewCOntroller
- Protocol
	- UICollectionViewDataSource
	- UICollectionViewDelegate
- Presentation
	- UICollectionReusableView
	- UICollectionViewCell
	- UICollectionViewDataSourcePrefetching
- Layout
	- UICollectionViewLayout
	- UICollectionViewLayoutAttributes
	- UICollectionVIewUpdateItem
- Flow Layout
	- UICollectionViewFlowLayout
	- UICollectionViewDelegateFlowLayout

<br>

#### Section LAyout

<br>

#### Flow Layout
- UICollectionViewFlowLayout Class에 정의
- Scroll Direction
	- Vertical
	- Horizontal

<br>

###### Flow Layout Attributes 정의
- UICollectionViewDelegateFlowLayout protocol을 이용
	- 확장개념으로 이해하면 된다.
- UICollectionVIewDelegate가 정의된 인스턴스에서 작성

```swift
	// indexPath 기준으로 아이템의 사이즈를 정함.
	func collectionView(_ collectionView: UICollectionView, layout)
	
	// 객체간 간격의 minimum value
	func collectionView(_ collectionView: UICollectionView, layout)
	
```

<br>

#### Item Size

<br>

#### Item Spacing

<br>

#### Line Spacing

<br>

#### Section Inset

<br>

#### UICollectionViewDataSource

```swift
	public func collectionView(_ collectionView: UICollectionView, numberOFItemsInSection section: Int) -> Int
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: indexPath) -> UICollectionViewCell
	
	optional public func numberOfSections(in collectionView: UICollectionView)
```

