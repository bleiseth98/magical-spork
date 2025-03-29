//
//  QuestDialogue+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension QuestDialogueViewController {
    func setUI() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = currentTheme.overlay
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //MARK: Dialogue Box
        dialogueBox.layer.cornerRadius = 10
        dialogueBox.backgroundColor = currentTheme.accent
        dialogueBox.clipsToBounds = true
        view.addSubview(dialogueBox)
        dialogueBox.translatesAutoresizingMaskIntoConstraints = false
        dialogueBox.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        dialogueBox.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        dialogueBox.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        dialogueBox.heightAnchor.constraint(equalToConstant: screenWidth * 0.9 + 220).isActive = true
        //MARK: Name Label
        dialogueBox.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: dialogueBox.topAnchor, constant: 2).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: dialogueBox.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: dialogueBox.trailingAnchor).isActive = true
        //MARK: - Text
        let textOverlay = UIView()
        textOverlay.backgroundColor = currentTheme.overlay
        textOverlay.layer.cornerRadius = 5
        textOverlay.layer.borderColor = UIColor.black.cgColor
        textOverlay.layer.borderWidth = 1
        dialogueBox.addSubview(textOverlay)
        textOverlay.translatesAutoresizingMaskIntoConstraints = false
        textOverlay.leadingAnchor.constraint(equalTo: dialogueBox.leadingAnchor, constant: 8).isActive = true
        textOverlay.trailingAnchor.constraint(equalTo: dialogueBox.trailingAnchor, constant: -8).isActive = true
        textOverlay.heightAnchor.constraint(equalToConstant: 150).isActive = true
        textOverlay.bottomAnchor.constraint(equalTo: dialogueBox.bottomAnchor, constant: -42).isActive = true
        
        dialogue.textAlignment = .natural
        dialogueBox.addSubview(dialogue)
        dialogue.translatesAutoresizingMaskIntoConstraints = false
        dialogue.leadingAnchor.constraint(equalTo: dialogueBox.leadingAnchor, constant: 10).isActive = true
        dialogue.trailingAnchor.constraint(equalTo: dialogueBox.trailingAnchor, constant: -10).isActive = true
        dialogue.topAnchor.constraint(equalTo: textOverlay.topAnchor, constant: 2).isActive = true
        //MARK: - Speaker
        speakerImage.contentMode = .scaleAspectFill
        speakerImage.layer.cornerRadius = 5
        speakerImage.clipsToBounds = true
        speakerImage.backgroundColor = currentTheme.background
        view.addSubview(speakerImage)
        speakerImage.translatesAutoresizingMaskIntoConstraints = false
        speakerImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        speakerImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        speakerImage.bottomAnchor.constraint(equalTo: textOverlay.topAnchor).isActive = true
        speakerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //MARK: - Buttons
        dialogueBox.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.bottomAnchor.constraint(equalTo: dialogueBox.bottomAnchor, constant: -6).isActive = true
        backButton.leadingAnchor.constraint(equalTo: dialogueBox.leadingAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        forwardButton.setTitle("NEXT>", for: .normal)
        dialogueBox.addSubview(forwardButton)
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.bottomAnchor.constraint(equalTo: dialogueBox.bottomAnchor, constant: -6).isActive = true
        forwardButton.trailingAnchor.constraint(equalTo: dialogueBox.trailingAnchor, constant: -8).isActive = true
        forwardButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        forwardButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        forwardButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        updateScene(0)
    }
}
