//
//  SaveView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SaveView_Add: View {
    
    @State var tempSaveValue = ""
    @State var tempDate = Date()
    
    @Binding var saveLogs_Value: [Double]
    @Binding var saveLogs_Date: [Date]
    @Binding var saveLogs_total: Double
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Text("New Savings Amount: ")
                    .bold()
                TextField("Type a valid value", text: $tempSaveValue)
                    .keyboardType(.decimalPad)
                DatePicker("", selection: $tempDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                Button("Add To Savings") {
                    saveLogs_Value.append(Double(tempSaveValue)!)
                    saveLogs_Date.append(tempDate)
                    saveLogs_total += Double(tempSaveValue)!
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SaveView_Add(saveLogs_Value: .constant([]),
                 saveLogs_Date: .constant([]),
                 saveLogs_total: .constant(100.0))
}
