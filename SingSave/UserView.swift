//
//  UserView.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct UserView: View {
    
    @State private var alertShow = false
    @State private var changeMonthGoalSheetShow = false
    @State private var changeSaveGoalSheetShow = false
    @State private var changeUserGoalSheetShow = false
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    @Binding var spendLogs_Date: [Date]
    @Binding var saveLogs_Value: [Double]
    @Binding var saveLogs_Date: [Date]
    @Binding var saveLogs_total: Double
    @Binding var saveGoals: Double
    @Binding var monthlyUseGoal: Double
    @Binding var monthlyUsed: Double
    
    @Binding var persistUse: Bool
    @Binding var userName: String
    @Binding var userEmail: String
    
    func initials(from string: String) -> String {
        let words = string.components(separatedBy: .whitespacesAndNewlines)
        return words.map { $0.prefix(1).uppercased() }.joined(separator: "")
    }
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.gray)
                        //                        Text("\(userName.prefix(2).uppercased())")
                        //                            .bold()
                        //                            .font(.largeTitle)
                        //                            .foregroundStyle(.white)
                        let initials = initials(from: userName)
                        Text("\(initials)")
                            .bold()
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    VStack {
                        HStack {
                            Text(userName)
                                .bold()
                                .font(.title2)
                                .padding(.horizontal)
                            Spacer()
                        }
                        HStack {
                            Text(userEmail.lowercased())
                                .font(.title3)
                                .padding(.horizontal)
                            Spacer()
                        }
                    }
                    Spacer()
                    Button {
                        changeUserGoalSheetShow = true
                    } label: {
                        Image(systemName: "pencil")
                    }
                }
                Section {
                    VStack {
                        HStack {
                            Text("Monthly Use Budget: $\(monthlyUseGoal, specifier: "%.2f")")
                                .bold()
                            Spacer()
                            Button {
                                changeMonthGoalSheetShow = true
                            } label: {
                                Image(systemName: "pencil")
                            }
                        }
                        //                        Stepper("", value: $monthlyUseGoal, in: 1...10000, step: 1)
                    }
                    VStack {
                        HStack {
                            Text("Monthly Savings Goal: $\(saveGoals, specifier: "%.2f")")
                                .bold()
                            Spacer()
                            Button {
                                changeSaveGoalSheetShow = true
                            } label: {
                                Image(systemName: "pencil")
                            }
                        }
                        //                        Stepper("", value: $saveGoals, in: 1...10000, step: 1)
                    }
                }
                Section {
                    Button(role: .destructive) {
                        alertShow = true
                    } label: {
                        Text("Delete All App Data")
                    }
                }
                .alert("Are you sure you want to delete all app data?", isPresented: $alertShow) {
                    Button("Cancel", role: .cancel) {
                        
                    }
                    Button("Delete", role: .destructive) {
                        spendLogs_String = []
                        spendLogs_Date = []
                        spendLogs_Value = []
                        saveGoals = 100.0
                        saveLogs_Date = []
                        saveLogs_total = 0.0
                        saveLogs_Value = []
                        monthlyUseGoal = 1000.0
                        monthlyUsed = 0.0
                        userName = ""
                        userEmail = ""
                        persistUse = false
                    }
                }
            }
            .sheet(isPresented: $changeMonthGoalSheetShow) {
                UserChangeView_Budget(monthlyUseGoal: $monthlyUseGoal, saveGoals: $saveGoals)
            }
            .sheet(isPresented: $changeSaveGoalSheetShow) {
                UserChangeView_Save(monthlyUseGoal: $monthlyUseGoal, saveGoals: $saveGoals)
            }
            .sheet(isPresented: $changeUserGoalSheetShow) {
                UserChangeView_Username_Email(userName: $userName, userEmail: $userEmail)
            }
        }
    }
}

#Preview {
    UserView(spendLogs_String: .constant([]),
             spendLogs_Value: .constant([100.0]),
             spendLogs_Date: .constant([]),
             saveLogs_Value: .constant([100.0]),
             saveLogs_Date: .constant([]),
             saveLogs_total: .constant(50.0),
             saveGoals: .constant(100.0),
             monthlyUseGoal: .constant(1000.0),
             monthlyUsed: .constant(100.0),
             persistUse: .constant(true),
             userName: .constant("Test User"),
             userEmail: .constant("test@icloud.com"))
}
