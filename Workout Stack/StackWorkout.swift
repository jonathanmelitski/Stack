//
//  StackWorkout.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import WorkoutKit
import Foundation

struct StackWorkout: Codable {
    let plan: WorkoutPlan
    let deadline: Date
    let name: String?
    
    let completions: [StackWorkoutCompletionEntry]
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let workoutRaw = try container.decode(Data.self, forKey: .plan)
        self.plan = try WorkoutPlan(from: workoutRaw)
        self.deadline = try container.decode(Date.self, forKey: .deadline)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.completions = try container.decode([StackWorkoutCompletionEntry].self, forKey: .completions)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let raw = try self.plan.dataRepresentation
        try container.encode(raw, forKey: .plan)
        try container.encode(deadline, forKey: .deadline)
        try container.encode(completions, forKey: .completions)
        try container.encodeIfPresent(name, forKey: .name)
    }
    
    enum CodingKeys: String, CodingKey {
        case plan, deadline, completions, name
    }
}

struct StackWorkoutCompletionEntry: Codable {
    let displayName: String
    let uuid: UUID // This might be buggy
    let completedAt: Date
    // Will want to add more in-depth reporting but this is fine for now
}
