//
//  HKWorkoutExtensions.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/18/26.
//

import HealthKit

public extension HKWorkoutActivityType {
    static var allCases: [HKWorkoutActivityType] = [
        .americanFootball,
        .archery,
        .australianFootball,
        .badminton,
        .baseball,
        .basketball,
        .bowling,
        .boxing,
        .climbing,
        .cricket,
        .crossTraining,
        .curling,
        .cycling,
        .dance,
        .danceInspiredTraining,
        .elliptical,
        .equestrianSports,
        .fencing,
        .fishing,
        .functionalStrengthTraining,
        .golf,
        .gymnastics,
        .handball,
        .hiking,
        .hockey,
        .hunting,
        .lacrosse,
        .martialArts,
        .mindAndBody,
        .paddleSports,
        .play,
        .preparationAndRecovery,
        .racquetball,
        .rowing,
        .rugby,
        .running,
        .sailing,
        .skatingSports,
        .snowSports,
        .soccer,
        .softball,
        .squash,
        .surfingSports,
        .swimming,
        .tableTennis,
        .tennis,
        .trackAndField,
        .traditionalStrengthTraining,
        .volleyball,
        .walking,
        .waterFitness,
        .waterPolo,
        .waterSports,
        .wrestling,
        .yoga,
        .barre,
        .coreTraining,
        .crossCountrySkiing,
        .downhillSkiing,
        .flexibility,
        .highIntensityIntervalTraining,
        .jumpRope,
        .kickboxing,
        .pilates,
        .snowboarding,
        .stairs,
        .stepTraining,
        .wheelchairWalkPace,
        .wheelchairRunPace,
        .taiChi,
        .mixedCardio,
        .handCycling,
        .discSports,
        .fitnessGaming,
        .cardioDance,
        .socialDance,
        .pickleball,
        .cooldown,
        .swimBikeRun,
        .transition,
        .underwaterDiving,
        .other
    ]
    
    var systemImage: String {
        switch self {
        case .americanFootball:
            "figure.american.football"
        case .archery:
            "figure.archery"
        case .australianFootball:
            "figure.australian.football"
        case .badminton:
            "figure.badminton"
        case .baseball:
            "figure.baseball"
        case .basketball:
            "figure.basketball"
        case .bowling:
            "figure.bowling"
        case .boxing:
            "figure.boxing"
        case .climbing:
            "figure.climbing"
        case .cricket:
            "figure.cricket"
        case .crossTraining:
            "figure.cross.training"
        case .curling:
            "figure.curling"
        case .cycling:
            "figure.outdoor.cycle"
        case .dance:
            "figure.dance"
        case .danceInspiredTraining:
            "figure.dance"
        case .elliptical:
            "figure.elliptical"
        case .equestrianSports:
            "figure.equestrian.sports"
        case .fencing:
            "figure.fencing"
        case .fishing:
            "figure.fishing"
        case .functionalStrengthTraining:
            "figure.strengthtraining.functional"
        case .golf:
            "figure.golf"
        case .gymnastics:
            "figure.gymnastics"
        case .handball:
            "figure.handball"
        case .hiking:
            "figure.hiking"
        case .hockey:
            "figure.hockey"
        case .hunting:
            "figure.hunting"
        case .lacrosse:
            "figure.lacrosse"
        case .martialArts:
            "figure.martial.arts"
        case .mindAndBody:
            "figure.mind.and.body"
        case .mixedMetabolicCardioTraining:
            "figure.mixed.cardio"
        case .paddleSports:
            "oar.2.crossed"
        case .play:
            "figure.play"
        case .preparationAndRecovery:
            "figure.cooldown"
        case .racquetball:
            "figure.racquetball"
        case .rowing:
            "figure.rower"
        case .rugby:
            "figure.rugby"
        case .running:
            "figure.run"
        case .sailing:
            "sailboat"
        case .skatingSports:
            "figure.skating"
        case .snowSports:
            "snowflake"
        case .soccer:
            "figure.soccer"
        case .softball:
            "figure.softball"
        case .squash:
            "figure.squash"
        case .stairClimbing:
            "figure.stair.stepper"
        case .surfingSports:
            "figure.surfing"
        case .swimming:
            "figure.pool.swim"
        case .tableTennis:
            "figure.table.tennis"
        case .tennis:
            "figure.tennis"
        case .trackAndField:
            "figure.track.and.field"
        case .traditionalStrengthTraining:
            "figure.strengthtraining.traditional"
        case .volleyball:
            "figure.volleyball"
        case .walking:
            "figure.walk"
        case .waterFitness:
            "figure.water.fitness"
        case .waterPolo:
            "figure.waterpolo"
        case .waterSports:
            "drop.fill"
        case .wrestling:
            "figure.wrestling"
        case .yoga:
            "figure.yoga"
        case .barre:
            "figure.barre"
        case .coreTraining:
            "figure.core.training"
        case .crossCountrySkiing:
            "figure.skiing.crosscountry"
        case .downhillSkiing:
            "figure.skiing.downhill"
        case .flexibility:
            "figure.flexibility"
        case .highIntensityIntervalTraining:
            "figure.highintensity.intervaltraining"
        case .jumpRope:
            "figure.jumprope"
        case .kickboxing:
            "figure.kickboxing"
        case .pilates:
            "figure.pilates"
        case .snowboarding:
            "figure.snowboarding"
        case .stairs:
            "figure.stairs"
        case .stepTraining:
            "figure.step.training"
        case .wheelchairWalkPace:
            "figure.roll"
        case .wheelchairRunPace:
            "figure.roll.runningpace"
        case .taiChi:
            "figure.taichi"
        case .mixedCardio:
            "figure.mixed.cardio"
        case .handCycling:
            "figure.hand.cycling"
        case .discSports:
            "figure.disc.sports"
        case .fitnessGaming:
            "gamecontroller.fill"
        case .cardioDance:
            "figure.dance"
        case .socialDance:
            "figure.socialdance"
        case .pickleball:
            "figure.pickleball"
        case .cooldown:
            "figure.cooldown"
        case .swimBikeRun:
            "figure.triathlon"
        case .transition:
            "arrow.triangle.swap"
        case .underwaterDiving:
            "figure.pool.swim"
        case .other:
            "figure.mixed.cardio"
        @unknown default:
            "figure.mixed.cardio"
        }
    }
    
