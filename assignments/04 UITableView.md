Class
UITableView

Displays hierarchical lists of information and supports selection and editing of the information.

Overview

A table view displays a list of items in a single column. UITableView is a subclass of UIScrollView, which allows users to scroll through the table, although UITableView allows vertical scrolling only. The cells comprising the individual items of the table are UITableViewCell objects; UITableView uses these objects to draw the visible rows of the table. Cells have content—titles and images—and can have, near the right edge, accessory views. Standard accessory views are disclosure indicators or detail disclosure buttons; the former leads to the next level in a data hierarchy and the latter leads to a detailed view of a selected item. Accessory views can also be framework controls, such as switches and sliders, or can be custom views. Table views can enter an editing mode where users can insert, delete, and reorder rows of the table.

A table view is made up of zero or more sections, each with its own rows. Sections are identified by their index number within the table view, and rows are identified by their index number within a section. Any section can optionally be preceded by a section header, and optionally be followed by a section footer.

Table views can have one of two styles, plain and grouped. When you create a UITableView instance you must specify a table style, and this style cannot be changed. In the plain style, section headers and footers float above the content if the part of a complete section is visible. A table view can have an index that appears as a bar on the right hand side of the table (for example, "A" through "Z"). You can touch a particular label to jump to the target section. The grouped style of table view provides a default background color and a default background view for all cells. The background view provides a visual grouping for all cells in a particular section. For example, one group could be a person's name and title, another group for phone numbers that the person uses, and another group for email accounts and so on. See the Settings application for examples of grouped tables. Table views in the grouped style cannot have an index.

Many methods of UITableView take NSIndexPath objects as parameters and return values. UITableView declares a category on NSIndexPath that enables you to get the represented row index (row property) and section index (section property), and to construct an index path from a given row index and section index (init(row:section:) method). Especially in table views with multiple sections, you must evaluate the section index before identifying a row by its index number.

A UITableView object must have an object that acts as a data source and an object that acts as a delegate; typically these objects are either the application delegate or, more frequently, a custom UITableViewController object. The data source must adopt the UITableViewDataSource protocol and the delegate must adopt the UITableViewDelegate protocol. The data source provides information that UITableView needs to construct tables and manages the data model when rows of a table are inserted, deleted, or reordered. The delegate manages table row configuration and selection, row reordering, highlighting, accessory views, and editing operations.

When sent a setEditing(_:animated:) message (with a first parameter of true), the table view enters into editing mode where it shows the editing or reordering controls of each visible row, depending on the editingStyle of each associated UITableViewCell. Clicking on the insertion or deletion control causes the data source to receive a tableView(_:commit:forRowAt:) message. You commit a deletion or insertion by calling deleteRows(at:with:) or insertRows(at:with:), as appropriate. Also in editing mode, if a table-view cell has its showsReorderControl property set to true, the data source receives a tableView(_:moveRowAt:to:) message. The data source can selectively remove the reordering control for cells by implementing tableView(_:canMoveRowAt:).

UITableView caches table-view cells for visible rows. You can create custom UITableViewCell objects with content or behavioral characteristics that are different than the default cells; A Closer Look at Table View Cells explains how.

UITableView overrides the layoutSubviews() method of UIView so that it calls reloadData() only when you create a new instance of UITableView or when you assign a new data source. Reloading the table view clears current state, including the current selection. However, if you explicitly call reloadData(), it clears this state and any subsequent direct or indirect call to layoutSubviews() does not trigger a reload.

For information about basic view behaviors, see View Programming Guide for iOS.

State Preservation

If you assign a value to a table view’s restorationIdentifier property, it attempts to preserve the currently selected rows and the first visible row. The table’s data source may adopt the UIDataSourceModelAssociation protocol, which provides a way to identify a row’s contents independent of that row’s position in the table. If the table’s data source adopts the UIDataSourceModelAssociation protocol, the data source will be consulted when saving state to convert the index paths for the top visible row and any selected cells to identifiers. During restoration, the data source will be consulted to convert those identifiers back to index paths and reestablish the top visible row, and reselect the cells. If the table’s data source does not implement the UIDataSourceModelAssociation protocol, the scroll position will be saved and restored directly, as will the index paths for selected cells.

