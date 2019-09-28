//
//  AppDelegate.swift
//  TryApp
//
//  Created by RealityFamily on 25/09/2019.
//  Copyright © 2019 RealityFamily. All rights reserved.
//

import UIKit
import YandexMapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        YMKMapKit.setApiKey("e31a0a89-50dc-4d57-b2e5-76d43cb51133")
        return true
    }


}

