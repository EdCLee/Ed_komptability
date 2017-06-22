//
//  ViewController.swift
//  JsonDataPracViaAlbum
//
//  Created by CLEE on 22/06/2017.
//  Copyright © 2017 CLEE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(DataCenter.defaultCenter.movieDataArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movie = DataCenter.defaultCenter.movieDataArray[indexPath.row]
        
        myCell.textLabel?.text = movie.title
        myCell.detailTextLabel?.text = String(movie.year)
        
        myCell.imageView?.image = UIImage(named: movie.posterURL)
        
        return myCell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 200
        }
        
        return 1000
    }
    
    
    
}

