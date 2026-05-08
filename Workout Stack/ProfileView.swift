//
//  ProfileView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var vm = WorkoutStackViewModel.shared
    @State var profile: Profile = .init(color: Profile.colorOptions.first!, displayName: "J", uuid: nil)
    @State var editingName: Bool = false
    @FocusState var textFieldFocused: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button {
                        withAnimation(.snappy(duration: 0.2)) {
                            self.vm.page = .home
                        }
                    } label: {
                        HStack(spacing: 2) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 8))
                            Text("Back")
                                .font(.custom("SF Pro", size: 16, relativeTo: .caption))
                        }
                    }
                    .foregroundStyle(.accent)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("MY PROFILE")
                        .font(.custom("Anton-Regular", fixedSize: 20))
                        .bold()
                    Spacer()
                }
            }
            VStack {
                ProfileIconView(profile: profile)
                    .frame(width: 50, height: 50)
                VStack (spacing: 2) {
                    Group {
                        if !editingName {
                            Text(profile.displayName.uppercased())
                                
                        } else {
                            TextField("Profile Name", text: $profile.displayName, prompt: Text("DISPLAY NAME"))
                                .textFieldStyle(.plain)
                                .textCase(.uppercase)
                                .textInputAutocapitalization(.characters)
                                .focused($textFieldFocused)
                                .onChange(of: profile.displayName) {
                                    if profile.displayName.count > Profile.maxNameLength {
                                        profile.displayName = String(profile.displayName.prefix(Profile.maxNameLength))
                                    }
                                }
                        }
                    }
                    .font(.custom("Anton-Regular", size: 24, relativeTo: .title))
                    .multilineTextAlignment(.center)
                    
                    Button {
                        withAnimation(.snappy(duration: 0.2)) {
                            self.editingName = true
                            self.textFieldFocused = true
                        }
                    } label: {
                        Label("Edit", systemImage: "pencil")
                            .font(.custom("SF Pro", size: 12, relativeTo: .caption2))
                    }
                    .buttonStyle(.plain)
                }
                .onChange(of: textFieldFocused) {
                    if !textFieldFocused {
                        withAnimation(.snappy(duration: 0.2)) {
                            self.editingName = false
                        }
                    }
                }
                
                
            }
            Spacer()
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
    }
}
