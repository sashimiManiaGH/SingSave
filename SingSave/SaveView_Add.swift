//
//  SaveView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SaveView_Add: View {
    
    @State var tempSaveValue = 1.0
    @State var tempDate = Date()
    
    @Binding var saveLogs_Value: [Double]
    @Binding var saveLogs_Date: [Date]
    @Binding var saveLogs_total: Double
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                VStack {
                    HStack {
                        Text("Save Amount: ")
                            .bold()
                        Text("$\(tempSaveValue, specifier: "%.2f")")
                        Spacer()
                    }
                    Slider(value: $tempSaveValue, in: 1...400, step: 0.1)
                }
                DatePicker("", selection: $tempDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            Button {
                saveLogs_Value.append(tempSaveValue)
                saveLogs_Date.append(tempDate)
                saveLogs_total += tempSaveValue
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 360, height: 70)
                        .foregroundStyle(.blue)
                    Text("Add To Savings +")
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
    SaveView_Add(saveLogs_Value: .constant([]),
                 saveLogs_Date: .constant([]),
                 saveLogs_total: .constant(100.0))
}