For more information about how state preservation and restoration works, see App Programming Guide for iOS.

For more information about appearance and behavior configuration, see Table Views.












Class
UITableView : 계층구조의 정보 리스트를 보여주며,  그 정보의 선택 및 수정을 지원한다.

Overview
테이블뷰는 하나의 칼럼에서 아이템의 리스트를 보여준다. UITableView는 UIScrollView의 하위 클래스이며, 유저가 테이블에 스크롤을 하게 해주며, UITableView는 수직 스크롤만 허용한다. cell로 이루어져있는 각 테이블의 아이템은 UITableViewCell의 객체이다; UITableView는 이 객체들을 사용하여 보이는 줄을 테이블에 그린다. Cell은 Content, title, image가 있고, 오른쪽 모서리 근처에 accessory views도 가질수 있다. 기본적인 accessory view들은 indicator 또는 상세 버튼이 있다; 전자는 하위 데이터로 이끌고, 후자는 선택된 아이템의 상세 뷰로 이끈다. accessory view들은 스위치나, 슬라이더와 같은 framework control이 가능하며, 또한 custom view가 될 수도 있다. Table views는 CRUD가 가능하며, row의 재정열이 가능하다.

Table View는 0개 또는 그 이상의 section을 만들 수 있고, section별로 rows가 있다. Section은 table view의 index로 구별되며, row는 section의 index로 구별된다. section은 section header와 section footer를 선택적으로 선행될 수 있다.

UITableView instance를 만들때 반드시 table style을 특정해야 하며, Table view는 Plain과 grouped의 두가지 스타일 중 하나를 선택해야 하고, 이 style들은 바꿀 수 없다. plain style은 완성된 일부 section의 content 위에 section header와 footer가 있다. Table View에는 테이블의 오른쪽 사이드에  index를 보이게 할 수 있다. 각각의 label을 터치해 대상 section으로 이동할 수 있다. Grouped style은 기본 배경색상과 기본 background view를 모든 cell에 제공한다. background view는 시작적으로 모든 cell과 각 section을 그룹지을 수 있다. 예를들어 하나의 그룹은 사람 이름과 제목이 있을 수 있고, 다른 그룹은 그 사람이 사용하는 전화번호가 있을수 있고, 또 다른 그룹은 이메일과 같은게 있을 수 있다. grouped tables의 setting application에서 보듯이 grouped table view에는 index를 가질 수 없다.

UITableView의 많은 메서드들은 NSIndexPath의 parameter와 return value이다. UITableView는 NSIndexPath의 카테고리를 선언하는데 대표로 표시된 row index(row property)와 section index(section property)를 얻는게 가능하며, 주어진 row index와 section index로 부터 index path(init(row:section:)method)를 구성한다. 특히 여러 section이 있는 테이블 뷰에서 row의 index number로 구별짓기 전에 section의 index 값을 지정해야 한다.

UITableView의 객체는 반드시 data source와 delegate를 선언해야한다; 일반적으로 이둘은 application delegate 또는 더 비번하게 custom UITableViewController에 양쪽모두 존재한다. data source는 UITableViewDataSource 프로토콜을 반드시 차용하고, delegate는 반드시 UITableViewDelegate 프로토콜을 차용한다. data source는 테이블 row에 insert, delete, reorder 할때 UITableView가 테이블의 구성과 data model 관리에 필요한 정보를 제공한다. delegate는 row의 configuration과 selection, row의 재구성, highlight, accessory view 그리고 수정작업을 관리한다. 

setEditing(_:animated:) 메시지(첫번째 값이 true인 parameter를 같이)를 보낼때, 각각 구성된 UITableViewCell의 editingStyle에 따라 테이블 뷰는 각 visible row의 editing 또는 reordering 컨트롤을 통해 editing mode로 진입한다. 

입력과 삭제를 클릭하면 data source는 tableView(_:commit:forRowAt:) 메시지를 받는다. 삭제나 입력을 실행하면 적절한 deleteRows(at:with:)나 insertRows(at:with:)가 호출된다. 또한 editing mode에서 cell이 true값을 가진 showsReorderControl를 가진다면, data source는 tableView(_:moveRowAt:to:) 메시지를 받는다. data source는 선별하여 cell의 reordering control을 tableView(_:canMoiveRowAt:) 을 통해 제거한다.

