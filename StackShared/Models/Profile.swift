//
//  Profile.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/7/26.
//

import Foundation
import SwiftUI

public struct Profile: Codable {
    public static let colorOptions: [Color] = ProfilePalette.athleticNeon + ProfilePalette.sportTeam
    public static let maxNameLength: Int = 20
    
    public var color: Color
    public var displayName: String
    public var overlayCharacter: String? {
        self.displayName.first?.uppercased()
    }
    public let uuid: UUID? // not sure if this will work. Is my remote UUID the same to other people as my localUUID?
    
    public init(color: Color, displayName: String, uuid: UUID?) {
        self.color = color
        self.displayName = displayName
        self.uuid = uuid
    }
    
}

extension Color: @retroactive Codable {
    public func encode(to encoder: any Encoder) throws {
        let ui = UIColor(self)
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        ui.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(red, forKey: .red)
        try container.encode(green, forKey: .green)
        try container.encode(blue, forKey: .blue)
        try container.encode(alpha, forKey: .alpha)
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(CGFloat.self, forKey: .red)
        let green = try container.decode(CGFloat.self, forKey: .green)
        let blue = try container.decode(CGFloat.self, forKey: .blue)
        let alpha = try container.decode(CGFloat.self, forKey: .alpha)
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    enum CodingKeys: String, CodingKey {
        case red, green, blue, alpha
    }
}

enum ProfilePalette {
    /// Athletic Neon — high-saturation pops for the dark theme.
    static let athleticNeon: [Color] = [
        Color(.sRGB, red: 1.000, green: 0.302, blue: 0.180, opacity: 1), // Ember  #FF4D2E
        Color(.sRGB, red: 1.000, green: 0.624, blue: 0.110, opacity: 1), // Solar  #FF9F1C
        Color(.sRGB, red: 1.000, green: 0.839, blue: 0.039, opacity: 1), // Volt   #FFD60A
        Color(.sRGB, red: 0.239, green: 0.863, blue: 0.518, opacity: 1), // Mint   #3DDC84
        Color(.sRGB, red: 0.000, green: 0.898, blue: 1.000, opacity: 1), // Ice    #00E5FF
        Color(.sRGB, red: 0.231, green: 0.510, blue: 0.965, opacity: 1), // Sprint #3B82F6
        Color(.sRGB, red: 0.659, green: 0.333, blue: 0.969, opacity: 1), // Violet #A855F7
        Color(.sRGB, red: 0.925, green: 0.282, blue: 0.600, opacity: 1), // Pulse  #EC4899
        Color(.sRGB, red: 0.957, green: 0.447, blue: 0.714, opacity: 1), // Rose   #F472B6
        Color(.sRGB, red: 0.133, green: 0.827, blue: 0.933, opacity: 1), // Aqua   #22D3EE
    ]

    static let sportTeam: [Color] = [
        Color(.sRGB, red: 0.784, green: 0.063, blue: 0.180, opacity: 1), // Varsity  #C8102E
        Color(.sRGB, red: 1.000, green: 0.420, blue: 0.102, opacity: 1), // Court    #FF6B1A
        Color(.sRGB, red: 1.000, green: 0.722, blue: 0.110, opacity: 1), // Hardwood #FFB81C
        Color(.sRGB, red: 0.106, green: 0.431, blue: 0.227, opacity: 1), // Field    #1B6E3A
        Color(.sRGB, red: 0.361, green: 0.176, blue: 0.569, opacity: 1), // Nitro    #5C2D91
    ]
}
