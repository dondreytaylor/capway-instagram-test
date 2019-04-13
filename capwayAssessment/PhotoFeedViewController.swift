//
//  PhotoFeedViewController.swift
//  capwayAssessment
//
//  Created by Ronald Jones on 4/11/19.
//  Copyright © 2019 Ron Jones Jr. All rights reserved.
//

import UIKit

class PhotoFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //create the arrays for stories, posts, usersnames and story profile pics
    var randomStories = [UIImage]()
    var randomPosts = [UIImage]()
    var names = ["RonJ","Sunny_Di","ShanRay","Tink4","lilMissNomo","LivieBlivie", "princessYanie","ShayOk","MomsBerr", "PopsBerr","MomJon","PopJon", "Nova","Thor","Jules"]
    var storyPic = [UIImage(named: "RonJ"), UIImage(named: "SunnyDi"), UIImage(named: "ShanRay"), UIImage(named: "Tink4"), UIImage(named: "LilMissNomo"), UIImage(named: "LivieBlivie"), UIImage(named: "PrincessYanie"), UIImage(named: "ShayOk"), UIImage(named: "MomsBerr"), UIImage(named: "PopsBerr"), UIImage(named: "MomJon"), UIImage(named: "PopJon"), UIImage(named: "Nova"), UIImage(named: "Thor"), UIImage(named: "Jules")]

    //link assets
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var collecView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //assign delegates and data sources
        tabView.delegate = self
        tabView.dataSource = self
        collecView.delegate = self
        collecView.dataSource = self
        
        //register cells
        tabView.register(UINib(nibName: "PhotFeedsTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoFeed")
        collecView.register(UINib(nibName: "PhotoFeeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoFeeds")

        //create flow layout for collection view cell
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 65, height: 65)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        collecView.collectionViewLayout = flowLayout
        
        //hide navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //populate the posts and stories
        loadPosts()
        loadStories()
    }
    
    func  loadPosts() {
        //create for loop to load random posts
        for _ in 1...15 {
        if let datas = try? Data(contentsOf: URL(string: "https://picsum.photos/200/300/?random")!) {
            let img = UIImage(data: datas)
            randomPosts.append(img!)
        }
        }
    }
    
    func loadStories() {
        //create for loop to load random stories
        for _ in 1...15 {
            if let datas = try? Data(contentsOf: URL(string: "https://picsum.photos/200/300/?random")!) {
                let img = UIImage(data: datas)
                randomStories.append(img!)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomStories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //deque cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoFeeds", for: indexPath) as! PhotoFeeCollectionViewCell

        //configure image
        cell.img.image = storyPic[indexPath.row]
        cell.username.text = names[indexPath.row]
        cell.img.layer.borderWidth = 1.0
        cell.img.layer.masksToBounds = false

        //make it a circle
        cell.img.layer.cornerRadius = cell.img.frame.height / 2
        cell.img.clipsToBounds = true
        
        //fit image in view
        cell.img.contentMode = .scaleToFill
        
        //add circle border
        cell.bord.image = UIImage(named: "circleBorder")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //deque cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoFeed", for: indexPath) as! PhotFeedsTableViewCell
        
        //configure pics
        cell.pic.image = randomPosts[indexPath.row]
        cell.username.text = names[indexPath.row]
        cell.storyPic.image = storyPic[indexPath.row]
        cell.storyPic.layer.borderWidth = 1.0
        cell.storyPic.layer.masksToBounds = false
       
        //make it a circle
        cell.storyPic.layer.cornerRadius = cell.storyPic.frame.height / 2
        cell.storyPic.clipsToBounds = true
        
        //fit picture
        cell.pic.contentMode = .scaleToFill
        cell.storyPic.contentMode = .scaleToFill
        
        //add circle border
        cell.bord.frame = cell.storyPic.frame
        cell.bord.image = UIImage(named: "circleBorder")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }

}
