//
//  ContentView.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DialPadViewModel()
                .tabItem {
                    Label("Dial Pad", systemImage: "phone.fill.arrow.up.right")
                }
            
            ContactsListView()
                .tabItem {
                    Label("Contacts", systemImage: "person.crop.circle")
                }
        }    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
