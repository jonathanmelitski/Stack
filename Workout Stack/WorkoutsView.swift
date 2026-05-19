//
//  WorkoutsView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import SwiftUI
import Messages
import StackShared

struct WorkoutsView: View {
    @StateObject var vm: WorkoutStackViewModel
    
    init(vm: WorkoutStackViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if let workout = vm.messageEncodedStackWorkout {
                WorkoutDetailViewMuxer(style: vm.style, workout: workout)
            } else {
                switch vm.page {
                case .home:
                    HomeView(style: vm.style)
                case .create:
                    CreateWorkoutView()
                case .detail(let message):
                    Text("detail view")
                case .profile:
                    ProfileView()
                @unknown default:
                    fatalError()
                }
            }
        }
        .environmentObject(vm)
        
        
        
//        Group {
//            if let workout = vm.messageEncodedStackWorkout,
//               vm.style == .transcript {
//                WorkoutLiveTemplate(workout: workout)
//                    .onTapGesture {
//                        vm.requestStyle(.expanded)
//                    }
//            } else if vm.style == .transcript {
//                Text("Unknown workout")
//            } else if let workout = vm.messageEncodedStackWorkout {
//                WorkoutDetailView(workout: workout)
//                    .padding()
//            } else {
//                switch vm.page {
//                case .home:
//                    HomeView()
//                case .create:
//                    CreateWorkoutView()
//                case .detail(let message):
//                    Text("Deatil viea")
//                case .profile:
//                    ProfileView()
//                }
//            }
//        }
        
    }
}


