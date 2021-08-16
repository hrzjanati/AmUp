//
//  ProfileViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/12/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var collectionView : UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNavBar("Hrzjanati")
        setupCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
        collectionView?.backgroundColor = .systemBackground
    }
    
    func setupCollectionView() {
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        layout.itemSize = CGSize(width: (screenWidth - 4) / 3 , height: (screenWidth - 4) / 3 )
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        
        //cell
        collectionView?.register(ProfilePhotoCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePhotoCollectionViewCell.identifire)
        
        
        // header info
        collectionView?.register(ProfileHeaderViewCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeaderViewCollectionReusableView.identifire)
        
        
        // header tabes
        collectionView?.register(profileTabsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: profileTabsCollectionReusableView.identifire)
        
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        guard let collectionView = collectionView else {return}
        view.addSubview(collectionView)
    }
    
}

//MARK:- UICollectionViewDataSource Protocol
extension ProfileViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePhotoCollectionViewCell.identifire, for: indexPath) as! ProfilePhotoCollectionViewCell
        let imageMap = UIImageView()
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,56.69869985431433&markers=color:red%7Clabel:D%7C50.707998,64.703069&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        imageMap.af.setImage(withURL: url, placeholderImage: placeholderImage)
        cell.configure(with: imageMap.image! )
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            
            return UICollectionReusableView()
        }
        
        if indexPath.section == 1 {
            // tabs header
            let tabControll = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: profileTabsCollectionReusableView.identifire, for: indexPath) as! profileTabsCollectionReusableView
            
            tabControll.delegate = self
            return tabControll
            
        }
        // header profile
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeaderViewCollectionReusableView.identifire, for: indexPath) as! ProfileHeaderViewCollectionReusableView
        
        profileHeader.delegate = self
        return profileHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // size header profile
        if section == 0 {
            return CGSize(width: collectionView.frame.size.width,
                          height: (Screen.width / 4) + (Screen.height / 9 - 15) + (Screen.width / 2 * 0.6))
        }
        // size section tabs profile
        return CGSize(width: collectionView.frame.size.width,
                      height: 40)
        
        
    }
    
}
//MARK:- UICollectionView Delegate Protocol
extension ProfileViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "SingelPostViewController") as? SingelPostViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
//MARK:- UICollectionViewDelegateFlowLayout Protocol
extension ProfileViewController : UICollectionViewDelegateFlowLayout {
    
}

//MARK:- ProfileHeaderViewCollectionReusableViewDelegate Protocol
extension ProfileViewController : ProfileHeaderViewCollectionReusableViewDelegate {
    
    func profileHeaderDidTappedEventButton(_ header: ProfileHeaderViewCollectionReusableView) {
        print("tapped event button in profile")
    }
    
    func profileHeaderDidTappedActiveButton(_ header: ProfileHeaderViewCollectionReusableView) {
        print("tapped active button")
    }
    
    func profileHeaderDidTappedEditProfileButton(_ header: ProfileHeaderViewCollectionReusableView) {
        // maust be open edit profile page
        print("tapped edit button")
        let storyboard = UIStoryboard(name: "singelViewSt", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        self.present(vc, animated: true)
    }
    
    
}

//MARK:- ProfileTabsCollectionReusableViewDelegate Protocol
extension ProfileViewController : profileTabsCollectionReusableViewDelegate {
    func profileTabbarDidTappedMapButton(_ header: profileTabsCollectionReusableView) {
        print("tapped map view")
    }
    
    func profileTabbarDidTappedPhotoButton(_ header: profileTabsCollectionReusableView) {
        print("tapped photo bar")
    }
    
    
    
}
