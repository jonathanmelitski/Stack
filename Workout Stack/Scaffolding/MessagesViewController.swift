//
//  MessagesViewController.swift
//  Workout Stack
//
//  Created by Jonathan Melitski on 5/6/26.
//

import MessagesAppKit
import StackShared
import UIKit

@objc(MessagesViewController)
final class MessagesViewController: MessagesAppHost<WorkoutsView> {
    override var transcriptContentSize: CGSize? {
        CGSize(width: 300, height: 250)
    }

    override var hostBackgroundColor: UIColor? {
        .black
    }
}
