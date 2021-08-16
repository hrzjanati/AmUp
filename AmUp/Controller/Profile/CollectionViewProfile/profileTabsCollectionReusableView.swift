//
//  profileTabsCollectionReusableView.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/24/21.
//

import UIKit
protocol profileTabsCollectionReusableViewDelegate: AnyObject {
    func profileTabbarDidTappedMapButton(_ header: profileTabsCollectionReusableView)
    func profileTabbarDidTappedPhotoButton(_ header: profileTabsCollectionReusableView)
}

final class profileTabsCollectionReusableView: UICollectionReusableView {
    
    static let identifire = "profileTabsCollectionReusableView"
    public weak var delegate : profileTabsCollectionReusableViewDelegate?
    
    
    //Edit profile button
    private let map : UIButton = {
        let map = UIButton()
        map.clipsToBounds = true
        map.tintColor =  UIColor(named: "lableCustom")
        map.setImage(UIImage(systemName: "squareshape.split.3x3"), for: .normal)
        map.backgroundColor = .clear
        return map
    }()
    
    //Edit profile button
    private let photo : UIButton = {
        let photo = UIButton()
        photo.clipsToBounds = true
        photo.tintColor =  .lightGray
        photo.setImage(UIImage(systemName: "person"), for: .normal)
        return photo
    }()
    
    // grid map label
    private let mapGrid : UILabel = {
        let gridMap = UILabel()
        gridMap.backgroundColor = .label
        return gridMap
    }()
    
    // grid photo label
    private let photoGrid : UILabel = {
        let photoMap = UILabel()
        photoMap.backgroundColor = UIColor(named: "labelSegment")
        return photoMap
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(map)
        addSubview(photo)
        addSubview(mapGrid)
        addSubview(photoGrid)
        addButtonAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        map.frame = CGRect(x: 0, y: 0, width: Screen.width / 2, height: 40)
        photo.frame = CGRect(x:  Screen.width / 2, y: 0, width: Screen.width / 2, height: 40)
        
        mapGrid.frame = CGRect(x: 0, y: 38, width: Screen.width / 2 , height: 1)
        photoGrid.frame = CGRect(x: Screen.width / 2, y: 38, width: Screen.width / 2 , height: 1)
    }
    
    private func addButtonAction(){
        map.addTarget(self,
                      action: #selector(didTappedMapButton),
                      for: .touchUpInside)
        photo.addTarget(self,
                        action: #selector(didTappedPhotoButton),
                        for: .touchUpInside)
    }
    
    //MARK:- <<<Action>>>
    @objc private func didTappedMapButton() {
        map.tintColor =  UIColor(named: "lableCustom")
        mapGrid.backgroundColor = .label
        photo.tintColor =  .lightGray
        photoGrid.backgroundColor = UIColor(named: "labelSegment")
        delegate?.profileTabbarDidTappedMapButton(self)
    }
    @objc private func didTappedPhotoButton() {
        photo.tintColor =  UIColor(named: "lableCustom")
        photoGrid.backgroundColor = .label
        map.tintColor =  .lightGray
        mapGrid.backgroundColor = UIColor(named: "labelSegment")
        delegate?.profileTabbarDidTappedPhotoButton(self)
    }
}
