//
//  SpendView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct ExpenditureView_Add: View {
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExpenditureView_Add(spendLogs_String: .constant([]),
                  spendLogs_Value: .constant([100.0]))
}
