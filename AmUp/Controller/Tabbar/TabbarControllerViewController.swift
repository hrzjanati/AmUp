//
//  TabbarControllerViewController.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/12/21.
//

import UIKit

class TabbarControllerViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor(named: "lableCustom")
        
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == (self.tabBar.items!)[0]{
            //Do something if index is 0
            print("tabber 1")
        }
        else if item == (self.tabBar.items!)[1]{
            print("tabba r 2")
            
        }else if item == (self.tabBar.items!)[2] {
            
        }
        
    }
    
    
}
