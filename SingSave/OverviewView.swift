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
    @Binding var saveLogs_total: Double
    @Binding var saveGoals: Double
    @Binding var monthlyUseGoal: Double
    @Binding var monthlyUsed: Double
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 350, height: 350)
                            .foregroundStyle(.gray)
                            .opacity(0.7)
                            .shadow(radius: 40)
                        ZStack {
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(
                                    AngularGradient(
                                        gradient: Gradient(colors: [Color.red, Color.purple]),
                                        center: .center,
                                        startAngle: .degrees(0),
                                        endAngle: .degrees(360)
                                    ),
                                    style: StrokeStyle(lineWidth: 30, lineCap: .round)
                                )
                        }
                        .frame(width: 270, height: 270)
                        VStack {
                            Text("Spent:")
                                .bold()
                                .font(.title)
                                .foregroundStyle(Gradient(colors: [.red, .purple]))
                            Text("$\(monthlyUsed, specifier: "%.2f")/")
                                .bold()
                                .font(.title)
                            Text("$\(monthlyUseGoal, specifier: "%.2f")")
                                .bold()
                                .font(.title)
                            
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 350, height: 150)
                            .foregroundStyle(.gray)
                            .opacity(0.7)
                            .shadow(radius: 40)
                        VStack {
                            HStack {
                                Text("Saved: $\(saveLogs_total, specifier: "%.2f")/$\(saveGoals, specifier: "%.2f")")
                                    .bold()
                                    .font(.title)
                                Spacer()
                            }
                            .padding(.horizontal, 45)
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: 330, height: 40)
                                    .foregroundStyle(.gray)
                                if saveLogs_total <= saveGoals {
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 330*(saveLogs_total/saveGoals), height: 40)
                                        .foregroundStyle(LinearGradient(
                                            colors: [.red, .purple],
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                } else {
                                    RoundedRectangle(cornerRadius: 25)
                                        .frame(width: 330, height: 40)
                                        .foregroundStyle(Gradient(colors: [.red, .purple]))
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Overview")
            }
        }
    }
}

#Preview {
    OverviewView(spendLogs_String: .constant([]),
                 spendLogs_Value: .constant([100.0]),
                 saveLogs_Value: .constant([100.0]),
                 saveLogs_total: .constant(50.0),
                 saveGoals: .constant(100.0),
                 monthlyUseGoal: .constant(1000.0),
                 monthlyUsed: .constant(100.0))
}
