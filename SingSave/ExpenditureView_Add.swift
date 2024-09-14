//
//  SpendView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct ExpenditureView_Add: View {
    
    @State var tempSpendText = ""
    @State var tempSpendValue = 1.0
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
                    HStack {
                        Text("Spend Amount: ")
                            .bold()
                        Text("$\(tempSpendValue, specifier: "%.2f")")
                        Spacer()
                    }
                    Slider(value: $tempSpendValue, in: 1...400, step: 0.1)
                }
                DatePicker("", selection: $tempDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            Button {
                spendLogs_Value.append(tempSpendValue)
                spendLogs_Date.append(tempDate)
                spendLogs_String.append(tempSpendText)
                monthlyUsed += tempSpendValue
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 360, height: 70)
                        .foregroundStyle(.blue)
                    Text("Add To Expenditures +")
                        .bold()
                        .foregroundStyle(.white)
                        .font(.title)
                }
                .padding()
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
