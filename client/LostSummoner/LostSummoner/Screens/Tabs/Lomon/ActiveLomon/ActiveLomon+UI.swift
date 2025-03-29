//
//  ActiveLomon+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension ActiveLomonViewController {
    //MARK: Base UI
    func setUI() {
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            view.addSubview(backgroundView)
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            //::: Name :::
            view.addSubview(nameLabel)
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.widthAnchor.constraint(equalToConstant: screenWidth - 152).isActive = true
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            //::: Ground/Guard :::
            view.addSubview(groundImage)
            groundImage.translatesAutoresizingMaskIntoConstraints = false
            groundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            groundImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            groundImage.heightAnchor.constraint(equalTo: groundImage.widthAnchor, multiplier: 0.20).isActive = true
            view.addSubview(guardImage)
            guardImage.translatesAutoresizingMaskIntoConstraints = false
            guardImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            guardImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
            guardImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
            guardImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            groundImage.bottomAnchor.constraint(equalTo: guardImage.bottomAnchor, constant: screenWidth * 0.25).isActive = true
            //::: Button :::
            guardButton.backgroundColor = .clear
            guardButton.addTarget(self, action: #selector(guardTapped), for: .touchUpInside)
            view.addSubview(guardButton)
            guardButton.translatesAutoresizingMaskIntoConstraints = false
            guardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            guardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            guardButton.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
            guardButton.bottomAnchor.constraint(equalTo: groundImage.bottomAnchor).isActive = true
            //::: Skill 3 :::
            view.addSubview(skill3Image)
            skill3Image.translatesAutoresizingMaskIntoConstraints = false
            skill3Image.heightAnchor.constraint(equalToConstant: 25).isActive = true
            skill3Image.widthAnchor.constraint(equalToConstant: 25).isActive = true
            skill3Image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
            skill3Image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
            //::: Skill 2 :::
            view.addSubview(skill2Image)
            skill2Image.translatesAutoresizingMaskIntoConstraints = false
            skill2Image.heightAnchor.constraint(equalToConstant: 25).isActive = true
            skill2Image.widthAnchor.constraint(equalToConstant: 25).isActive = true
            skill2Image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
            skill2Image.trailingAnchor.constraint(equalTo: skill3Image.leadingAnchor, constant: -8).isActive = true
            //::: Skill 1 :::
            view.addSubview(skill1Image)
            skill1Image.translatesAutoresizingMaskIntoConstraints = false
            skill1Image.heightAnchor.constraint(equalToConstant: 25).isActive = true
            skill1Image.widthAnchor.constraint(equalToConstant: 25).isActive = true
            skill1Image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
            skill1Image.trailingAnchor.constraint(equalTo: skill2Image.leadingAnchor, constant: -8).isActive = true
            //::: Rune :::
            runeImage.layer.borderColor = currentTheme.accent.cgColor
            runeImage.layer.borderWidth = 1
            runeImage.layer.cornerRadius = 5
            view.addSubview(runeImage)
            runeImage.translatesAutoresizingMaskIntoConstraints = false
            runeImage.trailingAnchor.constraint(equalTo: skill1Image.leadingAnchor, constant: -8).isActive = true
            runeImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
            runeImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
            runeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
            //::: Ability :::
            abilityLabel.numberOfLines = 1
            view.addSubview(abilityLabel)
            abilityLabel.translatesAutoresizingMaskIntoConstraints = false
            abilityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
            abilityLabel.bottomAnchor.constraint(equalTo: skill3Image.topAnchor, constant: -8).isActive = true
            view.addSubview(talentLabel)
            talentLabel.translatesAutoresizingMaskIntoConstraints = false
            talentLabel.trailingAnchor.constraint(equalTo: abilityLabel.trailingAnchor).isActive = true
            talentLabel.bottomAnchor.constraint(equalTo: abilityLabel.topAnchor, constant: -8).isActive = true
            //::: Stat View :::
            createStatView()
            
        animateGuardBounce(guardImage, originFrame: guardOrigin)
        }
    //MARK: Stat View
    func calculateStatWidth(stat: Int) -> CGFloat {
        /*
        let maxWidth = 110
        let minWidth = 5
        let avgStat = (guardAttacks[selectedGuardIndex] + guardDefenses[selectedGuardIndex] + guardMAttacks[selectedGuardIndex] + guardMDefenses[selectedGuardIndex] + guardSpeeds[selectedGuardIndex] + guardIntelligences[selectedGuardIndex]) / 4
        let widthPercentage: CGFloat = CGFloat(stat) / CGFloat(avgStat)
        var width: CGFloat = 110 * widthPercentage
        if width > 110 { width = CGFloat(maxWidth) }
        if width < 5 { width = CGFloat(minWidth) }
        return width
         */
        return 77
    }
    
    func createStatView() {
        statView?.removeFromSuperview()
        let makeInfoView = UIView.makeGuardInfo(rank: rankLabel, health: healthLabel)
        statView = makeInfoView.0
        let barWidthDict = makeInfoView.1
        view.addSubview(statView!)
        statView!.translatesAutoresizingMaskIntoConstraints = false
        statView!.widthAnchor.constraint(equalToConstant: 132).isActive = true
        statView!.heightAnchor.constraint(equalToConstant: 140).isActive = true
        statView!.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        statView!.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        atkBarWidth = barWidthDict["atk"]!
        defBarWidth = barWidthDict["def"]!
        matkBarWidth = barWidthDict["matk"]!
        mdefBarWidth = barWidthDict["mdef"]!
        spdBarWidth = barWidthDict["spd"]!
        intBarWidth = barWidthDict["int"]!
        atkBarWidth.constant = 77 //calculateStatWidth(stat: guardAttacks[selectedGuardIndex])
        defBarWidth.constant = 77 //calculateStatWidth(stat: guardDefenses[selectedGuardIndex])
        matkBarWidth.constant = 77 //calculateStatWidth(stat: guardMAttacks[selectedGuardIndex])
        mdefBarWidth.constant = 77 //calculateStatWidth(stat: guardMDefenses[selectedGuardIndex])
        spdBarWidth.constant = 77 //calculateStatWidth(stat: guardSpeeds[selectedGuardIndex])
        intBarWidth.constant = 77 //calculateStatWidth(stat: guardIntelligences[selectedGuardIndex])
        atkBarWidth.isActive = true
        defBarWidth.isActive = true
        matkBarWidth.isActive = true
        mdefBarWidth.isActive = true
        spdBarWidth.isActive = true
        intBarWidth.isActive = true
    }
}
