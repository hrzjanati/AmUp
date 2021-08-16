//
//  AppDelegate.swift
//  AmUp
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 5/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var reachability:Reachability!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //chnage bav bar item font in project
        setupNavigtionBar()
        
        
        //Network Reachability Notification check
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged), name: ReachabilityChangedNotification, object: nil)
        self.reachability = Reachability.init()
        do {
            try self.reachability.startNotifier()
        } catch {
            
        }
        
        return true
    }
    // setup navightion bar design in all project
    func setupNavigtionBar() {
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "FONTSPRINGDEMO-BlueVinylRegular", size: 20)!], for: .normal)
        UIBarButtonItem.appearance().tintColor = UIColor(named: "lableCustom")
        
    }
    
    
    //MARK:- Network Check
    @objc func reachabilityChanged(notification:Notification) {
        let reachability = notification.object as! Reachability
        if reachability.isReachable {
            if reachability.isReachableViaWiFi {
                print("Reachable via WiFi")
            } else {
                
                print("Reachable via Cellular\n")
            }
        } else {
            //TODO:  show error and show alert view
                print("Network not reachable\n")
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

