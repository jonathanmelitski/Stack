//
//  WorkoutStackViewModel.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import SwiftUI
import Messages
import Combine

public class WorkoutStackViewModel: ObservableObject, WorkoutStackMessagesDelegate {
    
    public init(style: MSMessagesAppPresentationStyle) {
        self.style = style
    }
    @Published public var style: MSMessagesAppPresentationStyle
    @Published public var currentMessage: MSMessage? = nil {
        didSet {
            if let currentMessage {
                Task { @MainActor in
                    self.page = .detail(message: currentMessage)
                }
            }
        }
    }
    @Published public var page: Page = .home
    
    public var requestedStyleChange: Bool = false
    
    public private(set) var userPreferredStyle: MSMessagesAppPresentationStyle = .compact
    
    public var isSinglePersonGroup: Bool? {
        guard let conversation else { return nil }
        return conversation.remoteParticipantIdentifiers.count == 1
    }
    
    private var conversation: MSConversation? {
        didSet {
            self.conversationMessageObserver?.cancel()
            self.conversationMessageObserver = conversation?.publisher(for: \.selectedMessage).sink { message in
                Task { @MainActor in
                    self.currentMessage = message
                }
            }
        }
    }
    
    private var conversationMessageObserver: (AnyCancellable)? = nil
    
    var rootMessagesController: MSMessagesAppViewController? = nil
    
    public func sendNewWorkoutMessage(workout: StackWorkout) async throws {
        let message = MSMessage(session: MSSession())
        let b64Workout = try JSONEncoder().encode(workout).base64EncodedString()
        
        var components = URLComponents()
        let queryItems = [
            URLQueryItem(name: "data", value: b64Workout)
        ]
        components.queryItems = queryItems
        
        let url = components.url!
        
        message.url = url
        let alternate = MSMessageTemplateLayout()
        // TODO: Build alternate
        
        let layout = MSMessageLiveLayout(alternateLayout: alternate)
        message.layout = layout
        message.summaryText = workout.name ?? "\(workout.host.profile.displayName)'s Workout"
        try await self.conversation?.insert(message)
        self.requestStyle(.compact)
    }
    
    public func setMessagesController(_ controller: MSMessagesAppViewController) {
        self.rootMessagesController = controller
    }
    
    public func dismiss() {
        self.rootMessagesController?.dismiss()
    }
    
    public func requestStyle(_ style: MSMessagesAppPresentationStyle) {
        self.requestedStyleChange = true
        self.rootMessagesController?.requestPresentationStyle(style)
    }
    
    public func willBecomeActive(with conversation: MSConversation) {
        self.conversation = conversation
    }
    
    public func didResignActive(with conversation: MSConversation) {}
    
    public func didReceive(_ message: MSMessage, conversation: MSConversation) {}
    
    public func didStartSending(_ message: MSMessage, conversation: MSConversation) {}
    
    public func didCancelSending(_ message: MSMessage, conversation: MSConversation) {}
    
    public func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        if !requestedStyleChange {
            self.userPreferredStyle = presentationStyle
        }
        self.requestedStyleChange = false
        self.style = presentationStyle
    }
    
    public func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {}
}

public enum Page {
    case home
    case create
    case detail(message: MSMessage)
    case profile
}
