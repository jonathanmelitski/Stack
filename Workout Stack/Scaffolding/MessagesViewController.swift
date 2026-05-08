//
//  MessagesViewController.swift
//  Workout Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import UIKit
import SwiftUI
import Messages

@objc(MessagesViewController)
class MessagesViewController: MSMessagesAppViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let hostingController = UIHostingController(rootView: WorkoutsView())
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.backgroundColor = .black
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        WorkoutStackViewModel.shared.setMessagesController(self)
    }
    
    
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        WorkoutStackViewModel.shared.willBecomeActive(with: conversation)
    }
    
    override func didResignActive(with conversation: MSConversation) {
        WorkoutStackViewModel.shared.didResignActive(with: conversation)
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        WorkoutStackViewModel.shared.didReceive(message, conversation: conversation)
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        WorkoutStackViewModel.shared.didStartSending(message, conversation: conversation)
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        WorkoutStackViewModel.shared.didCancelSending(message, conversation: conversation)
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        WorkoutStackViewModel.shared.willTransition(to: presentationStyle)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        WorkoutStackViewModel.shared.didTransition(to: presentationStyle)
    }
}
