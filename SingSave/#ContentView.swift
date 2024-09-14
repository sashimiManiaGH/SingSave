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
    @Persistent("saveLogs_Value") var saveLogs_Value: [Double] = []
    @Persistent("saveLogs_total") var saveLogs_Total: Double = 0
    @Persistent("saveGoals") var saveGoals: Double = 200
    @Persistent("monthlyGoal") var monthlyUseGoal: Double = 1000
    @Persistent("monthlyUse") var monthlyUsed: Double = 0
    
    var body: some View {
        TabView {
            Tab("Overview", systemImage: "soccerball.inverse") {
                OverviewView(spendLogs_String: $spendLogs_String,
                             spendLogs_Value: $spendLogs_Value,
                             saveLogs_Value: $saveLogs_Value,
                             saveLogs_total: $saveLogs_Total,
                             saveGoals: $saveGoals,
                             monthlyUseGoal: $monthlyUseGoal,
                             monthlyUsed: $monthlyUsed)
            }
            Tab("Save", systemImage: "square.and.arrow.down") {
                SaveView(saveLogs_Value: $saveLogs_Value,
                         saveLogs_total: $saveLogs_Total,
                         saveGoals: $saveGoals)
            }
            Tab("Spend", systemImage: "dollarsign.gauge.chart.lefthalf.righthalf") {
                SpendView(spendLogs_String: $spendLogs_String,
                          spendLogs_Value: $spendLogs_Value)
            }
            Tab("User", systemImage: "person.crop.circle") {
                UserView()
            }
        }
    }
}

#Preview {
    ContentView()
}
