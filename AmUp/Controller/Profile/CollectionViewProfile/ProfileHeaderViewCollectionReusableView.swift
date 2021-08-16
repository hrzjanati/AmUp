//
//  ProfileHeaderViewCollectionReusableView.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/20/21.
//

import UIKit

protocol ProfileHeaderViewCollectionReusableViewDelegate : AnyObject {
    func profileHeaderDidTappedEventButton(_ header: ProfileHeaderViewCollectionReusableView)
    func profileHeaderDidTappedActiveButton(_ header: ProfileHeaderViewCollectionReusableView)
    func profileHeaderDidTappedEditProfileButton(_ header: ProfileHeaderViewCollectionReusableView)
}

final class ProfileHeaderViewCollectionReusableView: UICollectionReusableView {
    static let identifire = "ProfileHeaderViewCollectionReusableView"
    public weak var delegate : ProfileHeaderViewCollectionReusableViewDelegate?
    
    //Profile image
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        //        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,56.69869985431433&markers=color:red%7Clabel:D%7C50.707998,64.703069&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        //        let url = URL(string: imageurl)!
        //        let placeholderImage = UIImage(named: "placholdermapW")!
        //        imageView.af.setImage(withURL: url, placeholderImage: placeholderImage)
        //
        imageView.image = UIImage(named: "woman")
        return imageView
    }()
    
    //Event button
    private let eventbutton : UIButton = {
        let event = UIButton()
        event.setTitle("Event", for: .normal)
        event.setTitleColor(UIColor(named: "lableCustom"), for: .normal)
        return event
    }()
    
    //Active button
    private let activebutton : UIButton = {
        let active = UIButton()
        active.setTitle("Active", for: .normal)
        active.setTitleColor(UIColor(named: "lableCustom"), for: .normal)
        return active
    }()
    
    //Edit profile button
    private let editProfile : UIButton = {
        let edit = UIButton()
        edit.setTitle("Edit Profile", for: .normal)
        edit.setTitleColor(UIColor(named: "lableCustom"), for: .normal)
        edit.layer.cornerRadius = 5
        edit.layer.masksToBounds = true
        edit.borderWidthV = 1
        edit.borderColorV = .systemGray4
        return edit
    }()
    
    //Name label
    private let nameLbl : UILabel = {
        let name = UILabel()
        name.text = "daniala jorjy"
        name.textColor = UIColor(named: "lableCustom")
        name.font = UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 16)
        return name
    }()
    
    // Bio label
    private let BioLbl : UILabel = {
        let bio = UILabel()
        bio.text = "hosein rezazadeh janati \n bioooooo \n this is first acount in am up \n i like every things"
        bio.textColor = UIColor(named: "lableCustom")
        bio.numberOfLines = 0
        bio.contentMode = .top
        bio.font = UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 15)
        return bio
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        addButtonAction()
        backgroundColor = .systemBackground
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let profilePhotoSize = Screen.width / 4
        profileImageView.frame = CGRect(x: 10,
                                        y: 5,
                                        width:profilePhotoSize,
                                        height: profilePhotoSize
        ).integral
        
        profileImageView.layer.cornerRadius = profilePhotoSize/2.0
        
        let buttonHeight = profilePhotoSize / 2
        let countButtonWidth =  (Screen.width - 10 - profilePhotoSize) / 2
        
        eventbutton.frame = CGRect(x: profilePhotoSize + 10 ,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight
        ).integral
        
        activebutton.frame = CGRect(x: 10 + profilePhotoSize + countButtonWidth,
                                    y: 5,
                                    width: countButtonWidth,
                                    height: buttonHeight
        ).integral
        
        
        nameLbl.frame = CGRect(x: 10,
                               y: profilePhotoSize + 10,
                               width: Screen.width - 10,
                               height: 15
        ).integral
        
        BioLbl.frame = CGRect(x: 10,
                              y: profilePhotoSize + 30,
                              width: Screen.width - 10,
                              height: Screen.height / 7 - 15
        ).integral
        
        
        editProfile.frame = CGRect(x: 10,
                                   y: profilePhotoSize + 25 + (Screen.height / 7) ,
                                   width: Screen.width - 20,
                                   height: buttonHeight * 0.6
        ).integral
    }
    //MARK: Add Button To View
    private func addSubView() {
        addSubview(profileImageView)
        addSubview(eventbutton)
        addSubview(activebutton)
        addSubview(editProfile)
        addSubview(nameLbl)
        addSubview(BioLbl)
    }
    
    private func addButtonAction() {
        eventbutton.addTarget(self,
                              action: #selector(didTappedEventButton),
                              for: .touchUpInside)
        activebutton.addTarget(self,
                               action: #selector(didTappedActiveButton),
                               for: .touchUpInside)
        editProfile.addTarget(self,
                              action: #selector(didTappedEditProfileButton),
                              for: .touchUpInside)
    }
    
    //MARK:- <<<- Actions ->>>
    @objc private func didTappedEventButton() {
        delegate?.profileHeaderDidTappedEventButton(self)
    }
    
    @objc private func didTappedActiveButton() {
        delegate?.profileHeaderDidTappedActiveButton(self)
    }
    
    @objc private func didTappedEditProfileButton() {
        delegate?.profileHeaderDidTappedEditProfileButton(self)
    }
    
}
