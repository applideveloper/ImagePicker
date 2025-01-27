//
//  AppDelegate.swift
//  ImagePicker
//
//  Created by Abhishek on 16/09/17.
//  Copyright © 2017 Nickelfox. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
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

extension AppDelegate {

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
		let userDefaults = UserDefaults(suiteName: "group.com.nickelfox.testpush")
		if let key = url.absoluteString.components(separatedBy: "=").last,
			let sharedArray = userDefaults?.object(forKey: key) as? [Data] {
			
			var imageArray: [CellModel] = []
			
			for imageData in sharedArray {
				let model = CellModel(image: UIImage(data: imageData)!)
				imageArray.append(model)
			}
			
			let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
			let homeVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
			homeVC.cellItems = imageArray
			
			let navVC = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
			
			navVC.viewControllers = [homeVC]
			self.window?.rootViewController = navVC
			self.window?.makeKeyAndVisible()
			
			return true
		}
		
		return false
	}
	
}
