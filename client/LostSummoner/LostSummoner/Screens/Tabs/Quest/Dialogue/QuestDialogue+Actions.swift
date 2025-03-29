//
//  QuestDialogue+Actions.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension QuestDialogueViewController {
    //MARK: Actions
        @objc func nextTapped() {
            updateScene(1)
        }
        
        @objc func backTapped() {
            updateScene(-1)
        }
        
        func updateScene(_ i: Int) {
            /*
            index += i
            if index == 0 { backButton.isHidden = true } else { backButton.isHidden = false }
            if index == (viewModel?.dialogue.count ?? 0) - 1 {
                forwardButton.setTitle("CLOSE", for: .normal) }
            else {
                forwardButton.setTitle("NEXT", for: .normal) }
            if index < viewModel?.dialogue.count ?? 0 && index >= 0 {
                dialogue.text = viewModel?.dialogue[index].content
                nameLabel.text = viewModel?.dialogue[index].speaker
                speakerImage.image = UIImage(named: viewModel?.dialogue[index].speaker ?? "")
            }
            else if index == viewModel?.dialogue.count {
                MockServer.shared.setDialogueComplete(viewModel!)
                sendBack()
            }
            */
        }
}
