//
//  ContactsDataModel.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Contact: Codable, Identifiable {
    @DocumentID var id: String?
    var firstName: String?
    var lastName: String?
    var company: String?
    var dateOfBirth: Date?
    var addressLine1: String?
    var addressLine2: String?
    var city: String?
    var county: String?
    var postcode: String?
    var phoneNumber: String?
    var email: String?
    var favorite: Bool?
    var userId: String?
}

class ContactVM: ObservableObject {
    @Published var contact: Contact
    
    init(_ contact: Contact) {
        self.contact = contact
    }
}

var exampleContacts: [Contact] = [
    Contact(id: "test1", firstName: "Rob", lastName: "Copping", company: "KCL", addressLine1: "3 Cutice Close", addressLine2: "", city: "St Austell", postcode: "PL25 3FJ", phoneNumber: "07476270702", email: "robbiecop96@gmail.com", favorite: false)
]
