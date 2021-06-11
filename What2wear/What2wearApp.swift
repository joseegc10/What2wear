//
//  What2wearApp.swift
//  What2wear
//
//  Created by Jose Alberto Garcia Collado on 1/6/21.
//

import SwiftUI

@main
struct What2wearApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        let login = FirebaseAuth()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
