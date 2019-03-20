//
//  AppDelegate.swift
//  BitcoinConversion
//
//  Created by Michael Miles on 3/19/19.
//  Copyright © 2019 Michael Miles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let name = UserDefaults.standard.string(forKey: "Name")


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        openToSelector()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        openToSelector()
    }

    func openToSelector() {
        if name?.isEmpty == false {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let ViewController = storyBoard.instantiateViewController(withIdentifier: "SelectorVC") as! SelectorViewController
            let navigationController = UINavigationController(rootViewController: ViewController)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window!.rootViewController = navigationController
        }
    }
    
}

