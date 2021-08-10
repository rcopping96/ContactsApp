//
//  Contacts-Extensions.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import Foundation

extension Contact {
    
    var contactFirstName: String {
        firstName ?? ""
    }
    
    var contactLastName: String {
        lastName ?? ""
    }
    
    var contactFavorite: Bool {
        favorite ?? false
    }
    
    var contactPhone: String {
        phoneNumber ?? ""
    }
    
    var contactCompany: String {
        company ?? ""
    }
    
    var contactAddress1: String {
        addressLine1 ?? ""
    }
    
    var contactAddress2: String {
        addressLine2 ?? ""
    }
    
    var contactCity: String {
        city ?? ""
    }
    
    var contactCounty: String {
        county ?? ""
    }
    
    var contactPostcode: String {
        postcode ?? ""
    }
    
    var contactEmail: String {
        email ?? ""
    }
    
    var contactDOB: Date? {
        dateOfBirth
    }
}
