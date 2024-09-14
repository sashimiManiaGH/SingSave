//
//  SpendView .swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct ExpenditureView: View {
    
    @State private var showAddSheet = false
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    @Binding var spendLogs_Date: [Date]
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
                            .trim(from: 0, to: 100)
                            .stroke(
                                Color.gray,
                                style: StrokeStyle(
                                    lineWidth: 45,
                                    lineCap: .round
                                )
                            )   .rotationEffect(.degrees(0))
                            .animation(.easeOut, value: monthlyUsed/monthlyUseGoal)
                        Circle()
                            .trim(from: 0, to: monthlyUsed/monthlyUseGoal)
                            .stroke(
                                Gradient(colors: [.red, .purple]),
                                style: StrokeStyle(
                                    lineWidth: 45,
                                    lineCap: .round
                                )
                            )   .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: monthlyUsed/monthlyUseGoal)
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
                if spendLogs_String == [] {
                    List {
                        Text("No expenditures yet!")
                    }
                } else {
                    List(spendLogs_String, id: \.self) { log in
                        VStack {
                            HStack {
                                Text("Expenditure: ")
                                    .bold()
                                Text(log)
                                Spacer()
                            }
                            HStack {
                                Text("Amount: ")
                                    .bold()
                                Text("$\(spendLogs_Value[spendLogs_String.firstIndex(of: log)!], specifier: "%.2f")")
                                Spacer()
                            }
                            HStack {
                                Text("Date: ")
                                    .bold()
                                Text("\(spendLogs_Date[spendLogs_String.firstIndex(of: log)!].formatted(date: .complete, time: .omitted))")
                                Spacer()
                            }
                        }
                        .swipeActions {
                            Button {
                                monthlyUsed -= spendLogs_Value[spendLogs_String.firstIndex(of: log)!]
                                spendLogs_Value.remove(at: spendLogs_String.firstIndex(of: log)!)
                                spendLogs_Date.remove(at: spendLogs_String.firstIndex(of: log)!)
                                spendLogs_String.remove(at: spendLogs_String.firstIndex(of: log)!)
                            } label: {
                                Image(systemName: "trash")
                                    .tint(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Expenditures")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                ExpenditureView_Add(spendLogs_String: $spendLogs_String,
                                    spendLogs_Value: $spendLogs_Value,
                                    spendLogs_Date: $spendLogs_Date,
                                    monthlyUsed: $monthlyUsed)
                .presentationDetents([.height(600), .large])
            }
        }
    }
}

#Preview {
    ExpenditureView(spendLogs_String: .constant([]),
                    spendLogs_Value: .constant([]),
                    spendLogs_Date: .constant([]),
                    monthlyUseGoal: .constant(1000.0),
                    monthlyUsed: .constant(300.0))
}
