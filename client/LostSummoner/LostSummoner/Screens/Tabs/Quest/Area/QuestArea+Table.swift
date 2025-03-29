//
//  QuestArea+Table.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension QuestAreaViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cellCount = 10 /*
        switch viewModel.type {
        case .area: cellCount = viewModel.model?.areas.count ?? 0
        case .subarea: cellCount = viewModel.selectedArea?.children_areas?.count ?? 0
        case .list: cellCount = viewModel.getQuestList().count
        } */
        return cellCount
    }
    //MARK: cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? 
        let areaCell: QuestAreaCell = tableView.dequeueTypedCell(forIndexPath: indexPath)
        areaCell.nameLabel.text = "Area \(indexPath.row)"
        cell = areaCell
        return cell!
    }
    //MARK: didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RouteHandler.shared.sendToQuestList(self)
    }
}
