//
//  CustomWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI
import WorkoutKit

struct CustomWorkoutView: View {
    let workout: CustomWorkout
    
    init(_ workout: CustomWorkout) {
        self.workout = workout
    }
    
    var body: some View {
        Text("custom workout")
    }
}
