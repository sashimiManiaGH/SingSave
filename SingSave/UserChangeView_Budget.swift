//
//  UserChangeVIew.swift
//  SingSave
//
//  Created by Leung Yin on 14/9/24.
//

import SwiftUI

struct UserChangeView_Budget: View {
    
    @State private var changeBudget = ""
    @State private var changeBudget_noLetters = false
    
    @Binding var monthlyUseGoal: Double
    @Binding var saveGoals: Double
    
    @Environment(\.dismiss) var dismiss
    
    func checkDouble(value: String, binding: Bool) {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "."))
        let doesNotContainForbiddenCharacters = value.rangeOfCharacter(from: allowedCharacters.inverted) == nil
        if doesNotContainForbiddenCharacters == true {
            changeBudget_noLetters = true
        } else {
            changeBudget = "Invalid Input"
        }
    }
    
    var body: some View {
        List {
            Text("Change Your Budget:")
                .bold()
            TextField("Type a valid number", text: $changeBudget)
            Button("Change Budget") {
                checkDouble(value: changeBudget, binding: changeBudget_noLetters)
                if changeBudget_noLetters == true {
                    monthlyUseGoal = Double(changeBudget)!
                }
                dismiss()
            }
        }
    }
}

struct UserChangeView_Save: View {
    
    @State private var changeSave = ""
    @State private var changeSave_noLetters = false
    
    @Binding var monthlyUseGoal: Double
    @Binding var saveGoals: Double
    
    @Environment(\.dismiss) var dismiss
    
    func checkDouble(value: String, binding: Bool) {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "."))
        let doesNotContainForbiddenCharacters = value.rangeOfCharacter(from: allowedCharacters.inverted) == nil
        if doesNotContainForbiddenCharacters == true {
            changeSave_noLetters = true
        } else {
            changeSave = "Invalid Input"
        }
    }
    
    var body: some View {
        List {
            Text("Change Your Budget:")
                .bold()
            TextField("Type a valid number", text: $changeSave)
            Button("Change Budget") {
                checkDouble(value: changeSave, binding: changeSave_noLetters)
                if changeSave_noLetters == true {
                    monthlyUseGoal = Double(changeSave)!
                }
                dismiss()
            }
        }
    }
}

#Preview {
    UserChangeView_Budget(monthlyUseGoal: .constant(100.0), saveGoals: .constant(100.0))
}
