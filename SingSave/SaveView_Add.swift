//
//  SaveView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SaveView_Add: View {
    
    @Binding var saveLogs_Value: [Double]
    @Binding var saveLogs_Date: [Date]
    @Binding var saveLogs_total: Double
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SaveView_Add(saveLogs_Value: .constant([]),
                 saveLogs_Date: .constant([]),
                 saveLogs_total: .constant(100.0))
}
