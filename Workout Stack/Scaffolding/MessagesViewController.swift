//
//  MessagesViewController.swift
//  Workout Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import UIKit
import SwiftUI
import Messages
import StackShared

@objc(MessagesViewController)
class MessagesViewController: MSMessagesAppViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    weak var delegate: WorkoutStackMessagesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let viewModel = WorkoutStackViewModel(style: self.presentationStyle)
        viewModel.setMessagesController(self)
        self.delegate = viewModel
        let hostingController = UIHostingController(rootView: {
            WorkoutsView(vm: viewModel)
                .foregroundStyle(.white)
        }())
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
    }
    
    override func contentSizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: 300, height: 250)
    }
    
    
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        delegate?.willBecomeActive(with: conversation)
    }
    
    override func didResignActive(with conversation: MSConversation) {
        delegate?.didResignActive(with: conversation)
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        delegate?.didReceive(message, conversation: conversation)
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        delegate?.didStartSending(message, conversation: conversation)
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        delegate?.didCancelSending(message, conversation: conversation)
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        delegate?.willTransition(to: presentationStyle)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        delegate?.didTransition(to: presentationStyle)
    }
}
