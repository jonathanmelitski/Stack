//
//  StackWorkout+Message.swift
//  StackShared
//
//  Created by Jonathan Melitski on 7/26/26.
//

import Foundation
import MessagesAppKit
import MessagesAppKitCodable

extension StackWorkout: MessagePayload {}

public extension StackWorkout {
    var title: String {
        name ?? "\(host.profile.displayName)'s Workout"
    }

    var deadlineText: String {
        deadline.formatted(date: .abbreviated, time: .shortened)
    }
}

public extension MessagesSession {
    var stackWorkout: StackWorkout? {
        try? payload(StackWorkout.self)
    }

    func insert(workout: StackWorkout) async throws {
        let message = try makeMessage(
            workout,
            summaryText: workout.title,
            accessibilityLabel: "\(workout.title), due \(workout.deadlineText)",
            layout: .live(alternate: AlternateLayout(
                caption: workout.title,
                subcaption: "Due \(workout.deadlineText)"
            )),
            continuingSelectedSession: false
        )
        try await insert(message)
        requestPresentationStyle(.compact)
    }
}
