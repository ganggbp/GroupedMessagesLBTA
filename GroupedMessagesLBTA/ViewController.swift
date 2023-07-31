//
//  ViewController.swift
//  GroupedMessagesLBTA
//
//  Created by Burit Boonkorn on 31/7/2566 BE.
//

import UIKit

struct ChatMessage {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        return dateFormatter.date(from: customString) ?? Date()
    }
}

class ViewController: UITableViewController {
    
    let chatMessages = [
        [
            ChatMessage(
                text: "Here's my very first message",
                isIncoming: true,
                date: Date.dateFromCustomString(customString: "08/03/2018")
            ),
            ChatMessage(
                text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap",
                isIncoming: true,
                date: Date.dateFromCustomString(customString: "08/03/2018")
            ),
        ],
        [
            ChatMessage(
                text: "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap",
                isIncoming: false,
                date: Date.dateFromCustomString(customString: "09/15/2018")
            ),
            ChatMessage(
                text: "Yo, dawg",
                isIncoming: false,
                date: Date.dateFromCustomString(customString: "09/15/2018")
            ),
            ChatMessage(
                text: "This message should appear on the left with a white background",
                isIncoming: true,
                date: Date.dateFromCustomString(customString: "09/15/2018")
            )
        ],
        [
            ChatMessage(
                text: "Third section message",
                isIncoming: true,
                date: Date.dateFromCustomString(customString: "09/31/2018")
            )
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: ChatMessageCell.identifier)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    
    class DateHeaderLabel: UILabel {
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .black
            textColor = .white
            textAlignment = .center
            font = UIFont.boldSystemFont(ofSize: 14)
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            
            return CGSize(
                width: originalContentSize.width + 20,
                height: height
            )
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = chatMessages[section].first {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            let label = DateHeaderLabel()
            label.text = dateString
            
            let containerView = UIView()
            containerView.addSubview(label)
            
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            
            return containerView
        }
        
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        if let firstMessageInSection = chatMessages[section].first {
    //            let dateFormatter = DateFormatter()
    //            dateFormatter.dateFormat = "MM/dd/yyyy"
    //            let dateString = dateFormatter.string(from: firstMessageInSection.date)
    //            return dateString
    //        }
    //
    //        return "Section: \(Date())"
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatMessageCell.identifier, for: indexPath) as? ChatMessageCell else {
            return UITableViewCell()
        }
        
        //        cell.chatMessage = chatMessages[indexPath.row]
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }
}

