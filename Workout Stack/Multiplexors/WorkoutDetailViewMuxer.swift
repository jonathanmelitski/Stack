//
//  WorkoutDetailViewMuxer.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import MessagesAppKit
import StackShared
import SwiftUI

struct WorkoutDetailViewMuxer: MessagesPresentationMultiplexableView {
    @EnvironmentObject private var session: MessagesSession

    let workout: StackWorkout

    var compact: some View {
        Text(workout.title)
    }

    var expanded: some View {
        WorkoutDetailView(workout: workout) {
            session.dismiss()
        }
        .padding()
    }

    var transcript: some View {
        WorkoutLiveTemplate(workout: workout)
            .onTapGesture {
                session.requestPresentationStyle(.expanded)
            }
    }
}
