//
//  WorkoutDetailDeadlineSubview.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/12/26.
//

import SwiftUI

struct WorkoutDetailDeadlineSubview: View {
    let workout: StackWorkout
    let completedByUser: Bool
    
    var deadlineText: String {
        let dateFormatter = DateFormatter()
        if Calendar.current.isDateInToday(workout.deadline) {
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            return "Today \(dateFormatter.string(from: workout.deadline))"
        } else if Calendar.current.isDateInTomorrow(workout.deadline) {
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            return "Tomorrow \(dateFormatter.string(from: workout.deadline))"
        } else if Calendar.current.isDateInYesterday(workout.deadline) {
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            return "Yesterday \(dateFormatter.string(from: workout.deadline))"
        } else if abs(Date.now.timeIntervalSince(workout.deadline)) < 60 * 60 * 24 * 6 {
            dateFormatter.dateFormat = "EEE h:mm a"
            return dateFormatter.string(from: workout.deadline)
        } else {
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: workout.deadline)
        }
    }
    
    var timeLeftComponents: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter.string(from: Date.now.distance(to: workout.deadline))
    }
    
    var body: some View {
        TimelineView(.everyMinute) { ctx in
            let totalSeconds = workout.deadline.timeIntervalSince(workout.host.proposedAt)
            let elapsedSeconds = Date.now.timeIntervalSince(workout.host.proposedAt)
            HStack(spacing: 16) {
                Group {
                    if completedByUser {
                        ZStack {
                            Circle()
                                .stroke(Color.green, lineWidth: 4)
                            Image(systemName: "checkmark")
                                .foregroundStyle(.white)
                        }
                        
                    } else if elapsedSeconds / totalSeconds < 1 {
                        ProgressView(value: elapsedSeconds, total: totalSeconds)
                            .progressViewStyle(RadialProgressViewStyle(completedByUser: completedByUser))
                    } else {
                        ZStack {
                            Circle()
                                .stroke(Color.accent, lineWidth: 4)
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                        }
                    }
                }
                .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 0) {
                    let isActive: Bool = elapsedSeconds / totalSeconds < 1
                    let bodyText: String = {
                        if completedByUser && isActive {
                            return "CLOSES"
                        } else if isActive {
                            return "TIME LEFT"
                        } else {
                            return "CLOSED"
                        }
                    }()
                    Text(bodyText)
                    .font(.custom("JetBrains Mono", size: 12, relativeTo: .caption))
                    .foregroundStyle(isActive ? .gray : .accent)
                    .fontWeight(.semibold)
                    if let timeLeftComponents {
                        Text(timeLeftComponents.uppercased())
                            .font(.custom("Anton-Regular", size: 28, relativeTo: .largeTitle))
                    }
                    Text("\(deadlineText)")
                        .foregroundStyle(.gray)
                        .font(.caption)

                }
            }
        }
    }
}
