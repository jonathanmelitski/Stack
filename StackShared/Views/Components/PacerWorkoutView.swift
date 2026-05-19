//
//  PacerWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI
import WorkoutKit

struct PacerWorkoutView: View {
    let workout: PacerWorkout
    
    init(_ workout: PacerWorkout) {
        self.workout = workout
    }
    
    var body: some View {
        Text("pacer workout")
    }
}
