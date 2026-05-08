//
//  WorkoutBuilderViewModel.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import SwiftUI
import WorkoutKit
import HealthKit
import Combine

class WorkoutBuilderViewModel: ObservableObject {
    @Published var plan: WorkoutPlan?
    
    func beginBuildingWorkout(with workout: WorkoutPlan.Workout) {
        self.plan = .init(workout)
    }
    
    
}
