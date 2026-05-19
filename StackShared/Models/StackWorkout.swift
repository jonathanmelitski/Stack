//
//  StackWorkout.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import WorkoutKit
import HealthKit
import Foundation

public struct StackWorkout: Codable {
    public var plan: WorkoutPlan
    public var deadline: Date
    public var name: String?
    public var host: StackWorkoutHostEntry
    
    public var completions: [StackWorkoutCompletionEntry]
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let workoutRaw = try container.decode(Data.self, forKey: .plan)
        self.plan = try WorkoutPlan(from: workoutRaw)
        self.deadline = try container.decode(Date.self, forKey: .deadline)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.completions = try container.decode([StackWorkoutCompletionEntry].self, forKey: .completions)
        self.host = try container.decode(StackWorkoutHostEntry.self, forKey: .host)
    }
    
    public init(plan: WorkoutPlan, deadline: Date, host: StackWorkoutHostEntry, name: String? = nil) {
        self.plan = plan
        self.deadline = deadline
        self.host = host
        self.name = name
        self.completions = []
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let raw = try self.plan.dataRepresentation
        try container.encode(raw, forKey: .plan)
        try container.encode(deadline, forKey: .deadline)
        try container.encode(completions, forKey: .completions)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encode(host, forKey: .host)
    }
    
    enum CodingKeys: String, CodingKey {
        case plan, deadline, completions, name, host
    }
    
    public static let sample: StackWorkout = .init(
        plan: .init(
            .goal(SingleGoalWorkout(activity: .running, goal: .distance(4, .miles)))
        ),
        deadline: Date.now.addingTimeInterval(60 * 60),
        host: .init(
            profile: .init(
                color: Profile.colorOptions.first!,
                displayName: "JON MELITSKI",
                uuid: UUID()),
            proposedAt: Date.now.addingTimeInterval(-60 * 60)
        )
    )
}

public struct StackWorkoutHostEntry: Codable {
    public let profile: Profile
    public let proposedAt: Date
    
    public init(profile: Profile, proposedAt: Date) {
        self.profile = profile
        self.proposedAt = proposedAt
    }
    
}

public struct StackWorkoutCompletionEntry: Codable {
    public let profile: Profile
    public let completedAt: Date
    // Will want to add more in-depth reporting but this is fine for now
    
    public init(profile: Profile, completedAt: Date) {
        self.profile = profile
        self.completedAt = completedAt
    }
}

public extension WorkoutGoal {
    var stackTemplateText: String {
        switch self {
        case .open:
            "OPEN"
        case .distance(_, _):
            "DISTANCE"
        case .time(_, _):
            "TIME"
        case .energy(_, _):
            "ENERGY"
        case .poolSwimDistanceWithTime(_, _):
            "POOL"
        @unknown default:
            fatalError()
        }
    }
}
