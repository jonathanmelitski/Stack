//
//  ProfileView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI
import StackShared

struct ProfileView: View {
    @EnvironmentObject var vm: WorkoutStackViewModel
    @State var profile: Profile = .init(color: Profile.colorOptions.first!, displayName: "J", uuid: nil)
    @State var editing: Bool = false
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
                if !editing {
                    ProfileIconView(profile: profile)
                        .frame(width: 50, height: 50)
                } else {
                    Button {
                        withAnimation (.snappy(duration: 0.2)) {
                            profile.color = Profile.colorOptions.randomElement()!
                        }
                    } label: {
                        Circle()
                            .fill(profile.color)
                            .overlay {
                                Image(systemName: "die.face.5")
                            }
                            .frame(width: 50, height: 50)
                    }
                }
                VStack (spacing: 2) {
                    Group {
                        if !editing {
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
                            self.editing = true
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
                            self.editing = false
                        }
                    }
                }
                
                
            }
            Spacer()
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
        .coordinateSpace(.named("profile-card"))
    }
}
