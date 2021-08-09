//
//  ContactCellView.swift
//  Contacts
//
//  Created by Rob Copping on 09/08/2021.
//

import SwiftUI

struct ContactCellView: View {
    var contact: Contact
    
    var callManager = CallManager()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15, style: .circular)
                .frame(height: UIScreen.main.bounds.height / 12)
                .foregroundColor(.black.opacity(0.05))
                .padding(.horizontal, 10)
            HStack {
                Image(systemName: "person")
                    .font(.title)
                    .frame(width: 50, height: 50)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(Circle())
                
                Text("\(contact.contactFirstName) \(contact.contactLastName)")
                    .font(.title3)
                    .fontWeight(.semibold)
                
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
            .padding(.horizontal)
        }
    }
}


struct ContactCellView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCellView(contact: exampleContacts[0])
    }
}
