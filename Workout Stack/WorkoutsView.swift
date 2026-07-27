//
//  WorkoutsView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import MessagesAppKit
import StackShared
import SwiftUI

struct WorkoutsView: MessagesRootView {
    @EnvironmentObject private var session: MessagesSession
    @StateObject private var router = StackRouter()

    init() {}

    var body: some View {
        Group {
            if let workout = session.stackWorkout {
                WorkoutDetailViewMuxer(workout: workout)
            } else {
                switch router.page {
                case .home:
                    HomeView()
                case .create:
                    CreateWorkoutView()
                case .profile:
                    ProfileView()
                @unknown default:
                    HomeView()
                }
            }
        }
        .environmentObject(router)
    }
}
