//
//  AppDelegate.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
