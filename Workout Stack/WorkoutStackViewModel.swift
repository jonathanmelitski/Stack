//
//  WorkoutStackViewModel.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import SwiftUI
import Messages
import Combine

class WorkoutStackViewModel: ObservableObject, WorkoutStackMessagesDelegate {
    
    static let shared = WorkoutStackViewModel()
    
    @Published var style: MSMessagesAppPresentationStyle? = nil
    @Published var currentMessage: MSMessage? = nil {
        didSet {
            if let currentMessage {
                Task { @MainActor in
                    self.page = .detail(message: currentMessage)
                }
            }
        }
    }
    @Published var page: Page = .home
    
    var requestedStyleChange: Bool = false
    
    var userPreferredStyle: MSMessagesAppPresentationStyle = .compact
    
    var isSinglePersonGroup: Bool? {
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
    
    private var rootMessagesController: MSMessagesAppViewController? = nil
    
    func sendMessage() {
        let message = MSMessage()
        let layout = MSMessageTemplateLayout()
        layout.subcaption = ""
        message.layout = layout
        
        self.conversation?.insert(message)
        self.requestStyle(.compact)
    }
    
    func setMessagesController(_ controller: MSMessagesAppViewController) {
        self.rootMessagesController = controller
    }
    
    func dismiss() {
        self.rootMessagesController?.dismiss()
    }
    
    func requestStyle(_ style: MSMessagesAppPresentationStyle) {
        self.requestedStyleChange = true
        self.rootMessagesController?.requestPresentationStyle(style)
    }
    
    func willBecomeActive(with conversation: MSConversation) {
        self.conversation = conversation
    }
    
    func didResignActive(with conversation: MSConversation) {}
    
    func didReceive(_ message: MSMessage, conversation: MSConversation) {}
    
    func didStartSending(_ message: MSMessage, conversation: MSConversation) {}
    
    func didCancelSending(_ message: MSMessage, conversation: MSConversation) {}
    
    func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        if !requestedStyleChange {
            self.userPreferredStyle = presentationStyle
        }
        self.requestedStyleChange = false
        self.style = presentationStyle
    }
    
    func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {}
}
