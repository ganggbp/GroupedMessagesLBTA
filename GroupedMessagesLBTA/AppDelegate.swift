//
//  AppDelegate.swift
//  GroupedMessagesLBTA
//
//  Created by Burit Boonkorn on 31/7/2566 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = ViewController()
        let navigationVc = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationVc
        window?.makeKeyAndVisible()

        return true
    }
}

