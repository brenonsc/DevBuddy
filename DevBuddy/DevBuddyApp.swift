//
//  DevBuddyApp.swift
//  DevBuddy
//
//  Created by Breno Henrique on 17/06/22.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct DevBuddyApp: App
{
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
    }
}
