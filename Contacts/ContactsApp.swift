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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    let callManager = CallManager()
    var providerDelegate: ProviderDelegate!
    
    class var shared: AppDelegate {
      return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        providerDelegate = ProviderDelegate(callManager: callManager)
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return true
    }
    
    func displayIncominCall(
        uuid: UUID,
        handle: String,
        completion: ((Error?) -> Void)?
      ) {
        providerDelegate.reportIncomingCall(
          uuid: uuid,
          handle: handle,
          completion: completion)
    }
}
