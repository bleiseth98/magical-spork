//
//  QuestList+Table.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension QuestListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: QuestListCell = tableView.dequeueTypedCell(forIndexPath: indexPath)
        //!!! Begin Delete
        cell.actionButton.setTitle("1 SP", for: .normal)
        cell.progressFillWidth.constant = 0
        cell.progressFillWidth.isActive = true
        cell.nameLabel.text = "QUEST NAME"
        cell.descriptionLabel.text = "quest description"
        cell.progressLabel.text = "0/10"
        cell.expLabel.text = "10"
        cell.moneyLabel.text = "10"
        //cell.item1Image.isHidden = !questHasItem1[indexPath.row]
        //cell.item2Image.isHidden = !questHasItem2[indexPath.row]
        //cell.item3Image.isHidden = !questHasItem3[indexPath.row]
        cell.item1Image.image = UIImage(named: "seed")
        cell.item2Image.image = UIImage(named: "resin")
        cell.item3Image.image = UIImage(named: "guardSoul")
        //!!! End Delete
        //cell.actionBlock = { self.actionQuestAtRow(indexPath.row) }
        return cell
    }
}
