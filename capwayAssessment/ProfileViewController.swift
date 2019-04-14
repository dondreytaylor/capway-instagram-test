//
//  ProfileViewController.swift
//  capwayAssessment
//
//  Created by Ronald Jones on 4/11/19.
//  Copyright © 2019 Ron Jones Jr. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //attach assets
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
    
    //create array for subtitle under username
    let randomPhraseArray = ["iOS Developer Atlanta GA", "Marketing Major Denver CO", "Mental Health Advocate Rock Hill SC", "Public Speaker Chicago IL", "Author and Poet Santa Fe CA", "Graphic Designer Miami FL"]
    
    //create initializer
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
        
        //set up elements
        setUpProfile()
        loadStories()
        
        //assign delegates and register nib
        collecView.delegate = self
        collecView.dataSource = self
        collecView.register(UINib(nibName: "ProfilePicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "profileCell")
        
        //create flow layout for collection view cell
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.sectionInset = UIEdgeInsets(top: 0.1, left: 0.1, bottom: 0.1, right: 0.1)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0.0
        collecView.collectionViewLayout = flowLayout
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundColor")!)
        self.collecView.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundColor")!)
    }
    
    //set up profile with information
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
    
    //create pop up on click
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collecView.cellForItem(at: indexPath) as! ProfilePicCollectionViewCell
        //create image view
        let imageView = cell.profileImg
        let newImageView = UIImageView(image: imageView!.image)
        newImageView.frame = CGRect(x: UIScreen.main.bounds.minX + 50, y: UIScreen.main.bounds.maxY / 4, width: UIScreen.main.bounds.width / 1.3 , height: UIScreen.main.bounds.height / 2)
        newImageView.backgroundColor = .clear
        newImageView.contentMode = .scaleToFill
        newImageView.isUserInteractionEnabled = true
        //add tap action
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissFullscreenImage(_:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    //tap action
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //deque collection view cell
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! ProfilePicCollectionViewCell
        
        cell.profileImg.image = randomPosts.randomElement()
        cell.profileImg.contentMode = .scaleAspectFill
        
        return cell
    }
    
    @IBAction func dismisss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
