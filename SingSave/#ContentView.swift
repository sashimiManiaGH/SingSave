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
    @Persistent("monthlyGoal") var monthlyUseGoal: Double = 1000
    @Persistent("monthlyUse") var monthlyUsed: Double = 0
    
    var body: some View {
        TabView {
            Tab("Overview", systemImage: "soccerball.inverse") {
                OverviewView()
            }
            Tab("Save", systemImage: "square.and.arrow.down") {
                SaveView()
            }
            Tab("Spend", systemImage: "dollarsign.gauge.chart.lefthalf.righthalf") {
                SpendView()
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
