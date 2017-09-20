//
//  ProfileViewController.swift
//  InstagramSample
//
//  Created by youngmin joo on 2017. 7. 25..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "Header"

class ProfileViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var userData:User?{
        didSet{
            self.collectionView?.reloadData()
            self.navigationItem.title = userData?.email
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
                
        //NaviSetting
        
        let settingBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "gear"), style: .plain, target: self, action: #selector(handlerSetting))
        self.navigationItem.rightBarButtonItem = settingBtn
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(ProfileInfoHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if DataCenter.sharedData.isLogin && userData == nil {
            DataCenter.sharedData.requsetUserData(completion: { (user) in
                self.userData = user
            })
        }
    }
    
    
    

    func handlerSetting()
    {
        //logout
        do{
            try Auth.auth().signOut()
            //tabbar 요청
            userData =  nil
            
            let tabbar:MainTabbarViewController? = self.tabBarController as? MainTabbarViewController
            tabbar?.showLoginVC()
            
        }catch
        {
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = .red
    
        return cell
    }


    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! ProfileInfoHeader
        
        if let userData = self.userData
        {
            cell.user = userData
        }
        
//        cell.backgroundColor = .yellow
        
        return cell
    }
    
    
    
    
    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.size.width-2)/3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