    var description: String {
        switch self {
        case .americanFootball:
            "Football"
        case .archery:
            "Archery"
        case .australianFootball:
            "Australian Football"
        case .badminton:
            "Badminton"
        case .baseball:
            "Baseball"
        case .basketball:
            "Basketball"
        case .bowling:
            "Bowling"
        case .boxing:
            "Boxing"
        case .climbing:
            "Climbing"
        case .cricket:
            "Cricket"
        case .crossTraining:
            "Cross Training"
        case .curling:
            "Curling"
        case .cycling:
            "Cycling"
        case .dance:
            "Dance"
        case .danceInspiredTraining:
            "Dance Inspired Training"
        case .elliptical:
            "Elliptical"
        case .equestrianSports:
            "Equestrian Sports"
        case .fencing:
            "Fencing"
        case .fishing:
            "Fishing"
        case .functionalStrengthTraining:
            "Functional Strength Training"
        case .golf:
            "Golf"
        case .gymnastics:
            "Gymnastics"
        case .handball:
            "Handball"
        case .hiking:
            "Hiking"
        case .hockey:
            "Hockey"
        case .hunting:
            "Hunting"
        case .lacrosse:
            "Lacrosse"
        case .martialArts:
            "Martial Arts"
        case .mindAndBody:
            "Mind and Body"
        case .mixedMetabolicCardioTraining:
            "Mixed Cardio"
        case .paddleSports:
            "Paddle Sports"
        case .play:
            "Play"
        case .preparationAndRecovery:
            "Preparation and Recovery"
        case .racquetball:
            "Racquetball"
        case .rowing:
            "Rowing"
        case .rugby:
            "Rugby"
        case .running:
            "Running"
        case .sailing:
            "Sailing"
        case .skatingSports:
            "Skating"
        case .snowSports:
            "Snow Sports"
        case .soccer:
            "Soccer"
        case .softball:
            "Softball"
        case .squash:
            "Squash"
        case .stairClimbing:
            "Stair Climbing"
        case .surfingSports:
            "Surfing"
        case .swimming:
            "Swimming"
        case .tableTennis:
            "Table Tennis"
        case .tennis:
            "Tennis"
        case .trackAndField:
            "Track and Field"
        case .traditionalStrengthTraining:
            "Strength Training"
        case .volleyball:
            "Volleyball"
        case .walking:
            "Walking"
        case .waterFitness:
            "Water Fitness"
        case .waterPolo:
            "Water Polo"
        case .waterSports:
            "Water Sports"
        case .wrestling:
            "Wrestling"
        case .yoga:
            "Yoga"
        case .barre:
            "Barre"
        case .coreTraining:
            "Core Training"
        case .crossCountrySkiing:
            "Cross Country Skiing"
        case .downhillSkiing:
            "Downhill Skiing"
        case .flexibility:
            "Flexibility"
        case .highIntensityIntervalTraining:
            "HIIT"
        case .jumpRope:
            "Jump Rope"
        case .kickboxing:
            "Kickboxing"
        case .pilates:
            "Pilates"
        case .snowboarding:
            "Snowboarding"
        case .stairs:
            "Stairs"
        case .stepTraining:
            "Step Training"
        case .wheelchairWalkPace:
            "Wheelchair Walk Pace"
        case .wheelchairRunPace:
            "Wheelchair Run Pace"
        case .taiChi:
            "Tai Chi"
        case .mixedCardio:
            "Mixed Cardio"
        case .handCycling:
            "Hand Cycling"
        case .discSports:
            "Disc Sports"
        case .fitnessGaming:
            "Gaming"
        case .cardioDance:
            "Cardio Dance"
        case .socialDance:
            "Social Dance"
        case .pickleball:
            "Pickleball"
        case .cooldown:
            "Cooldown"
        case .swimBikeRun:
            "Triathlon"
        case .transition:
            "Transition"
        case .underwaterDiving:
            "Underwater Diving"
        case .other:
            "Other"
        @unknown default:
            "Workout"
        }
    }
    
