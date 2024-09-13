//
//  SaveView_Add.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SaveView_Add: View {
    
    @Binding var saveLogs_Value: [Double]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SaveView_Add(saveLogs_Value: .constant([1.1]))
}
