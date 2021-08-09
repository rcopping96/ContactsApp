//
//  ContactRepository.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ContactsRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var contacts = [Contact]()
    
    init() {
        loadData()
    }
    
    //MARK: Get Data
    
    func loadData() {
        db.collection("contacts")
            .order(by: "firstName")
            .addSnapshotListener() { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
                self.contacts = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Contact.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
        }
    }
    
    //MARK: Add Data
    
    func addContact(_ contact: Contact) {
        do {
            let _ = try db.collection("contacts").addDocument(from: contact)
        }
        catch {
            fatalError("Unable to encode contact: \(error.localizedDescription)")
        }
    }
    
}
