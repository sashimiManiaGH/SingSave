//
//  SpendView .swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct SpendView: View {
    
    @Binding var spendLogs_String: [String]
    @Binding var spendLogs_Value: [Double]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SpendView(spendLogs_String: .constant([]),
              spendLogs_Value: .constant([100.0]))
}
