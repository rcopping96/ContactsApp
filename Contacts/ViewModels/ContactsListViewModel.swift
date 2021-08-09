//
//  ContactsListViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 09/08/2021.
//

import Foundation
import Combine

class ContactsListViewModel: ObservableObject {
    @Published var contactsRepo = ContactsRepository()
    @Published var contactsCellViewModels = [ContactCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        contactsRepo.$contacts
            .map { contact in
                contact.map { contact in
                    ContactCellViewModel(contact: contact)
                }
            }
            .assign(to: \.contactsCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func addContact(contact: Contact) {
        let contactVM = ContactCellViewModel(contact: contact)
        self.contactsCellViewModels.append(contactVM)
    }
}
