//
//  ContactRepository.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import Foundation
import Firebase
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
        let userId = Auth.auth().currentUser?.uid
        
        db.collection("contacts")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener() { (querySnapshot, err) in
            if let querySnapshot = querySnapshot {
                self.contacts = querySnapshot.documents.compactMap { document in
                    do {
                        let x = try document.data(as: Contact.self)
                        print(self.contacts.count)
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
    
    // MARK: Update data
    
    func updateContact(_ contact: Contact) {
        let docRef = db.collection("contacts").document(contact.id!)
        
        docRef.delete()
        addContact(contact)
    }
    
    // MARK: Delete data
    
    func deleteContact(_ contact: Contact) {
        let docRef = db.collection("contacts").document(contact.id!)
        docRef.delete()
    }
    
}
