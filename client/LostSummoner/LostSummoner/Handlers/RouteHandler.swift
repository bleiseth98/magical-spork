//
//  RouteHandler.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation


class RouteHandler {
    static let shared = RouteHandler()
    
    //MARK: Tabs
    func sendToQuestArea(_ vc: BackgroundViewController) {
        vc.removeChildren()
        let child = QuestAreaViewController()
        vc.addChild(child)
        child.view.frame = vc.containerView.bounds
        vc.containerView.addSubview(child.view)
        child.didMove(toParent: vc)
    }
    
    func sendToDirectMessages() {
        
    }
    
    func sendToHome() {
        
    }
    
    func sendToOnlineList() {
        
    }
    
    func sendToShops() {
        
    }
    
    //MARK: Quest
    func sendToQuestList(_ vc: QuestAreaViewController) {
        let child = QuestListViewController()
        vc.addChild(child)
        child.view.frame = vc.view.bounds
        vc.view.addSubview(child.view)
        child.didMove(toParent: vc)
    }
        
}
