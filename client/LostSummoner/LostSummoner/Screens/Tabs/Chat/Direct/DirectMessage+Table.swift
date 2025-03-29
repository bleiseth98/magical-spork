//
//  DirectMessage+Table.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension DirectMessageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 //messageContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = messageWasSent[indexPath.row]
        let cell = createChatCell(cellData, indexPath)
        return cell
    }
    
    func createChatCell(_ wasSent: Bool, _ indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        let sentCell = tableView.dequeueReusableCell(withIdentifier: "ChatSentCell", for: indexPath) as! ChatSentCell
        let receivedCell = tableView.dequeueReusableCell(withIdentifier: "ChatRecievedCell", for: indexPath) as! ChatRecievedCell
        
        let sentTimestamp = messageTimestamps[indexPath.row]
        let timestampText = Date.convertTime(sentTimestamp)
        
        switch wasSent {
        case true: ///sent
            sentCell.contentLabel.text = messageContent[indexPath.row]
            sentCell.timestampLabel.text = "\(username) \(timestampText)"
            cell = sentCell
        default: ///recieved
            receivedCell.contentLabel.text = messageContent[indexPath.row]
            receivedCell.timestampLabel.text = "\(recipientName ?? "") \(timestampText)"
            cell = receivedCell
        }
        return cell!
    }
    
}
