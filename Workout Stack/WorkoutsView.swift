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
            if vm.style == .transcript {
                WorkoutLiveTemplate(workout: StackWorkout.sample)
                    .onTapGesture {
                        vm.requestStyle(.expanded)
                    }
            } else if let message = vm.currentMessage {
                Text("OpenedWorkoutView")
            } else {
                switch vm.page {
                case .home:
                    HomeView()
                case .create:
                    CreateWorkoutView()
                case .detail(let message):
                    Text("Deatil viea")
                case .profile:
                    ProfileView()
                }
            }
        }
        .environmentObject(vm)
    }
}


