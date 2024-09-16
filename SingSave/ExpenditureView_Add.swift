//
//  SpendView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct ExpenditureView_Add: View {
    
    @State var tempSpendText = ""
    @State var tempSpendValue = ""
    @State var tempDate = Date()
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    @Binding var spendLogs_Date: [Date]
    
    @Binding var monthlyUsed: Double
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                TextField("Enter Expenditure", text: $tempSpendText)
                VStack {
                    Text("Spend Amount: ")
                        .bold()
                    TextField("Type a valid value", text: $tempSpendValue)
                        .keyboardType(.decimalPad)
                }
                DatePicker("", selection: $tempDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                Button("Add To Expenditures") {
                    spendLogs_Value.append(Double(tempSpendValue)!)
                    spendLogs_Date.append(tempDate)
                    spendLogs_String.append(tempSpendText)
                    monthlyUsed += Double(tempSpendValue)!
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    ExpenditureView_Add(spendLogs_String: .constant([]),
                        spendLogs_Value: .constant([100.0]),
                        spendLogs_Date: .constant([]),
                        monthlyUsed: .constant(100.0))
}
