//
//  UserChangeVIew.swift
//  SingSave
//
//  Created by Leung Yin on 14/9/24.
//

import SwiftUI

struct UserChangeView_Budget: View {
    
    @State private var changeBudget = ""
    
    @Binding var monthlyUseGoal: Double
    @Binding var saveGoals: Double
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Text("Change Your Budget:")
                .bold()
            TextField("Type a valid number", text: $changeBudget)
                .keyboardType(.decimalPad)
            Button("Change Budget") {
                monthlyUseGoal = Double(changeBudget) ?? 0
                dismiss()
            }
        }
    }
}

struct UserChangeView_Save: View {
    
    @State private var changeSave = ""
    
    @Binding var monthlyUseGoal: Double
    @Binding var saveGoals: Double
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Text("Change Your Budget:")
                .bold()
            TextField("Type a valid number", text: $changeSave)
                .keyboardType(.decimalPad)
            Button("Change Budget") {
                monthlyUseGoal = Double(changeSave) ?? 0
                dismiss()
            }
        }
    }
}

#Preview {
    UserChangeView_Budget(monthlyUseGoal: .constant(100.0), saveGoals: .constant(100.0))
}
