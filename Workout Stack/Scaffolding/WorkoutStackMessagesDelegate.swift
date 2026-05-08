//
//  WorkoutStackMessagesDelegate.swift
//  Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import Messages

protocol WorkoutStackMessagesDelegate {
    func willBecomeActive(with conversation: MSConversation)

    func didResignActive(with conversation: MSConversation)
   
    func didReceive(_ message: MSMessage, conversation: MSConversation)
    
    func didStartSending(_ message: MSMessage, conversation: MSConversation)
    
    func didCancelSending(_ message: MSMessage, conversation: MSConversation)
    
    func willTransition(to presentationStyle: MSMessagesAppPresentationStyle)
    
    func didTransition(to presentationStyle: MSMessagesAppPresentationStyle)
}
