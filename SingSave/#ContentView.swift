//
//  ContentView.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI
import SwiftPersistence

struct ContentView: View {
    
    @Persistent("spendLogs_String") var spendLogs_String: [String] = []
    @Persistent("spendLogs_Value") var spendLogs_Value: [Double] = []
    @Persistent("spendLogs_Date") var spendLogs_Date: [Date] = []
    
    @Persistent("saveLogs_Value") var saveLogs_Value: [Double] = []
    @Persistent("saveLogs_Date") var saveLogs_Date: [Date] = []
    @Persistent("saveLogs_total") var saveLogs_Total: Double = 0
    @Persistent("saveGoals") var saveGoals: Double = 200
    
    @Persistent("monthlyGoal") var monthlyUseGoal: Double = 1000
    @Persistent("monthlyUse") var monthlyUsed: Double = 0
    
    @AppStorage("signinPersist") var persistUse = false
    @AppStorage("user_name") var userName = ""
    @AppStorage("user_email") var userEmail = ""
    
    @AppStorage("old_timestamp") var oldTimeStamp = Date()
    @AppStorage("new_timestamp") var newTimeStamp = Date()
    
    var body: some View {
        if persistUse == false {
            StartingView1(persistUse: $persistUse,
                          oldTime: $newTimeStamp,
                          newTime: $oldTimeStamp,
                          userName: $userName,
                          userEmail: $userEmail)
        } else {
            TabView {
                Tab("Overview", systemImage: "soccerball.inverse") {
                    OverviewView(spendLogs_String: $spendLogs_String,
                                 spendLogs_Value: $spendLogs_Value,
                                 spendLogs_Date: $spendLogs_Date,
                                 saveLogs_Value: $saveLogs_Value,
                                 saveLogs_total: $saveLogs_Total,
                                 saveLogs_Date: $saveLogs_Date,
                                 saveGoals: $saveGoals,
                                 monthlyUseGoal: $monthlyUseGoal,
                                 monthlyUsed: $monthlyUsed,
                                 persistUse: $persistUse,
                                 userName: $userName,
                                 userEmail: $userEmail)
                }
                Tab("Save", systemImage: "square.and.arrow.down") {
                    SaveView(saveLogs_Value: $saveLogs_Value,
                             saveLogs_Date: $saveLogs_Date,
                             saveLogs_total: $saveLogs_Total,
                             saveGoals: $saveGoals)
                }
                Tab("Expenditures", systemImage: "dollarsign.gauge.chart.lefthalf.righthalf") {
                    ExpenditureView(spendLogs_String: $spendLogs_String,
                                    spendLogs_Value: $spendLogs_Value,
                                    spendLogs_Date: $spendLogs_Date,
                                    monthlyUseGoal: $monthlyUseGoal,
                                    monthlyUsed: $monthlyUsed)
                }
            }
            .onAppear() {
                oldTimeStamp = newTimeStamp
                newTimeStamp = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "M"
                if dateFormatter.string(from: newTimeStamp) != dateFormatter.string(from: oldTimeStamp) {
                    saveLogs_Total = 0
                    monthlyUsed = 0
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
