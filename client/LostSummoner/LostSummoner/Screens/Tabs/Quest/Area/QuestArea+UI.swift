//
//  QuestArea+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension QuestAreaViewController {
    func setUI() {
            backgroundView.backgroundColor = currentTheme.background
            view.addSubview(backgroundView)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
            
            view.addSubview(backButton)
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
            backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            backButton.addTarget(self, action: #selector(sendBack), for: .touchUpInside)
            //MARK: - Table View
            tableView.rowHeight = 104
            tableView.backgroundColor = .clear
            tableView.separatorStyle = .none
            tableView.allowsSelection = true
            tableView.dataSource = self
            tableView.registerCell(ofType: QuestAreaCell.self)
            //tableView.registerCell(ofType: QuestListCell.self)
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8).isActive = true
        }
        
        func setRewardsView(exp: Int, gold: Int) {
            let text = "You earned \(exp) exp and \(gold) gold"
            /*
            RouteHandler.shared.sendToAlert(self,
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
        /*
        func setDialogueView(_ quest: Quest) {
            
            if quest.dialogue.first?.isComplete == false {
                let child = QuestDialogueVC()
                child.viewModel = quest
                self.addChild(child)
                child.view.frame = self.view.bounds
                self.view.addSubview(child.view)
                child.didMove(toParent: self)
            }
             
        }
         */
}
