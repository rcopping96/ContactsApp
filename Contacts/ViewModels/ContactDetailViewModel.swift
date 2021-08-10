//
//  ContactDetailViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 10/08/2021.
//

import SwiftUI

struct ContactDetailViewModel: View {
    let contact: Contact
    var callManager = CallManager()
        
    // Bindings
    @State var showSheetView: Bool = false
    
    // Contact Values States
    
    @State private var firstName: String
    @State private var lastName: String
    @State private var company: String
    @State private var dateOfBirth: Date?
    @State private var addressLine1: String
    @State private var addressLine2: String
    @State private var city: String
    @State private var county: String
    @State private var postcode: String
    @State private var phoneNumber: String
    @State private var email: String
    @State private var favorite: Bool

    
    init(contact: Contact) {
        self.contact = contact
        
        _firstName = State(wrappedValue: contact.contactFirstName)
        _lastName = State(wrappedValue: contact.contactLastName)
        _phoneNumber = State(wrappedValue: contact.contactPhone)
        _favorite = State(wrappedValue: contact.contactFavorite)
        _company = State(wrappedValue: contact.contactCompany)
        _email = State(wrappedValue: contact.contactEmail)
        _addressLine1 = State(wrappedValue: contact.contactAddress1)
        _addressLine2 = State(wrappedValue: contact.contactAddress2)
        _postcode = State(wrappedValue: contact.contactPostcode)
        _city = State(wrappedValue: contact.contactCity)
        _county = State(wrappedValue: contact.contactCounty)
        
    }
    
    var body: some View {
            Form {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(30)
                            .frame(width: 150, height: 150)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                
                Section(header: Text("Contact Details")) {
                    Text("\(firstName)")
                    Text("\(lastName)")
                    Text("\(company)")
                }
                
                Section(header: Text("Phone number")) {
                    HStack {
                        Text("\(phoneNumber)")
                        Spacer()
                        Button(action: {
                            //Add Call Functionality
                            callManager.startCall(handle: contact.phoneNumber!)
                        }, label: {
                            Image(systemName: "phone.fill")
                                .font(.title)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                                .background(Color.green.opacity(0.2))
                                .clipShape(Circle())
                        })
                    }
                }
                
                if addressLine1 != "" || addressLine2 != "" || city != "" || county != "" || postcode != "" {
                    Section(header: Text("Address")) {
                        Text("\(addressLine1)")
                        Text("\(addressLine2)")
                        Text("\(city)")
                        Text("\(county)")
                        Text("\(postcode)")
                    }
                    
                
                }
            }
    }
}

struct ContactDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailViewModel(contact: exampleContacts[0])
    }
}
