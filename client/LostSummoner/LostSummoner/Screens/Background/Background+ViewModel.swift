//
//  Background+ViewModel.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

class HeaderFooterViewModel {
    
    // MARK: - Header Properties
    
    var userRank: String
    var progressValue: Float {
        didSet {
            updateProgressText()
        }
    }
    private(set) var progressText: String
    var userName: String
    var money: String
    var coin: String
    var vip: String
    var sp: String
    var bp: String
    
    // MARK: - Footer State
    
    private(set) var hasNewMessage: Bool {
        didSet {
            onNewMessageStatusChanged?(hasNewMessage)
        }
    }
    
    // MARK: - Bindings
    
    var onProgressUpdated: ((Float, String) -> Void)?
    var onNewMessageStatusChanged: ((Bool) -> Void)?
    
    // MARK: - Init
    
    init(
        userRank: String = "",
        progressValue: Float = 0.0,
        userName: String = "",
        money: String = "",
        coin: String = "",
        vip: String = "",
        sp: String = "",
        bp: String = "",
        hasNewMessage: Bool = false
    ) {
        self.userRank = userRank
        self.progressValue = progressValue
        self.progressText = "\(Int(progressValue * 100))%"
        self.userName = userName
        self.money = money
        self.coin = coin
        self.vip = vip
        self.sp = sp
        self.bp = bp
        self.hasNewMessage = hasNewMessage
    }
    
    // MARK: - Logic
    
    func updateProgress(to value: Float) {
        progressValue = min(max(value, 0.0), 1.0)
        onProgressUpdated?(progressValue, progressText)
    }
    
    private func updateProgressText() {
        progressText = "\(Int(progressValue * 100))%"
    }
    
    func setNewMessageStatus(_ hasNew: Bool) {
        hasNewMessage = hasNew
    }
}

