//
//  ViewController.swift
//  Closure
//
//  Created by youngmin joo on 2017. 6. 21..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FriendDataSource {
    // MARK: - 프로퍼티
    // 친구정보를 담고있는 Person타입의 값을 가진 배열 변수
    var friendList: [Person] = []
//    {
//        didSet(oldVal){
//        //값이 변경된 직후에 호출, oldVal은 변경 전 값
//            print("didSet___________________________")
//            print(oldVal)
//            //self.mainTableView.reloadData()
//        }
//        willSet(newVal){
//            print("wilSet___________________________")
//            print(newVal)
////            self.mainTableView.reloadData()
//        //값이 변경되기 직전에 호출, newVal은 변경 될 새로운 값
//        }
//    }
    var manFriendList: [Person]?
    var womanFriednList: [Person]?
    
    // 현재 Segment 상태
    var mainSegmentState: Int = 0
    
    var rowCount: Int?
    
    // 프로퍼티로 디테일 뷰컨 타입을 옵셔널로 선언 -  뭐가 맞는 건지 한번더 생각해보자 => 기존에 가진 정보가 있어 안됨
    //var detailView: DetailViewController?
    
    //var indexCount: [Int]?
    var countArr:[Int]?
    
    
    
    // MARK: - IBOutlet
    @IBOutlet var mainTableView: UITableView!
    
    
    //***************************************************************************//
    //                                Life Cycle                                 //
    //***************************************************************************//
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        
        
        //DelegatePattern과 Closure의 차이를 중점적으로 학습하고.
        
        /**
         // Notificiation의 경우 1:다 의 경우 공통적인 컨트롤에 많이 사용되며. Notification은 싱글톤으로 이루어져 옵저빙하는 부분이 등록한다면
         // 지워주는 부분이 필요하며 앱이 꺼질때 까지 존재하게 된다.
         //Notifiaction을 이용해 옵저버 등록
         
         NotificationCenter.default.addObserver(self,
         selector: #selector(MainViewController.addFriend(_:)),
         name: Notification.Name(rawValue: "addFriedNoti"), object: nil)
         **/
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillapear:  \(friendList)")
        print("viewWillapear 시점 mainSegmentState: \(mainSegmentState)")
        reload()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - IBAction
    @IBAction func addFriendBtnTouched(_ sender: UIButton) {
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        // 이동할 뷰인 DetailViewController에게 사용하려는 주체가 MainViewController(self)임을 알려준다.
        addView?.friendDelegate = self
        
        self.navigationController?.pushViewController(addView!, animated: true)
    }
    
    @IBAction func segmentValueChange(_ sender: UISegmentedControl){
        // sender.numberOfSegments -  Segment의 갯수
        print(sender.selectedSegmentIndex) // 해당 seg index값  0번부터 시작
        self.mainSegmentState = sender.selectedSegmentIndex
        countArr = []
        if sender.selectedSegmentIndex == 1 {
            print("_________________________________")
            
            manFriendList = []
            for i in 0..<friendList.count{
                if friendList[i].gender == .Man {
                    countArr?.append(i)
                }
                
            }
            
            // filter를 사용하면서 해당 인덱스 번호를 추출 할수는 없을까.....
            manFriendList = friendList.filter({ (person:Person) -> Bool in
                print("manfilter 내부")
                return person.gender == .Man
            })
            
            rowCount = manFriendList?.count ?? 0
        }else if sender.selectedSegmentIndex == 2{
            for i in 0..<friendList.count{
                if friendList[i].gender == .Woman {
                    countArr?.append(i)
                }
                
            }
            
            womanFriednList = []
            womanFriednList = friendList.filter({ (person) -> Bool in
                return person.gender == .Woman
            })
            rowCount = womanFriednList?.count ?? 0
            //            print(womanFriednList)
        }else{
            rowCount = friendList.count
        }
        self.mainTableView.reloadData()
        
    }
    
    
    
    
    //***************************************************************************//
    //                          UITableViewDatasource                            //
    //***************************************************************************//
    // MARK: - UITableViewDataSource 필수 구현 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowCount ?? friendList.count  //섹션 파라미터로 구현할수있을거같은데 음..데이터 형식을만들어볼까
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스텀한 셀 을 만들어서 현재 뿌려지는 정보에 고유의 값이 필요할거같다.
        let friendCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //        friendCell.textLabel?.text = friendList[indexPath.row].name
        switch self.mainSegmentState {
        case 0:
            friendCell.textLabel?.text = friendList[indexPath.row].name
                                        //"\(friendList[indexPath.row].name)_____________________\(indexPath)"
            print("추가 하고 로드 friendList : \(friendList)")
        case 1:
            friendCell.textLabel?.text = manFriendList?[indexPath.row].name
        case 2:
            friendCell.textLabel?.text = womanFriednList?[indexPath.row].name
        default:
            friendCell.textLabel?.text = friendList[indexPath.row].name
        }
        
        return friendCell
    }
    
    //***************************************************************************//
    //                           UITableViewDelegate                             //
    //***************************************************************************//
    // MARK: - UITableViewDelegate 선택 구현 함수
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //현재 선택된 테이블뷰의 indexpath로 로직 구현
        
        let addView = self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as? DetailViewController
        addView?.friendDelegate = self
        
        
        //print("클릭 셀정보 : \(nowCell)  seg: \(mainSegmentState)") // segindex를 이용해야할듯
        
        /*
        // switch 문 필요 없을듯 수정하자
        switch mainSegmentState {
        case 0:
            addView?.personInfoDetail = friendList[indexPath.row] // 값은 주는데 수정할때는?
            addView?.personIndex = indexPath.row
            print("___________\(friendList[indexPath.row])")
        case 1:
             addView?.personInfoDetail = friendList[(countArr?[indexPath.row])!]
             addView?.personIndex = countArr?[indexPath.row]
            print("man seg에서 해당 정보 클릭 \(friendList[(countArr?[indexPath.row])!])")
        case 2:
            print("")
        default:
            print("")
        }
        */
        
        //************ if 문 으로 보완 ********//
        if mainSegmentState == 0 {
            addView?.personInfoDetail = friendList[indexPath.row] // 값은 주는데 수정할때는?
            addView?.personIndex = indexPath.row
        }else{
            addView?.personInfoDetail = friendList[(countArr?[indexPath.row])!]
            addView?.personIndex = countArr?[indexPath.row]
        }
        self.navigationController?.pushViewController(addView!, animated: true)
    }
    
    // Tip!!    command + \ : 현재 지점을 브레이크 포인트로 ... 우연히 발견..
    
    //***************************************************************************//
    //                     FriendDataSource - delegate 함수구현                    //
    //***************************************************************************//
    // MARK: - Custom 프로토콜 구현 함수
    func friendAddInfo(person: Person) {
        self.friendList.append(person)
        //self.mainTableView.reloadData()
    }
    
    func friendEditInfo(person: Person, index: Int) {
        self.friendList[index] = person
        //self.mainTableView.reloadData()
    }
    
    /**
     //***************************************************************************//
     //                          Notification 관련 함수                             //
     //***************************************************************************//
     // Notification을 통해 DetailViewController에서 일어나는 행동에 대한 데이터를 받아와 정보 할당
     func addFriend(_ noti: Notification){
     if let friendData = noti.object as? Person {
     //            print("\(noti.object)______\(friendData)")
     self.friendList.append(friendData)
     //            print("addFriend: \(friendList[0].name)")
     self.mainTableView.reloadData()
     }
     }
     **/
    
    // viewwillappear 시에 변경된 상태에 따른 필터 분기 처리
    func reload(){
        if self.mainSegmentState == 1 {
            manFriendList = []
            for i in 0..<friendList.count{
                if friendList[i].gender == .Man {
                    countArr?.append(i)
                }
            }
            // filter를 사용하면서 해당 인덱스 번호를 추출 할수는 없을까.....
            manFriendList = friendList.filter({ (person:Person) -> Bool in
                return person.gender == .Man
            })
            rowCount = manFriendList?.count ?? 0
        }else if self.mainSegmentState == 2{
            for i in 0..<friendList.count{
                if friendList[i].gender == .Woman {
                    countArr?.append(i)
                }
            }
            womanFriednList = []
            womanFriednList = friendList.filter({ (person) -> Bool in
                return person.gender == .Woman
            })
            rowCount = womanFriednList?.count ?? 0
            //            print(womanFriednList)
        }else{
            rowCount = friendList.count
        }
        self.mainTableView.reloadData()
    }
}

