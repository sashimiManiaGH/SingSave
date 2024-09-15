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
                monthlyUseGoal = Double(changeBudget) ?? 1000
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
                monthlyUseGoal = Double(changeSave) ?? 200
                dismiss()
            }
        }
    }
}

struct UserChangeView_Username_Email: View {
    
    @State private var changeName = ""
    @State private var changeEmail = ""
    
    @Binding var userName: String
    @Binding var userEmail: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        List {
            Text("Change Your Username & Email:")
                .bold()
            TextField("Type a valid username", text: $changeName)
            TextField("Type a valid email", text: $changeEmail)
            if changeEmail.contains("@") && changeName != "" {
                Button("Update Details") {
                    userName = changeName
                    userEmail = changeEmail
                    dismiss()
                }
            } else {
                Button("Update Details") {
                    userName = changeName
                    userEmail = changeEmail
                    dismiss()
                }
                .disabled(true)
            }
        }
        .onAppear() {
            changeName = userName
            changeEmail = userEmail
        }
    }
}

#Preview {
    UserChangeView_Budget(monthlyUseGoal: .constant(100.0), saveGoals: .constant(100.0))
}
