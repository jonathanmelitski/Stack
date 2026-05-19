//
//  SwimBikeRunWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI
import WorkoutKit

struct SwimBikeRunWorkoutView: View {
    let workout: SwimBikeRunWorkout
    
    init(_ workout: SwimBikeRunWorkout) {
        self.workout = workout
    }
    
    var body: some View {
        Text("sbr workout")
    }
}