    var stackVisibility: StackWorkoutActivityTypeVisibility {
        switch self {
        case .americanFootball:
                .visible
        case .archery:
                .collapsed
        case .australianFootball:
                .collapsed
        case .badminton:
                .collapsed
        case .baseball:
                .visible
        case .basketball:
                .visible
        case .bowling:
                .collapsed
        case .boxing:
                .collapsed
        case .climbing:
                .visible
        case .cricket:
                .collapsed
        case .crossTraining:
                .visible
        case .curling:
                .collapsed
        case .cycling:
                .visible
        case .dance:
                .visible
        case .danceInspiredTraining:
                .hidden
        case .elliptical:
                .visible
        case .equestrianSports:
                .collapsed
        case .fencing:
                .collapsed
        case .fishing:
                .collapsed
        case .functionalStrengthTraining:
                .visible
        case .golf:
                .collapsed
        case .gymnastics:
                .visible
        case .handball:
                .collapsed
        case .hiking:
                .visible
        case .hockey:
                .collapsed
        case .hunting:
                .hidden
        case .lacrosse:
                .collapsed
        case .martialArts:
                .collapsed
        case .mindAndBody:
                .collapsed
        case .mixedMetabolicCardioTraining:
                .collapsed
        case .paddleSports:
                .collapsed
        case .play:
                .hidden
        case .preparationAndRecovery:
                .hidden
        case .racquetball:
                .collapsed
        case .rowing:
                .collapsed
        case .rugby:
                .collapsed
        case .running:
                .featured
        case .sailing:
                .collapsed
        case .skatingSports:
                .collapsed
        case .snowSports:
                .collapsed
        case .soccer:
                .visible
        case .softball:
                .visible
        case .squash:
                .collapsed
        case .stairClimbing:
                .collapsed
        case .surfingSports:
                .collapsed
        case .swimming:
                .visible
        case .tableTennis:
                .collapsed
        case .tennis:
                .visible
        case .trackAndField:
                .visible
        case .traditionalStrengthTraining:
                .featured
        case .volleyball:
                .visible
        case .walking:
                .visible
        case .waterFitness:
                .collapsed
        case .waterPolo:
                .collapsed
        case .waterSports:
                .collapsed
        case .wrestling:
                .collapsed
        case .yoga:
                .collapsed
        case .barre:
                .collapsed
        case .coreTraining:
                .visible
        case .crossCountrySkiing:
                .collapsed
        case .downhillSkiing:
                .collapsed
        case .flexibility:
                .visible
        case .highIntensityIntervalTraining:
                .visible
        case .jumpRope:
                .collapsed
        case .kickboxing:
                .collapsed
        case .pilates:
                .collapsed
        case .snowboarding:
                .collapsed
        case .stairs:
                .collapsed
        case .stepTraining:
                .hidden
        case .wheelchairWalkPace:
                .collapsed
        case .wheelchairRunPace:
                .collapsed
        case .taiChi:
                .collapsed
        case .mixedCardio:
                .visible
        case .handCycling:
                .hidden
        case .discSports:
                .featured
        case .fitnessGaming:
                .hidden
        case .cardioDance:
                .hidden
        case .socialDance:
                .collapsed
        case .pickleball:
                .collapsed
        case .cooldown:
                .hidden
        case .swimBikeRun:
                .hidden
        case .transition:
                .collapsed
        case .underwaterDiving:
                .collapsed
        case .other:
                .collapsed
        @unknown default:
                .hidden
        }
    }
}

public enum StackWorkoutActivityTypeVisibility: Int, Comparable {
    public static func < (lhs: StackWorkoutActivityTypeVisibility, rhs: StackWorkoutActivityTypeVisibility) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case featured = 0, visible = 1, collapsed = 2, hidden = 3
    
    
}

extension HKWorkoutSessionLocationType: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown:
            "INDOOR/OUTDOOR"
        case .indoor:
            "INDOOR"
        case .outdoor:
            "OUTDOOR"
        @unknown default:
            "INDOOR/OUTDOOR"
        }
    }
}
