//
//  AppDelegate.swift
//  Postall
//
//  Created by Jesse Ruiz on 11/2/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // So the left and right pane appear visible at all times
        if let split = window?.rootViewController as? UISplitViewController {
            split.preferredDisplayMode = .oneBesideSecondary
            
            // Find the right-hand view controller
            if let nc = split.viewControllers.last as? UINavigationController {
                // Find the postcard view controller inside the nav controller
                nc.topViewController?.navigationItem.leftBarButtonItem = split.displayModeButtonItem
            }
        }
        return true
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

