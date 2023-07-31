//
//  ChatMessageCell.swift
//  GroupedMessagesLBTA
//
//  Created by Burit Boonkorn on 31/7/2566 BE.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    static let identifier = "ChatMessageCell"
    
    public let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let bubbleBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var chatMessage: ChatMessage! {
        didSet {
            bubbleBackgroundView.backgroundColor = chatMessage.isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)

        configureConstraints()
    }
    
    private func configureConstraints() {
        let bubbleLabelConstriants = [
            bubbleBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            bubbleBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 250)
        ]
        
        let messageLabelConstraints = [
            messageLabel.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 16),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleBackgroundView.bottomAnchor, constant: -16),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -16)
        ]

        NSLayoutConstraint.activate(bubbleLabelConstriants)
        NSLayoutConstraint.activate(messageLabelConstraints)
        
        leadingConstraint = bubbleBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        leadingConstraint.isActive = false
        
        trailingConstraint = bubbleBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        trailingConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
