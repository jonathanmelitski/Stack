//
//  HomeView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI
import Messages
import StackShared

struct HomeView: MessagesPresentationMultiplexableView {
    let style: MSMessagesAppPresentationStyle
    
    @EnvironmentObject var vm: WorkoutStackViewModel
    
    var compact: some View {
        defaultBody()
    }
    
    var expanded: some View {
        defaultBody()
    }
    
    var transcript: some View {
        defaultBody()
    }
    
    @ViewBuilder func defaultBody() -> some View {
        VStack {
            HStack {
                VStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.accent)
                        .frame(height: 4)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.gray)
                        .frame(height: 4)
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.accent.mix(with: .black, by: 0.5))
                        .frame(height: 4)
                    
                }
                .frame(width: 20, height: 16)
                .padding(4)
                Text("STACK")
                    .font(.custom("Anton-Regular", fixedSize: 20))
                    .bold()
                    
                Spacer()
                Button {
                    withAnimation(.snappy(duration: 0.2)) {
                        self.vm.page = .profile
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text("Profile")
                        Image(systemName: "chevron.right")
                            .font(.system(size: 8))
                        
                    }
                    .font(.custom("SF Pro", size: 16, relativeTo: .caption))
                    .padding(.horizontal)
                }
                .buttonStyle(.plain)
                
            }
            Button {
                self.vm.requestStyle(.expanded)
                
                withAnimation(.snappy(duration: 0.2)) {
                    self.vm.page = .create
                }
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .fontWeight(.light)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.ultraThinMaterial)
                        }
                    VStack(alignment: .leading, spacing: 0) {
                        Text((vm.isSinglePersonGroup ?? false) ? "NEW WORKOUT" : "NEW GROUP WORKOUT")
                            .font(.custom("Anton-Regular", size: 24, relativeTo: .title))
                            .bold()
                        Text("Send a challenge to the chat")
                            .font(.custom("SF Pro", size: 16, relativeTo: .body))
                        
                    }
                    .multilineTextAlignment(.leading)
                    .lineSpacing(0)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.accent)
                }
            }
            .buttonStyle(.plain)
            Spacer()
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
        .environmentObject(vm)
    }
}
