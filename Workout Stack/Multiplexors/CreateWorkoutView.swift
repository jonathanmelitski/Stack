//
//  CreateWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import HealthKit
import MessagesAppKit
import StackShared
import SwiftUI

struct CreateWorkoutView: MessagesPresentationMultiplexableView {
    @EnvironmentObject private var session: MessagesSession
    @EnvironmentObject private var router: StackRouter

    @StateObject var builderViewModel = WorkoutBuilderViewModel()
    @State var readyToShare: Bool = false
    @State var selectedActivity: HKWorkoutActivityType?
    @State var expandedActivities: Bool = false

    var expanded: some View {
        VStack {
            bodyHeader
            Grid {
                // group by 2, small tiles as a dropdown when click on the thing
                GridRow {

                }
            }
        }
        .onAppear {
            self.readyToShare = false
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)
    }

    var compact: some View {
        Group {
            if !readyToShare {
                VStack {
                    bodyHeader
                    Text("collapsed version")
                    Spacer()
                }

            } else {
                VStack {
                    Text("workout-specific header view")
                    Text("date selection panel")
                    Button("make some modification") {
                        var workout = StackWorkout.sample
                        workout.deadline = Date.now
                        Task {
                            try? await session.insert(workout: workout)
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding([.horizontal, .bottom])
        .foregroundStyle(.white)

    }

    @ViewBuilder var bodyHeader: some View {
        ZStack {
            HStack {
                Button {
                    session.restoreUserPreferredStyle()
                    withAnimation(.snappy(duration: 0.2)) {
                        router.page = .home
                    }
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
                .foregroundStyle(.accent)
                Spacer()
                Button {
                    session.requestPresentationStyle(.compact)
                    session.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
                .buttonStyle(.plain)

            }
            HStack {
                Spacer()
                Text("NEW WORKOUT")
                    .font(.custom("Anton-Regular", fixedSize: 20))
                    .bold()
                Spacer()
            }
        }
        .foregroundStyle(.white)
    }
}
