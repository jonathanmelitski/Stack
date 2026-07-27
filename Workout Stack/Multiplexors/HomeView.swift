//
//  HomeView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import MessagesAppKit
import StackShared
import SwiftUI

struct HomeView: MessagesPresentationMultiplexableView {
    @EnvironmentObject private var session: MessagesSession
    @EnvironmentObject private var router: StackRouter

    var compact: some View {
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
                        router.page = .profile
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
                session.requestPresentationStyle(.expanded)

                withAnimation(.snappy(duration: 0.2)) {
                    router.page = .create
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
                        Text((session.isOneOnOne ?? false) ? "NEW WORKOUT" : "NEW GROUP WORKOUT")
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
    }
}
