//
//  MainViewController.swift
//  PersonList
//
//  Created by 샤인 on 2017. 6. 26..
//  Copyright © 2017년 IosCamp. All rights reserved.
//

import UIKit



class MainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genderFilterOut: UISegmentedControl!
    var personData:[[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        genderFilterOut.selectedSegmentIndex = 0
        loadData()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personData.count //유저디폴트 어레이의 값 갯수 만큼 셀을 만든다
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let personName = personData[indexPath.row] //유저디폴트 어레이 안에서 인덱스패스 로우번째의 데이터를 변수에 담는다
                                                   //(배열안에서 딕셔너리만 빼서 담았다)
        cell.textLabel?.text = personName["Name"] //각 셀 텍스트에 딕셔너리[Name:입력값]의 Name키값을 써서 이름들을 담아준다
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let person = personData[indexPath.row] //데이터 배열의 해당 로우번째 인덱스의 데이터(딕셔너리)를 변수에 담는다
        detailViewController.name = person["Name"] // 딕셔너리 키를 넣고 값을 디테일뷰 변수에 담는다
        detailViewController.age = person["Age"]
        detailViewController.gender = person["Gender"] ?? "정보 없음"

        
        detailViewController.editingMode = true  //셀을 선택해 수정을 할경우 에디팅을 할 수 있게 해줬다
        detailViewController.indexPath = indexPath.row //디테일뷰에서 사용할 인덱스패스를 입력해줬다
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func loadData(){
        guard let data = UserDefaults.standard.array(forKey: "PersonList") as? [[String:String]] else {
            return print("데이터가 없습니다")
        }
        
        personData = data

    }

    
    @IBAction func genderFilter(_ sender: UISegmentedControl) {
        
        
        
        if sender.selectedSegmentIndex == 1{
            loadData()     //로드데이터를 먼저 해주지 않고 남여 데이터 필터를 하게 되면 맨을 눌렀을때 우먼정보가 데이터배열에서 사라지게 된다, 그 다음 우먼을 누르면 데이터배열에 맨만 있는 상태에서 맨이 또 사라지게 되기 때문에 결국 빈값이 되어버린다
            // 그래서 맨,우먼 세그먼트를 누를 경우에 모든 데이터를 먼저 불러온 후 거기서 뺀다
            let genderData = personData.filter({(men:[String:String]) -> Bool in
                
            return men["Gender"] == "men" //1번 세그먼트를 선택시 사람데이터의 젠더에서 맨인 사람만 데이터에 담는다
            })
          
//            print(genderPickArr)
            personData = genderData
            tableView.reloadData()
        }else if sender.selectedSegmentIndex == 2{
            loadData()
            let genderData = personData.filter({(women:[String:String]) -> Bool in
                return women["Gender"] == "women" //2번 세그먼트를 선택시 사람데이터의 젠더에서 맨인 사람만 데이터에 담는다
            })
            
            personData = genderData
            tableView.reloadData()
        }else{
            loadData()
            tableView.reloadData()
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
