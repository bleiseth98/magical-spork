//
//  Background+Actions.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation

extension BackgroundViewController {
    @objc func questTapped() {
        print("quest tapped")
        RouteHandler.shared.sendToQuestArea(self)
    }

    @objc func chatTapped() {
        print("chat tapped")
    }

    @objc func homeTapped() {
        print("home tapped")
    }

    @objc func fightTapped() {
        print("fight tapped")
    }

    @objc func shopTapped() {
        print("shop tapped")
    }

    @objc func profileTapped() {
        print("profile tapped")
    }
    
    
}
