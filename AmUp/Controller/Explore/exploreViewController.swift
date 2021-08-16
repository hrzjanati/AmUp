//
//  exploreViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit
import Foundation
import AlamofireImage
import Alamofire




class exploreViewController: UIViewController, UICollectionViewDataSource, GridLayoutDelegate, UISearchResultsUpdating {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridLayout: GridLayout!
    @IBOutlet weak var resulteSearchView: UIView!
    
    var arrInstaBigCells = [Int]()
    var selectedIndexPath: IndexPath?
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var resualt:ResualtSearchUpdaterViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        self.navigationItem.titleView = searchController.searchBar
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.barTintColor = navigationController?.navigationBar.barTintColor
        searchController.searchBar.tintColor = self.view.tintColor
        searchController.hidesNavigationBarDuringPresentation = false
        
        resualt = ResualtSearchUpdaterViewController()
        arrInstaBigCells.append(1)
        
        var tempStorage = false
        for _ in 1...21 {
            if(tempStorage){
                arrInstaBigCells.append(arrInstaBigCells.last! + 10)
            } else {
                arrInstaBigCells.append(arrInstaBigCells.last! + 8)
            }
            tempStorage = !tempStorage
        }
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.contentOffset = CGPoint(x: -10, y: -10)
        gridLayout.delegate = self
        gridLayout.itemSpacing = 1
        gridLayout.fixedDivisionCount = 3
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        resulteSearchView.alpha = 0
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! exploreCollectionViewCell
        
        
        let imageurl = "https://maps.googleapis.com/maps/api/staticmap?center=&maptype=roadmap&path=color:0x000000%7Cweight:10%7Cenc:q%60kzDsacsMyEoIaDiGs@sAYa@OIc@W]VqBnBSRS]qE_IgLeT_BwCwFrEjBpDjA%7CBqAhA%7BCjCj@bA&markers=color:green%7Clabel:P%7C30.699000010896544,76.69869985431433&markers=color:red%7Clabel:D%7C30.707998,76.703069&key=AIzaSyDdchM7apzEter6yaWfyQG-dF6AORh34MA&size=700x700"
        let url = URL(string: imageurl)!
        let placeholderImage = UIImage(named: "placholdermapW")!
        cell.imageViewCollection.af.setImage(withURL: url, placeholderImage: placeholderImage)
        
        return cell
    }
    
    func itemFlexibleDimension(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, fixedDimension: CGFloat) -> CGFloat {
        return fixedDimension
    }
    
}

// MARK: - UICollectionDelegate
extension exploreViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell!.layer.backgroundColor = UIColor.black.cgColor
        self.selectedIndexPath = indexPath
        print(indexPath.row)
        let vc = UIStoryboard.init(name: "singelViewSt", bundle: Bundle.main).instantiateViewController(withIdentifier: "SingelPostViewController") as? SingelPostViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        // if use exseption in app
        //        cell!.layer.backgroundColor = UIColor.white.cgColor
        self.selectedIndexPath = nil
    }
// MARK: - PrimeGridDelegate
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
        if(arrInstaBigCells.contains(indexPath.row) || (indexPath.row == 1)){
            return 2
        } else {
            return 1
        }
    }
    
}
//MARK:- UISearch br delegate for Explore
extension exploreViewController : UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        UIView.animate(withDuration: 0.3) {
            self.resulteSearchView.alpha = 1
        }
        
        resualt?.textDidSerch(string: text)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.resulteSearchView.alpha = 0
                searchBar.showsCancelButton = false
            }
        }
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}


