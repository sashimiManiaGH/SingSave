//
//  StartingView.swift
//  SingSave
//
//  Created by Leung Yin on 14/9/24.
//

import SwiftUI

struct StartingView1: View {
    
    @Binding var persistUse: Bool
    @Binding var oldTime: Date
    @Binding var newTime: Date
    @Binding var userName: String
    @Binding var userEmail: String
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image(systemName: "rectangle.3.group.bubble.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.blue)
                VStack {
                    Text("Welcome!")
                        .bold()
                        .font(.largeTitle)
                    Text("to SingSave")
                        .font(.title)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                    }
                    .disabled(true)
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        StartingView2(persistUse: $persistUse,
                                      oldTime: $newTime,
                                      newTime: $oldTime,
                                      userName: $userName,
                                      userEmail: $userEmail)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(systemName: "arrow.right")
                            .bold()
                    }
                }
            }
        }
    }
}

struct StartingView2: View {
    
    @Binding var persistUse: Bool
    @Binding var oldTime: Date
    @Binding var newTime: Date
    @Binding var userName: String
    @Binding var userEmail: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image(systemName: "dollarsign.gauge.chart.lefthalf.righthalf")
                    .resizable()
                    .frame(width: 250, height: 200)
                    .foregroundStyle(.green)
                VStack {
                    Text("Track")
                        .bold()
                        .font(.largeTitle)
                    Text("Track How Much You Spend")
                        .font(.title)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        StartingView3(persistUse: $persistUse,
                                      oldTime: $newTime,
                                      newTime: $oldTime,
                                      userName: $userName,
                                      userEmail: $userEmail)
                        .navigationBarBackButtonHidden()
                    } label: {
                        Image(systemName: "arrow.right")
                            .bold()
                    }
                }
            }
        }
    }
}

struct StartingView3: View {
    
    @Binding var persistUse: Bool
    @Binding var oldTime: Date
    @Binding var newTime: Date
    @Binding var userName: String
    @Binding var userEmail: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image(systemName: "lock.circle.dotted")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.red)
                VStack {
                    Text("Secure")
                        .bold()
                        .font(.largeTitle)
                    Text("Your data is stored locally")
                        .font(.title)
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink {
                        StartingView4(persistUse: $persistUse,
                                      oldTime: $newTime,
                                      newTime: $oldTime,
                                      userName: $userName,
                                      userEmail: $userEmail)
                        .navigationBarBackButtonHidden()
                    } label: {
                        Image(systemName: "arrow.right")
                            .bold()
                    }
                }
            }
        }
    }
}

struct StartingView4: View {
    
    @Binding var persistUse: Bool
    @Binding var oldTime: Date
    @Binding var newTime: Date
    @Binding var userName: String
    @Binding var userEmail: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.cyan)
                VStack {
                    Text("Setting Up")
                        .bold()
                        .font(.largeTitle)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 330, height: 55)
                            .foregroundStyle(.gray)
                        TextField("Enter a username...", text: $userName)
                            .padding(.horizontal, 50)
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    if userName.isEmpty {
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Next")
                                    .bold()
                                Image(systemName: "arrow.right")
                                    .bold()
                            }
                        }
                        .disabled(true)
                    } else {
                        NavigationLink {
                            StartingView5(persistUse: $persistUse,
                                          oldTime: $newTime,
                                          newTime: $oldTime,
                                          userName: $userName,
                                          userEmail: $userEmail)
                            .navigationBarBackButtonHidden()
                        } label: {
                            HStack {
                                Text("Next")
                                    .bold()
                                Image(systemName: "arrow.right")
                                    .bold()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct StartingView5: View {
    
    @Binding var persistUse: Bool
    @Binding var oldTime: Date
    @Binding var newTime: Date
    @Binding var userName: String
    @Binding var userEmail: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(.cyan)
                VStack {
                    Text("Setting Up")
                        .bold()
                        .font(.largeTitle)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 330, height: 55)
                            .foregroundStyle(.gray)
                        TextField("Enter your email", text: $userEmail)
                            .padding(.horizontal, 50)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .keyboardType(.emailAddress)
                    }
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .bold()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    if userEmail.contains("@") {
                        Button {
                            persistUse = true
                            newTime = Date()
                        } label: {
                            HStack {
                                Text("Continue to app")
                                    .bold()
                                Image(systemName: "arrow.right")
                                    .bold()
                            }
                        }
                    } else {
                        Button {
                            persistUse = true
                        } label: {
                            HStack {
                                Text("Continue to app")
                                    .bold()
                                Image(systemName: "arrow.right")
                                    .bold()
                            }
                        }
                        .disabled(true)
                    }
                }
            }
        }
    }
}

#Preview {
    StartingView1(persistUse: .constant(false),
                  oldTime: .constant(Date()),
                  newTime: .constant(Date()),
                  userName: .constant("Test User"),
                  userEmail: .constant("test@icloud.com"))
}
