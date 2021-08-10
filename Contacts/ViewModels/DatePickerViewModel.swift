//
//  DatePickerViewModel.swift
//  Contacts
//
//  Created by Rob Copping on 10/08/2021.
//

import Foundation
import SwiftUI

struct DatePickerViewModel: UIViewRepresentable {
    
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    public var placeholder: String
    @Binding var date: Date?
    
    func makeUIView(context: Context) -> some UITextField {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self.helper,
                                  action: #selector(self.helper.dateValueChanged),
                                  for: .valueChanged)
        self.textField.placeholder = self.placeholder
        self.textField.inputView = self.datePicker
        
        //Accessory bar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .plain,
                                         target: self.helper,
                                         action: #selector(self.helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar
        
        
        
        self.helper.dateChanged = {
            self.date = self.datePicker.date
        }
        self.helper.doneButtonTapped = {
            if self.date == nil {
                self.date = self.datePicker.date
            }
            self.textField.resignFirstResponder()
        }
        
        return self.textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedDate = self.date {
            uiView.text = self.dateFormatter.string(from: selectedDate)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            self.dateChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    
    class Coordinator {
        
    }
}
