//
//  ActiveLomon+Actions.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation

extension ActiveLomonViewController {
    //MARK: Actions
    @objc func guardTapped() {
        //RouteHandler.shared.sendToGuards(self.parent as! BackgroundViewController)
    }
    @objc func pauseAnimation() {
        guardImage.layer.removeAllAnimations()
    }
    
    @objc func resumeAnimation() {
        animateGuardBounce(guardImage, originFrame: guardOrigin)
    }
    
    @objc func updateGuard() {
        /*
        guard let lomon = viewModel else { return }
        guardImage.image = UIImage(named: lomon.name)
        nameLabel.text = lomon.nickname ?? lomon.name
        rankLabel.text = "\(lomon.level)"
        healthLabel.text = "\(lomon.stats.health)"
        talentLabel.text = lomon.talent?.name.uppercased() ?? ""
        abilityLabel.text = lomon.ability?.name.uppercased() ?? ""
        groundImage.image = UIImage(named: "ground_\(lomon.element.rawValue)")
        skill1Image.image = UIImage(named: "skill_\(lomon.skills[0].element.rawValue)")
        skill2Image.image = UIImage(named: "skill_\(lomon.skills[1].element.rawValue)")
        skill3Image.image = UIImage(named: "skill_\(lomon.skills[2].element.rawValue)")
        runeImage.image = UIImage(named: "rune_def3")
        let data = lomon.getStatsAndWidths()
        let atk = data["atk"]!
        atkBarWidth.constant = atk.values.first ?? 5
        let def = data["def"]!
        defBarWidth.constant = def.values.first ?? 5
        let mtk = data["mtk"]!
        matkBarWidth.constant = mtk.values.first ?? 5
        let mdf = data["mdf"]!
        mdefBarWidth.constant = mdf.values.first ?? 5
        let spd = data["spd"]!
        spdBarWidth.constant = spd.values.first ?? 5
        let int = data["int"]!
        intBarWidth.constant = int.values.first ?? 5
        atkBarWidth.isActive = true
        defBarWidth.isActive = true
        matkBarWidth.isActive = true
        mdefBarWidth.isActive = true
        spdBarWidth.isActive = true
        intBarWidth.isActive = true
        */
    }
    
    @objc func themeChanged() {
        createStatView()
        rankLabel.textColor = currentTheme.title
        healthLabel.textColor = currentTheme.title
        abilityLabel.textColor = currentTheme.body
        talentLabel.textColor = currentTheme.body
    }
}
