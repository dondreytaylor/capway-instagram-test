//
//  AppDelegate.swift
//  capwayAssessment
//
//  Created by Ronald Jones on 4/11/19.
//  Copyright © 2019 Ron Jones Jr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let navigationController = UINavigationController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //configure window
        self.window = UIWindow( frame: UIScreen.main.bounds)
        
        //create tabs
        let profile = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        let photos = PhotoFeedViewController(nibName: "PhotoFeedViewController", bundle: nil)
        let home = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let search = SearchViewController(nibName: "SearchViewController", bundle: nil)
        let likes = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        
        
        let controllers = [home, search, photos, likes, profile]
        
        //create tab bar controller
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        //set up tab bar ui and labels
        profile.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "profile"),
            tag: 5)
        photos.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "photos") ,
            tag:3)
        home.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "home"),
            tag: 1)
        search.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "search") ,
            tag:2)
        likes.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "likes"),
            tag:4)
        
        
        
        //add tab bar to navigation controller
        navigationController.viewControllers = [tabBarController]
        
        //make window visible and set root view
        self.window!.rootViewController = UINavigationController(rootViewController: tabBarController)
        self.window!.makeKeyAndVisible()

    
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