UITableView는 visible row가 가능한 cell에 저장한다. 기본적인 cell과 다른 내용 또는 동작 특성을 사용하여 custom UITableView를 만들 수 있다; "A Closer Look at Table View Cells”가 방법에 대해 설명한다.

UITableView()의 새로운 instance를 만들거나 새로운 data source를 할당할때만 reloadData()가 호출되어 UITableView는 UIView의 layoutSubviews() 메서드를 재정의한다. 테이블보기를 다시 로드하면 현재 선택을 포함하여 현재 상태가 지워집니다. 그러나 reloadData()를 명시 적으로 호출하면 이 상태가 지워지고 이후에 직접 또는 간접적으로 layoutSubviews()를 호출해도 다시 로드되지 않습니다.

-> 

State Preservation
Table view 의 restorationIdentifier 속성에 값을 할당하면 현재 선택된 row와 첫 번째로 표시되는 row를 유지하려고 시도한다. 
테이블의 data source는 UIDataSourceModelAssociation 프로토콜을 채택 할 수 있다. 
이 프로토콜은 테이블의 해당 행의 위치와 관계없이 행의 내용을 식별 할 수있는 방법을 제공한다. 
테이블의 데이터 소스가 UIDataSourceModelAssociation 프로토콜을 채택한 경우 상태를 저장하면 데이터 소스가 참조되어 맨 위에 표시되는 행과 선택한 셀의 인덱스 경로를 식별자로 변환합니다. 
복원하는 동안 데이터 소스는 해당 식별자를 인덱스 경로로 다시 변환하고 맨 위의 보이는 행을 다시 설정하고 셀을 다시 선택하기 위해 참조됩니다. 
테이블의 데이터 소스가 UIDataSourceModelAssociation 프로토콜을 구현하지 않으면 스크롤 위치가 저장되고 선택된 셀의 인덱스 경로와 마찬가지로 직접 복원됩니다.

상태 보존 및 복원 작동 방식에 대한 자세한 내용은 iOS 용 App Programming Guide를 참조하십시오.

모양 및 비헤이비어 구성에 대한 자세한 내용은 표보기를 참조하십시오.













UIViewController와 UITableViewController와의 관계

ViewController에서 만든 TableView가 생성이 되는 과정에서 필요한 정보를 datasource이라는 프로토콜을 통해서 viewController에게 위임하는것. ViewController는 위임된 data를 제공해주면 그 위임된 data를 tableView가 값을 가지고 와서 그 값을 통해 tableView를 구성할수있게된다.

ViewController가 DataSource를 통해서 가지고 오려고 하는것은 tableView가 아니고, tableView 안에 만들어지는 구성품들(cell)에 대한 정보를 받겠다는것. cell은 고작 정보일뿐이다.

UIViewController와 UITableViewController의 차이점

UIViewController - root view가 view

UITableViewController - root view가 tableView

TableViewController를 안쓰고 ViewController를 쓴이유는 좀 더 low한 version이기도 하고, viewController를 통해서 내가 얼마든지 만들수있고 사이즈도 다 custom 할 수 있다. UITableViewController를 쓰면 root view가 tableView라는 소리는 무조건 전체화면에 tableView가 들어갈수밖에 없다라는 가정이 들어있다. rootView가 table View 자체 이기 때문에 그 어떠한것도 올릴수 없다. 하지만 base view가 View가 되면 거기다 내 일부분을 table View를 올리고 일부분은 다른 것들을 올릴수 있는것이 가능하다. 그렇기때문에 UIViewController를 가지고 tableView를 만드는 과정을 가정을 배워왔다.

UITableView의 instance가 만들어지기 위해서는 data source라는 프로토콜을 통해서 viewController한테 tableView의 구성에 필요한(cell에 대한)정보를 받아서 구성을 하는 view이고 그 view는 section과 row를 통해서 구분을 지어줄수 있다. Type에 대해선 plain과 group이 나올수 있고, tableView가 해야할 행동에 대해서는 dataSource와 delegate를 통해서 data를 받아서 구성을 한다.

table View의 가장 큰 특징은 reuable, 재사용이다.