//
//  QuestList+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit
extension QuestListViewController {
    func setUI() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = currentTheme.background
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        
        let backButton = UIButton.standard()
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.addTarget(self, action: #selector(sendBack), for: .touchUpInside)
        //MARK: Table View
        tableView.rowHeight = 104
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        tableView.dataSource = self
        tableView.registerCell(ofType: QuestListCell.self)
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    }
    
    func setRewardsView(exp: Int, gold: Int) {
        let text = "You earned \(exp) exp and \(gold) gold"
        /* RouteHandler.shared.sendToAlert(self,
                                        base: .text,
                                        image: .zero,
                                        text: text,
                                        type:.questText,
                                        image1: "",
                                        image2: "",
                                        image3: "") */
    }
    
    func setNotEnoughSPView(_ requiredSP: Int) {
        let text = "You need \(requiredSP) SP to start this quest. \nWould you like to use 1 coin to refill?"
        /*
        RouteHandler.shared.sendToAlert(self,
                                        base: .button,
                                        image: .zero,
                                        text: text,
                                        type: .refill,
                                        image1: "",
                                        image2: "",
                                        image3: "") */
    }
}
