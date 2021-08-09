//
//  CreateNewContactViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 05/08/2021.
//

import SwiftUI

struct ContactEditDetailViewModel: View {
    var contact: Contact
    
    // Bindings
    
    
    // Contact Values States
    
    @State private var firstName: String
    @State private var lastName: String
    @State private var company: String
    @State private var dateOfBirth: String
    @State private var addressLine1: String
    @State private var addressLine2: String
    @State private var city: String
    @State private var county: String
    @State private var postcode: String
    @State private var phoneNumber: String
    @State private var email: String
    @State private var favorite: Bool
    
    // Other States
    
    @State private var addEmail: Bool = false
    @State private var addAddress: Bool = false
    
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
        _dateOfBirth = State(wrappedValue: contact.contactDOB)
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
                            
                            Button(action: {
                                //Add photo logic
                            }, label: {
                                Text("Add Photo")
                            })
                        }
                        Spacer()
                    }
                    
                    Section() {
                        TextField("First Name", text: $firstName)
                            .autocapitalization(.sentences)
                        TextField("Last Name", text: $lastName)
                            .autocapitalization(.sentences)
                        TextField("Company", text: $company)
                            .autocapitalization(.sentences)
                    }
                    
                    Section() {
                        HStack{
                            Text("Phone")
                                .opacity(0.7)
                                .font(.subheadline)
                            Divider()
                            
                            TextField("", text: $phoneNumber)
                        }
                    }
                    
                    Section() {
                        if addEmail == true {
                            TextField("Email Address", text: $email)
                                .keyboardType(.emailAddress)
                        } else {
                        
                            Button(action: {
                                self.addEmail.toggle()
                            }, label: {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.title3)
                                        
                                        Text("Add Email Address")
                                            .foregroundColor(.primary)
                                            .font(.subheadline)
                                    }
                                })
                        }
                    }
                    
                    Section() {
                        if addAddress == true{
                            TextField("Address Line 1", text: $addressLine1)
                            TextField("Address Line 2", text: $addressLine2)
                            TextField("City", text: $city)
                            TextField("County", text: $county)
                            TextField("Post Code", text: $postcode)
                            
                            // Add Mapkit view
                        } else {
                            Button(action: {
                                self.addAddress.toggle()
                            }, label: {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                            .font(.title3)
                                        
                                        Text("Add Address")
                                            .foregroundColor(.primary)
                                            .font(.subheadline)
                                    }
                                })
                        }
                    }
                    
        }
    }
}

struct ContactEditDetailViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContactEditDetailViewModel(contact: exampleContacts[0])
    }
}