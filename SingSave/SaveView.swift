//
//  SaveView.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SaveView: View {
    
    @Binding var saveLogs_Value: [Double]
    @Binding var saveLogs_total: Double
    @Binding var saveGoals: Double
    
    var body: some View {
        NavigationStack {
            VStack {
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
            }
            .navigationTitle("Savings")
        }
    }
}

#Preview {
    SaveView(saveLogs_Value: .constant([100.0]),
             saveLogs_total: .constant(100.0),
             saveGoals: .constant(200.0))
}
