//
//  WorkoutDetailViewMuxer.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import StackShared
import SwiftUI
import Messages

struct WorkoutDetailViewMuxer: MessagesPresentationMultiplexableView {
    @EnvironmentObject var vm: WorkoutStackViewModel
    let style: MSMessagesAppPresentationStyle
    let workout: StackWorkout
    
    var compact: some View {
        Text(workout.name ?? "empty name")
    }
    
    var expanded: some View {
        WorkoutDetailView(workout: workout)
            .environmentObject(vm)
            .padding()
    }
    
    var transcript: some View {
        WorkoutLiveTemplate(workout: workout)
            .onTapGesture {
                vm.requestStyle(.expanded)
            }
    }
}
