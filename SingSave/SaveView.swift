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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SaveView(saveLogs_Value: .constant([100.0]),
             saveLogs_total: .constant(100.0))
}
