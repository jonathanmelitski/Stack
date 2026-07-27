//
//  SingleGoalWorkoutView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import SwiftUI
import WorkoutKit

struct SingleGoalWorkoutView: View {
    let workout: SingleGoalWorkout
    
    init(_ workout: SingleGoalWorkout) {
        self.workout = workout
    }
    
    var subheaderText: String {
        "\(workout.goal.stackTemplateText) GOAL • \(workout.location)"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            HStack {
                Image(systemName: workout.activity.systemImage)
                    .foregroundStyle(.accent)
                    .font(.title)
                VStack(alignment: .leading) {
                    Text(subheaderText)
                        .font(.custom("JetBrainsMono-SemiBold", size: 12, relativeTo: .body))
                        .foregroundStyle(.gray)
                    Text(workout.activity.description)
                        .bold()
                }
                Spacer()
            }
            .padding()
            .inExpandingRectangle()
            .stackBoxBackgrounded()
            
            Text("THE WORK")
                .font(.custom("JetBrainsMono-SemiBold", size: 12, relativeTo: .body))
                .foregroundStyle(.gray)
            
            SingleGoalWorkoutGoalMuxerView(goal: workout.goal)
                .padding()
                .inExpandingRectangle()
                .stackBoxBackgrounded()
        }
    }
}

struct SingleGoalWorkoutGoalMuxerView: View {
    let goal: WorkoutGoal
    
    var body: some View {
        HStack {
            Group {
                switch goal {
                case .open:
                    Image(systemName: "smallcircle.filled.circle")
                case .distance( _, _):
                    Image(systemName: "point.topleft.down.to.point.bottomright.curvepath")
                case .time( _, _):
                    Image(systemName: "stopwatch")
                case .energy( _, _):
                    Image(systemName: "bolt.fill")
                case .poolSwimDistanceWithTime( _, _):
                    Image(systemName: "drop")
                @unknown default:
                    fatalError()
                }
            }
            .foregroundStyle(.accent)
            .font(.title2)
            .padding(16)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.black.mix(with: .white, by: 0.2))
            }
            
            VStack(alignment: .leading) {
                Text("GOAL")
                    .font(.custom("JetBrainsMono-SemiBold", size: 12, relativeTo: .body))
                    .foregroundStyle(.gray)
                Group {
                    switch goal {
                    case .open:
                        Text("OPEN")
                    case .distance(let double, let unitLength):
                        Text("\(unitLength.stackLocalizedString(for: double).uppercased())")
                    case .time(let double, let unitDuration):
                        Text("\(unitDuration.stackLocalizedString(for: double).uppercased())")
                    case .energy(let double, let unitEnergy):
                        Text("\(unitEnergy.stackLocalizedString(for: double).uppercased())")
                    case .poolSwimDistanceWithTime(let measurement, let measurement2):
                        Text("TODO")
                    @unknown default:
                        fatalError()
                    }
                }
                .font(.custom("Anton-Regular", size: 28, relativeTo: .largeTitle))
                
            }
            
            
            Spacer()
        }
    }
}

