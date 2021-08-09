//
//  ContactsViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import SwiftUI

struct ContactsListViewModel: View {
    @State private var searchText: String = ""
    @State private var showNewContactSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                SearchBar(text: $searchText)
                    .padding(.bottom)
                
                
                ContactCellViewModel()
            }
            .navigationBarTitle("Contacts")
            .navigationBarItems(trailing:
                                    Button(action: {
                                        // Add Contact
                                        self.showNewContactSheet.toggle()
                                    }, label: {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.largeTitle)
                                    })
                                    .sheet(isPresented: $showNewContactSheet){
                                        ContactEditDetailViewModel(contact: Contact())
                                    })
        }
    }
}

struct ContactsListViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListViewModel()
        
    }
}


struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 20)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .onTapGesture {
                    self.isEditing = true
                }
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                    }
                )
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                }, label: {
                    Text("Cancel")
                })
                .padding(.trailing)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
            
        }
    }
}
