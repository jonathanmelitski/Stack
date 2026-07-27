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

public class WorkoutBuilderViewModel: ObservableObject {
    @Published public var phase: WorkoutBuilderPhase = .initial
    @Published public var plan: WorkoutPlan? = nil
    
    public init() {}
    
    public func beginBuildingWorkout(with plan: WorkoutPlan) {
        self.phase = .developing
        self.plan = plan
    }
}

public extension WorkoutBuilderViewModel {
    static let sortedActivityTypeOptions: [HKWorkoutActivityType] = HKWorkoutActivityType.allCases.filter({ $0.stackVisibility != .hidden }).sorted(by: { $0.stackVisibility < $1.stackVisibility })
}

public enum WorkoutBuilderPhase {
    case initial
    case developing
    case finalizing
    case done
}
