//
//  UnitExtensions.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import Foundation

extension MeasurementFormatter {
    static let stackFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.numberFormatter.maximumFractionDigits = 2
        formatter.numberFormatter.minimumFractionDigits = 0
        return formatter
    }()
}

public extension Unit {
    func stackLocalizedString(for value: Double) -> String {
        let measurement = Measurement(value: value, unit: self)
        return MeasurementFormatter.stackFormatter.string(from: measurement)
    }
}
