//
//  OverviewView.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct OverviewView: View {
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    @Binding var saveLogs_Value: [Double]
    @Binding var monthlyUseGoal: Double
    @Binding var monthlyUsed: Double
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 350, height: 350)
                        .foregroundStyle(.gray)
                        .opacity(0.7)
                        .shadow(radius: 40)
                }
            }
            .navigationTitle("Overview")
        }
    }
}

#Preview {
    OverviewView(spendLogs_String: .constant([""]),
                 spendLogs_Value: .constant([1.1]),
                 saveLogs_Value: .constant([1.1]),
                 monthlyUseGoal: .constant(1.1),
                 monthlyUsed: .constant(1.1))
}
