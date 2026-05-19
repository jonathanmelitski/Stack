//
//  WorkoutDetailView.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/12/26.
//

import SwiftUI
import WorkoutKit
import HealthKit
import Messages

public struct WorkoutDetailView: View {
    @EnvironmentObject var vm: WorkoutStackViewModel
    @Namespace var namespace
    
    // 0 = Workout; 1 = Activity
    @State var page: Int = 0
    
    let workout: StackWorkout
    
    public init(workout: StackWorkout) {
        self.workout = workout
    }
    
    public var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Button {
                        vm.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(.plain)
                }
                HStack {
                    Spacer()
                    Text("WORKOUT")
                        .font(.custom("Anton-Regular", fixedSize: 20))
                        .bold()
                    Spacer()
                }
            }
            Divider()
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16, pinnedViews: [.sectionHeaders]) {
                    VStack (spacing: 0) {
                        HStack {
                            Text("\(workout.name?.uppercased() ?? "WORKOUT")")
                                .font(.custom("Anton-Regular", size: 44, relativeTo: .largeTitle))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .truncationMode(.middle)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("SENT BY \(workout.host.profile.displayName.uppercased())")
                                .font(.custom("JetBrainsMono-SemiBold", size: 14, relativeTo: .title2))
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    }
                    
                    HStack {
                        WorkoutDetailDeadlineSubview(workout: workout, completedByUser: false)
                        Spacer()
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.black.mix(with: .white, by: 0.15))
                            .strokeBorder(.black.mix(with: .white, by: 0.2))
                    }
                    Section {
                        if page == 0 {
                            WorkoutSummarySubview(workout: workout)
                        } else {
                            WorkoutActivitySubview(workout: workout)
                        }
                    } header: {
                        HStack(spacing: 0) {
                            Text("Workout")
                                .inExpandingRectangle()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(12)
                                .foregroundStyle(page == 0 ? .white : .gray)
                                .background {
                                    if page == 0 {
                                        Capsule().fill(.black.mix(with: .white, by: 0.15))
                                            .matchedGeometryEffect(id: "bg-capsule", in: namespace)
                                    }
                                }
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation(.snappy(duration: 0.2)) {
                                        self.page = 0
                                    }
                                }
                            Text("Activity")
                                .inExpandingRectangle()
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(12)
                                .foregroundStyle(page == 1 ? .white : .gray)
                                .background {
                                    if page == 1 {
                                        Capsule().fill(.black.mix(with: .white, by: 0.15))
                                            .matchedGeometryEffect(id: "bg-capsule", in: namespace)
                                    }
                                }
                                .contentShape(Capsule())
                                .onTapGesture {
                                    withAnimation(.snappy(duration: 0.2)) {
                                        self.page = 1
                                    }
                                }
                        }
                        .fontWeight(.semibold)
                        .padding(4)
                        .background {
                            Capsule()
                                .fill(.black.mix(with: .white, by: 0.2))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
            
            Divider()
                .ignoresSafeArea()
            
            HStack {
                Button {
                    // mark done
                } label: {
                    Text("Mark Done")
                        .fontWeight(.black)
                        .padding()
                        .inExpandingRectangle()
                        .fixedSize(horizontal: false, vertical: true)
                        .background {
                            RoundedRectangle(cornerRadius: 8).fill(.accent)
                        }
                }
            }
            
        }
    }
}

extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle().fill(Color.clear)
            self
        }
    }
}

#Preview {
    
    @Previewable @StateObject var vm = WorkoutStackViewModel(style: .expanded)
    
    GeometryReader { _ in
        WorkoutDetailView(workout: StackWorkout.sample)
            .foregroundStyle(.white)
            .padding()
            .environmentObject(vm)
    }
    .background(.black)
    
    
}
