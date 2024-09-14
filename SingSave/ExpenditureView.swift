//
//  SpendView .swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct ExpenditureView: View {
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
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
                
            }
            .navigationTitle("Expenditures")
        }
    }
}

#Preview {
    ExpenditureView(spendLogs_String: .constant([]),
              spendLogs_Value: .constant([100.0]),
              monthlyUseGoal: .constant(1000.0),
              monthlyUsed: .constant(300.0))
}
