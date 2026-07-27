//
//  StackRouter.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import Combine
import SwiftUI

public final class StackRouter: ObservableObject {
    @Published public var page: Page = .home

    public init() {}
}

public enum Page: Hashable {
    case home
    case create
    case profile
}
