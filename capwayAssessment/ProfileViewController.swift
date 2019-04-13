//
//  ProfileViewController.swift
//  capwayAssessment
//
//  Created by Ronald Jones on 4/11/19.
//  Copyright © 2019 Ron Jones Jr. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var profilePic: UIImage?
    var username: String?
    var firstname: String?
    var randomPosts = [UIImage]()
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var random1: UILabel!
    @IBOutlet weak var random2: UILabel!
    @IBOutlet weak var random3: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var randomPhrase: UILabel!
    @IBOutlet weak var collecView: UICollectionView!
    @IBOutlet weak var profilePicc: UIImageView!
    let randomPhraseArray = ["iOS Developer Atlanta GA", "Marketing Major Denver CO", "Mental Health Advocate Rock Hill SC", "Public Speaker Chicago IL", "Author and Poet Santa Fe CA", "Graphic Designer Miami FL"]
    init(profilePics: UIImage, usernames: String, firstnames: String ) {
        self.profilePic = profilePics
        self.username = usernames
        self.firstname = firstnames
        super.init(nibName: "ProfileViewController", bundle: nil)
        }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpProfile()
        loadStories()
        
        collecView.delegate = self
        collecView.dataSource = self
        collecView.register(UINib(nibName: "ProfilePicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "profileCell")
        
        //create flow layout for collection view cell
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0.0
        collecView.collectionViewLayout = flowLayout
        
    }
    
    func setUpProfile() {
        self.profilePicc.image = profilePic ?? UIImage(named: "RonJ")
        self.profilePicc.layer.borderWidth = 0.5
        self.profilePicc.layer.cornerRadius = self.profilePicc.layer.frame.height / 2
        self.profilePicc.clipsToBounds = true
        self.firstnameLabel.text = firstname ?? "Ron Jones"
        self.usernameLabel.text = username ?? "RonJones32"
        self.random1.text = Int.random(in: 1..<100).description
        self.random2.text = Int.random(in: 1..<100).description
        self.random3.text = Int.random(in: 1..<100).description
        self.randomPhrase.text = randomPhraseArray.randomElement()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfilePicCollectionViewCell
        
        cell.profileImg.image = randomPosts.randomElement()
        
        return cell
    }
    
    func loadStories() {
        //create for loop to load random stories
        for _ in 1...15 {
            if let datas = try? Data(contentsOf: URL(string: "https://picsum.photos/200/300/?random")!) {
                let img = UIImage(data: datas)
                randomPosts.append(img!)
            }
        }
    }
}
