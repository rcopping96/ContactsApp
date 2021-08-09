//
//  ContactCellViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 04/08/2021.
//

import SwiftUI

struct ContactCellViewModel: View {
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
                
                Text("Rob Copping")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    //Add Call Functionality
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

struct ContactCellViewModel_Previews: PreviewProvider {
    static var previews: some View {
        ContactCellViewModel()
    }
}
