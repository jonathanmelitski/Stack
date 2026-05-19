//
//  MessagesPresentationMuxer.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/19/26.
//

import Messages
import SwiftUI

protocol MessagesPresentationMultiplexableView: View {
    associatedtype TranscriptView: View
    associatedtype CompactView: View
    associatedtype ExpandedView: View
    
    var style: MSMessagesAppPresentationStyle { get }
    
    @ViewBuilder var transcript: TranscriptView { get }
    @ViewBuilder var compact: CompactView { get }
    @ViewBuilder var expanded: ExpandedView { get }
}

extension MessagesPresentationMultiplexableView {
    @ViewBuilder var body: some View {
        switch style {
        case .compact:    self.compact
        case .expanded:   self.expanded
        case .transcript: self.transcript
        @unknown default: EmptyView()
        }
    }
}
