//
//  DialPadViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 09/08/2021.
//

import SwiftUI

struct DialPadViewModel: View {
    @State var showError: Bool = false
    @State var errorString: String = ""
    @State var phoneNumber: [String] = []
    var callManager = CallManager()
    
    var body: some View {
        VStack {
            Spacer()
            HStack(){
                ForEach(phoneNumber, id: \.self) { i in
                    Text(i)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.horizontal, -5)
                }
            }
            .padding(.vertical)
            
            if phoneNumber != [] {
                Button(action: {
                    //Add contact
                }, label: {
                    Text("Add Contact")
                })
            }
            
            if showError {
                Text(errorString)
                    .font(.title3)
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            NumberPad(phoneNumber: $phoneNumber, showError: $showError, errorString: $errorString)
            
            Button(action: {
                //Start Call
                callManager.startCall(handle: phoneNumber.joined())
            }, label: {
                Image(systemName: "phone.circle.fill")
                    .resizable()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.green)
                    .padding(.vertical)
            })
            
            Spacer()
        }
    }
}

struct DialPadViewModel_Previews: PreviewProvider {
    static var previews: some View {
        DialPadViewModel()
    }
}

//Dial Pad

struct NumberPad: View {
    @Binding var phoneNumber : [String]
    @Binding var showError: Bool
    @Binding var errorString: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(rowData) { i in
                HStack(spacing: CGFloat(UIScreen.main.bounds.width / 10)) {
                    ForEach(i.row) { j in
                        Button(action: {
                            // fill out phone number
                            if j.value == "delete.left.fill" {
                                if phoneNumber.count > 0 {
                                    self.phoneNumber.removeLast()
                                }
                            } else if j.value == "" {
                                // Do nothing
                            } else {
                                if phoneNumber.count < 16 {
                                self.phoneNumber.append(j.value)
                                } else {
                                    errorString = "Phone number has too many digits"
                                    showError = true
                                }
                            }}, label: {
                                if j.value == "delete.left.fill" {
                                    Image(systemName: j.value)
                                        .font(.title)
                                        .foregroundColor(.primary)
                                        .padding(.vertical)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.primary)
                                        .clipShape(Circle())
                                } else if j.value == "" {
                                    Text(j.value)
                                        .font(.body)
                                        .foregroundColor(.primary)
                                        .background(Color.gray.opacity(0.8))
                                        .padding(.vertical)
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                } else {
                                    Text(j.value)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .padding(.vertical)
                                        .frame(width: 75, height: 75)
                                        .foregroundColor(.primary)
                                        .background(Color.gray.opacity(0.8))
                                        .clipShape(Circle())
                                }
                        })
                    }
                }
            }
        }
    }
}


// Row data

struct type: Identifiable {
    var id: Int
    var row: [row]
}

struct row: Identifiable {
    var id: Int
    var value: String
}

var rowData = [
    type(id: 0, row: [row(id: 0, value: "1"), row(id: 1, value: "2"), row(id: 2, value: "3")]),
    type(id: 1, row: [row(id: 0, value: "4"), row(id: 1, value: "5"), row(id: 2, value: "6")]),
    type(id: 2, row: [row(id: 0, value: "7"), row(id: 1, value: "8"), row(id: 2, value: "9")]),
    type(id: 3, row: [row(id: 0, value: ""),row(id: 1, value: "0"), row(id: 2, value: "delete.left.fill")]),
]
