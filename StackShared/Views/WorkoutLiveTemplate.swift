//
//  WorkoutLiveTemplate.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/11/26.
//

import SwiftUI
import HealthKit
import WorkoutKit


public struct WorkoutLiveTemplate: View {
    let workout: StackWorkout
    
    public init(workout: StackWorkout) {
        self.workout = workout
    }
    
    let gcSize = 8
    let entries = [ StackWorkoutCompletionEntry(profile: .init(color: .red, displayName: "ASDF", uuid: nil), completedAt: Date.now),
                    StackWorkoutCompletionEntry(profile: .init(color: .green, displayName: "BSDF", uuid: nil), completedAt: Date.now),
                    StackWorkoutCompletionEntry(profile: .init(color: .blue, displayName: "CSDF", uuid: nil), completedAt: Date.now),
                    StackWorkoutCompletionEntry(profile: .init(color: .orange, displayName: "DSDF", uuid: nil), completedAt: Date.now)
    ]
    
    public var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text("STACK")
            }
            .font(.custom("JetBrains Mono", fixedSize: 10))
            .foregroundStyle(.gray)
            .fontWeight(.semibold)
            .padding(12)
            .background(.black.mix(with: .white, by: 0.2))
            Rectangle()
                .fill(.gray)
                .frame(height: 0.5)
            ZStack {
                Rectangle()
                    .fill(.black)
                WorkoutLiveTemplateBody(workout: workout)
                    .padding(12)
            }
            Rectangle()
                .fill(.gray)
                .frame(height: 0.5)
            HStack(spacing: 0) {
                ForEach(entries.enumerated(), id: \.offset) { idx, el in
                    Circle()
                        .fill(el.profile.color)
                        .strokeBorder(.black, lineWidth: 2)
                        .overlay {
                            Text(el.profile.overlayCharacter ?? "P")
                                .foregroundStyle(.white)
                                .font(.custom("SF Pro", size: 12, relativeTo: .caption))
                        }
                        .frame(width: 32, height: 32)
                        .zIndex(Double(idx))
                        .offset(x: CGFloat(-12 * idx))
                }
                Spacer()
                Text("\(entries.count)/\(gcSize) stacked")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(.black.mix(with: .white, by: 0.2))
            
                
        }
        
    }
}

struct WorkoutLiveTemplateBody: View {
    let workout: StackWorkout
    
    var completedByUser: Bool {
        return true
    }
    
    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {
                Text(workout.name?.uppercased() ?? "WORKOUT")
                    .font(.custom("Anton-Regular", size: 28, relativeTo: .title))
                    .foregroundStyle(.white)
                Spacer()
                WorkoutDeadlineCluster(workout: workout, completedByUser: completedByUser)
                .frame(maxHeight: 60)
            }
        }
    }
}

public extension SingleGoalWorkout {
    var stackTemplateText: String {
        self.goal.stackTemplateText
    }
}

#Preview {
    WorkoutLiveTemplate(workout: StackWorkout.sample)
        .frame(width: 300, height: 250)
        .border(.black, width: 2)
}
