//
//  UserView.swift
//  SingSave
//
//  Created by Leung Yin on 13/9/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.gray)
                        Text("")
                    }
                    HStack {
                        Text("")
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    UserView()
}
