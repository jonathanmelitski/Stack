//
//  WorkoutSummarySubview.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/15/26.
//

import SwiftUI
import WorkoutKit

struct WorkoutSummarySubview: View {
    let workout: StackWorkout
    
    var body: some View {
        workout.plan.workout.stackDetailView
            .inExpandingRectangle()
    }
}

public extension WorkoutPlan.Workout {
    
    @ViewBuilder var stackDetailView: some View {
        switch self {
        case .goal(let singleGoalWorkout):
            SingleGoalWorkoutView(singleGoalWorkout)
        case .custom(let customWorkout):
            CustomWorkoutView(customWorkout)
        case .pacer(let pacerWorkout):
            PacerWorkoutView(pacerWorkout)
        case .swimBikeRun(let swimBikeRunWorkout):
            SwimBikeRunWorkoutView(swimBikeRunWorkout)
        @unknown default:
            fatalError()
        }
    }
}
