//
//  FriendListViewController.swift
//  UITableViewPractice
//
//  Created by CLEE on 02/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

//TableView를 사용하려면 UITableViewDataSource를 가져와야 한다.
//높이등의 설정을 할땐 UITableViewDelegate를 가져와야 한다.
class FriendListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 친구리스트 array 변수 선언
    var friendList:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 데이터를 담는다.
        friendList = ["A", "B", "C", "D", "E", "F"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // section의 갯수를 지정.
    // return 10 하면 10개가 생김.
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return
//    }

    
    // 한 section에 들어가게 될 row의 수를 지정.
    // friendList array의 갯수를 count해서 사용한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = friendList?.count ?? 0
        return count
    }
    
    // withIdentifier에 지정해주는 id값은 storyboard에서 tableview로 
    // 사용될 Table View Cell의 Attribute inspector에 있는 identifier에 있는 값을 넣어주어야 한다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendsCell = tableView.dequeueReusableCell(withIdentifier: "inspectorIdHere", for: indexPath)
        
        friendsCell.textLabel?.text = friendList?[indexPath.row]
        
        return friendsCell
    }
    
    // section에 넣을 이름
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(section)
        
    }
    
    // row 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    // section 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}
