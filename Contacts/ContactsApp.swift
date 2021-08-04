//
//  ContactsApp.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import SwiftUI
import Firebase

@main
struct ContactsApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    class AppDelegate: NSObject, UIApplicationDelegate{
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
