//
//  Background+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension BackgroundViewController {
    //MARK: Container
    func setupContainer() {
        view.backgroundColor = currentTheme.background
        containerView.backgroundColor = .clear
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: footerView.topAnchor).isActive = true
        
        let vc = ActiveLomonViewController()
        addChild(vc)
        vc.view.frame = self.containerView.bounds
        containerView.addSubview(vc.view)
        vc.didMove(toParent: self)
        /*
        DataHandler.shared.observeUserActiveGuard(completion: { data in
            vc.viewModel = data
        })
         */
        
    }
    //MARK: Player Info Bar
    func setupHeader() {
        var headerHeight = 0.00
        if screenHeight == 667 || screenHeight == 736 { headerHeight = screenHeight * 0.15 }
        else { headerHeight = screenHeight * headerHeightPercentage }
        headerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: headerHeight)
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        //::: Header Shadow Layer :::
        let shadows = UIView()
        shadows.frame = headerView.frame
        shadows.clipsToBounds = false
        headerView.addSubview(shadows)
        let shadowPath0 = UIBezierPath(roundedRect: shadows.bounds, cornerRadius: 10)
        let layer0 = CALayer()
        layer0.shadowPath = shadowPath0.cgPath
        layer0.shadowColor = currentTheme.shadow.cgColor
        layer0.shadowOpacity = 0.25
        layer0.shadowRadius = 2
        layer0.shadowOffset = CGSize(width: 0, height: 4)
        layer0.bounds = shadows.bounds
        layer0.position = shadows.center
        shadows.layer.addSublayer(layer0)
        let shapes = UIView()
        shapes.frame = headerView.frame
        shapes.clipsToBounds = true
        headerView.addSubview(shapes)
        headerBGLayer.backgroundColor = currentTheme.header.cgColor
        headerBGLayer.bounds = shapes.bounds
        headerBGLayer.position = shapes.center
        shapes.layer.addSublayer(headerBGLayer)
        shapes.layer.cornerRadius = 10
        //::: Rank View :::
        userRankView.backgroundColor = currentTheme.rankBG
        userRankView.layer.cornerRadius = 5
        headerView.addSubview(userRankView)
        userRankView.translatesAutoresizingMaskIntoConstraints = false
        userRankView.widthAnchor.constraint(equalToConstant: (headerHeight) / 2).isActive = true
        userRankView.heightAnchor.constraint(equalToConstant: (headerHeight) / 2).isActive = true
        userRankView.leadingAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        userRankView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        userRankLabel.font = UIFont(name: "RussoOne-Regular", size: 80)
        headerView.addSubview(userRankLabel)
        userRankLabel.translatesAutoresizingMaskIntoConstraints = false
        userRankLabel.leadingAnchor.constraint(equalTo: userRankView.leadingAnchor, constant: 4).isActive = true
        userRankLabel.trailingAnchor.constraint(equalTo: userRankView.trailingAnchor, constant: -4).isActive = true
        userRankLabel.topAnchor.constraint(equalTo: userRankView.topAnchor, constant: 4).isActive = true
        userRankLabel.bottomAnchor.constraint(equalTo: userRankView.bottomAnchor, constant: -4).isActive = true
        //::: Currency Views :::
        let moneyView = UIView()
        moneyView.backgroundColor = .clear
        headerView.addSubview(moneyView)
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        moneyView.widthAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        moneyView.heightAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        moneyView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8).isActive = true
        moneyView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8).isActive = true
        
        let moneyImage = UIImageView()
        moneyImage.image = UIImage(named: "icon_money")
        moneyImage.contentMode = .scaleAspectFit
        moneyView.addSubview(moneyImage)
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.topAnchor.constraint(equalTo: moneyView.topAnchor).isActive = true
        moneyImage.bottomAnchor.constraint(equalTo: moneyView.bottomAnchor).isActive = true
        moneyImage.leadingAnchor.constraint(equalTo: moneyView.leadingAnchor).isActive = true
        moneyImage.trailingAnchor.constraint(equalTo: moneyView.trailingAnchor).isActive = true
        
        let coinView = UIView()
        coinView.backgroundColor = .clear
        headerView.addSubview(coinView)
        coinView.translatesAutoresizingMaskIntoConstraints = false
        coinView.widthAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        coinView.heightAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        coinView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        coinView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8).isActive = true
        
        let coinsImage = UIImageView()
        coinsImage.image = UIImage(named: "icon_coins")
        coinsImage.contentMode = .scaleAspectFit
        coinView.addSubview(coinsImage)
        coinsImage.translatesAutoresizingMaskIntoConstraints = false
        coinsImage.topAnchor.constraint(equalTo: coinView.topAnchor).isActive = true
        coinsImage.bottomAnchor.constraint(equalTo: coinView.bottomAnchor).isActive = true
        coinsImage.leadingAnchor.constraint(equalTo: coinView.leadingAnchor).isActive = true
        coinsImage.trailingAnchor.constraint(equalTo: coinView.trailingAnchor).isActive = true
        
        let vipView = UIView()
        vipView.backgroundColor = .clear
        headerView.addSubview(vipView)
        vipView.translatesAutoresizingMaskIntoConstraints = false
        vipView.widthAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        vipView.heightAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        vipView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -screenWidth / 8).isActive = true
        vipView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8).isActive = true
        
        let vipImage = UIImageView()
        vipImage.image = UIImage(named: "icon_vip")
        vipImage.contentMode = .scaleAspectFit
        vipView.addSubview(vipImage)
        vipImage.translatesAutoresizingMaskIntoConstraints = false
        vipImage.topAnchor.constraint(equalTo: vipView.topAnchor).isActive = true
        vipImage.bottomAnchor.constraint(equalTo: vipView.bottomAnchor).isActive = true
        vipImage.leadingAnchor.constraint(equalTo: vipView.leadingAnchor).isActive = true
        vipImage.trailingAnchor.constraint(equalTo: vipView.trailingAnchor).isActive = true
        
        headerView.addSubview(moneyLabel)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.leadingAnchor.constraint(equalTo: moneyView.trailingAnchor, constant: 4).isActive = true
        moneyLabel.trailingAnchor.constraint(equalTo: coinView.leadingAnchor, constant: -4).isActive = true
        moneyLabel.centerYAnchor.constraint(equalTo: moneyView.centerYAnchor).isActive = true
        
        headerView.addSubview(coinLabel)
        coinLabel.translatesAutoresizingMaskIntoConstraints = false
        coinLabel.leadingAnchor.constraint(equalTo: coinView.trailingAnchor, constant: 4).isActive = true
        coinLabel.trailingAnchor.constraint(equalTo: vipView.leadingAnchor, constant: -4).isActive = true
        coinLabel.centerYAnchor.constraint(equalTo: coinView.centerYAnchor).isActive = true
        
        vipLabel.numberOfLines = 1
        vipLabel.adjustsFontSizeToFitWidth = true
        headerView.addSubview(vipLabel)
        vipLabel.translatesAutoresizingMaskIntoConstraints = false
        vipLabel.leadingAnchor.constraint(equalTo: vipView.trailingAnchor, constant: 4).isActive = true
        vipLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -4).isActive = true
        vipLabel.centerYAnchor.constraint(equalTo: vipView.centerYAnchor).isActive = true
        //::: Timer Views :::
        let bpView = UIView()
        bpView.backgroundColor = .clear
        headerView.addSubview(bpView)
        bpView.translatesAutoresizingMaskIntoConstraints = false
        bpView.widthAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        bpView.heightAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        bpView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -screenWidth / 8).isActive = true
        bpView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        let bpImage = UIImageView()
        bpImage.image = UIImage(named: "icon_bp")
        bpImage.contentMode = .scaleAspectFit
        bpView.addSubview(bpImage)
        bpImage.translatesAutoresizingMaskIntoConstraints = false
        bpImage.topAnchor.constraint(equalTo: bpView.topAnchor).isActive = true
        bpImage.bottomAnchor.constraint(equalTo: bpView.bottomAnchor).isActive = true
        bpImage.leadingAnchor.constraint(equalTo: bpView.leadingAnchor).isActive = true
        bpImage.trailingAnchor.constraint(equalTo: bpView.trailingAnchor).isActive = true
        
        let spView = UIView()
        spView.backgroundColor = .clear
        headerView.addSubview(spView)
        spView.translatesAutoresizingMaskIntoConstraints = false
        spView.widthAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        spView.heightAnchor.constraint(equalToConstant: headerHeight / 8).isActive = true
        spView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -screenWidth / 8).isActive = true
        spView.topAnchor.constraint(equalTo: bpView.bottomAnchor, constant: 8).isActive = true
        
        let spImage = UIImageView()
        spImage.image = UIImage(named: "icon_sp")
        spImage.contentMode = .scaleAspectFit
        spView.addSubview(spImage)
        spImage.translatesAutoresizingMaskIntoConstraints = false
        spImage.topAnchor.constraint(equalTo: spView.topAnchor).isActive = true
        spImage.bottomAnchor.constraint(equalTo: spView.bottomAnchor).isActive = true
        spImage.leadingAnchor.constraint(equalTo: spView.leadingAnchor).isActive = true
        spImage.trailingAnchor.constraint(equalTo: spView.trailingAnchor).isActive = true
        
        spLabel.numberOfLines = 1
        spLabel.adjustsFontSizeToFitWidth = true
        headerView.addSubview(spLabel)
        spLabel.translatesAutoresizingMaskIntoConstraints = false
        spLabel.leadingAnchor.constraint(equalTo: spView.trailingAnchor, constant: 4).isActive = true
        spLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -4).isActive = true
        spLabel.centerYAnchor.constraint(equalTo: spView.centerYAnchor).isActive = true
        
        bpLabel.numberOfLines = 1
        bpLabel.adjustsFontSizeToFitWidth = true
        headerView.addSubview(bpLabel)
        bpLabel.translatesAutoresizingMaskIntoConstraints = false
        bpLabel.leadingAnchor.constraint(equalTo: bpView.trailingAnchor, constant: 4).isActive = true
        bpLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -4).isActive = true
        bpLabel.centerYAnchor.constraint(equalTo: bpView.centerYAnchor).isActive = true
        //::: Progress Views :::
        progressEmptyView.layer.backgroundColor = currentTheme.expBG.cgColor
        progressEmptyView.layer.cornerRadius = 3
        headerView.addSubview(progressEmptyView)
        progressEmptyView.translatesAutoresizingMaskIntoConstraints = false
        progressEmptyView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8).isActive = true
        progressEmptyView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        progressEmptyView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: (headerHeight / 2) + 16).isActive = true
        progressEmptyView.bottomAnchor.constraint(equalTo: userRankView.bottomAnchor).isActive = true
        
        progressLabel.font = UIFont(name: "RussoOne-Regular", size: 10)
        progressLabel.textAlignment = .center
        headerView.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.leadingAnchor.constraint(equalTo: progressEmptyView.leadingAnchor).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: progressEmptyView.trailingAnchor).isActive = true
        progressLabel.bottomAnchor.constraint(equalTo: progressEmptyView.topAnchor, constant: -2).isActive = true
        
        progressFillView.layer.backgroundColor = currentTheme.expFill.cgColor
        progressFillView.layer.cornerRadius = 3
        progressEmptyView.addSubview(progressFillView)
        progressFillView.translatesAutoresizingMaskIntoConstraints = false
        progressFillView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        progressFillView.leadingAnchor.constraint(equalTo: progressEmptyView.leadingAnchor).isActive = true
        progressFillView.topAnchor.constraint(equalTo: progressEmptyView.topAnchor).isActive = true
        progressFillWidth = progressFillView.widthAnchor.constraint(equalToConstant: 0)
        
        headerView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: userRankView.trailingAnchor, constant: 4).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: bpView.leadingAnchor, constant: -4).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: userRankView.centerYAnchor).isActive = true
        
        headerButton.backgroundColor = .clear
        headerView.addSubview(headerButton)
        headerButton.translatesAutoresizingMaskIntoConstraints = false
        headerButton.topAnchor.constraint(equalTo: headerView.topAnchor).isActive = true
        headerButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        headerButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        headerButton.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -2).isActive = true
        
        headerButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
    }
    //MARK: Tab Bar
    func setupFooter() {
        footerView.backgroundColor = currentTheme.footer
        footerView.layer.cornerRadius = 5
        view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: screenHeight * footerHeightPercentage).isActive = true
        //MARK: Quest Button
        questButtonView.layer.cornerRadius = 5
        footerView.addSubview(questButtonView)
        questButtonView.translatesAutoresizingMaskIntoConstraints = false
        questButtonView.widthAnchor.constraint(equalToConstant: (screenWidth - 16) / 5).isActive = true
        questButtonView.heightAnchor.constraint(equalToConstant: screenHeight * footerHeightPercentage).isActive = true
        questButtonView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 0).isActive = true
        questButtonView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 4).isActive = true
        
        
        let questImage = UIImageView()
        questImage.image = UIImage(named: "icon_quest")
        questImage.contentMode = .scaleAspectFit
        questButtonView.addSubview(questImage)
        questImage.translatesAutoresizingMaskIntoConstraints = false
        questImage.topAnchor.constraint(equalTo: questButtonView.topAnchor, constant: 6).isActive = true
        questImage.bottomAnchor.constraint(equalTo: questButtonView.bottomAnchor, constant: -6).isActive = true
        questImage.leadingAnchor.constraint(equalTo: questButtonView.leadingAnchor, constant: 6).isActive = true
        questImage.trailingAnchor.constraint(equalTo: questButtonView.trailingAnchor, constant: -6).isActive = true
        
        let questButton = UIButton()
        questButton.backgroundColor = currentTheme.overlay
        questButton.layer.cornerRadius = 5
        questButton.setTitle("", for: .normal)
        questButtonView.addSubview(questButton)
        questButton.translatesAutoresizingMaskIntoConstraints = false
        questButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        questButton.leadingAnchor.constraint(equalTo: questButtonView.leadingAnchor).isActive = true
        questButton.trailingAnchor.constraint(equalTo: questButtonView.trailingAnchor).isActive = true
        questButton.topAnchor.constraint(equalTo: questButtonView.topAnchor, constant: 2).isActive = true
        //MARK: Chat Button
        chatButtonView.layer.cornerRadius = 5
        footerView.addSubview(chatButtonView)
        chatButtonView.translatesAutoresizingMaskIntoConstraints = false
        chatButtonView.widthAnchor.constraint(equalToConstant: (screenWidth - 16) / 5).isActive = true
        chatButtonView.heightAnchor.constraint(equalToConstant: screenHeight * 0.112767).isActive = true
        chatButtonView.leadingAnchor.constraint(equalTo: questButtonView.trailingAnchor, constant: 4).isActive = true
        chatButtonView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 4).isActive = true
        
        let chatImage = UIImageView()
        chatImage.image = UIImage(named: "icon_chat")
        chatImage.contentMode = .scaleAspectFit
        chatButtonView.addSubview(chatImage)
        chatImage.translatesAutoresizingMaskIntoConstraints = false
        chatImage.topAnchor.constraint(equalTo: chatButtonView.topAnchor, constant: 2).isActive = true
        chatImage.bottomAnchor.constraint(equalTo: chatButtonView.bottomAnchor, constant: -2).isActive = true
        chatImage.leadingAnchor.constraint(equalTo: chatButtonView.leadingAnchor, constant: 2).isActive = true
        chatImage.trailingAnchor.constraint(equalTo: chatButtonView.trailingAnchor, constant: -2).isActive = true
        
        chatLabel.textColor = .black
        chatLabel.textAlignment = .center
        chatLabel.adjustsFontSizeToFitWidth = true
        chatLabel.font = UIFont(name: "RussoOne-Regular", size: 36)
        chatButtonView.addSubview(chatLabel)
        chatLabel.translatesAutoresizingMaskIntoConstraints = false
        chatLabel.centerXAnchor.constraint(equalTo: chatImage.centerXAnchor, constant: 0).isActive = true
        chatLabel.centerYAnchor.constraint(equalTo: chatImage.centerYAnchor, constant: -4).isActive = true
        chatLabel.widthAnchor.constraint(equalTo: chatImage.widthAnchor, constant: -12).isActive = true
        chatLabel.heightAnchor.constraint(equalTo: chatImage.heightAnchor, multiplier: 0.5).isActive = true
        
        let chatButton = UIButton()
        chatButton.backgroundColor = currentTheme.overlay
        chatButton.layer.cornerRadius = 5
        chatButton.setTitle("", for: .normal)
        view.addSubview(chatButton)
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        chatButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        chatButton.leadingAnchor.constraint(equalTo: chatButtonView.leadingAnchor).isActive = true
        chatButton.trailingAnchor.constraint(equalTo: chatButtonView.trailingAnchor).isActive = true
        chatButton.topAnchor.constraint(equalTo: chatButtonView.topAnchor, constant: 2).isActive = true
        //MARK: Home Button
        homeButtonView.layer.cornerRadius = 5
        footerView.addSubview(homeButtonView)
        homeButtonView.translatesAutoresizingMaskIntoConstraints = false
        homeButtonView.widthAnchor.constraint(equalToConstant: (screenWidth - 16) / 5).isActive = true
        homeButtonView.heightAnchor.constraint(equalToConstant: screenHeight * 0.112767).isActive = true
        homeButtonView.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        homeButtonView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 4).isActive = true
        
        let homeImage = UIImageView()
        homeImage.image = UIImage(named: "icon_home")
        homeImage.contentMode = .scaleAspectFit
        homeButtonView.addSubview(homeImage)
        homeImage.translatesAutoresizingMaskIntoConstraints = false
        homeImage.topAnchor.constraint(equalTo: homeButtonView.topAnchor, constant: 2).isActive = true
        homeImage.bottomAnchor.constraint(equalTo: homeButtonView.bottomAnchor).isActive = true
        homeImage.leadingAnchor.constraint(equalTo: homeButtonView.leadingAnchor).isActive = true
        homeImage.trailingAnchor.constraint(equalTo: homeButtonView.trailingAnchor).isActive = true
        
        let homeButton = UIButton()
        homeButton.backgroundColor = currentTheme.overlay
        homeButton.layer.cornerRadius = 5
        homeButton.setTitle("", for: .normal)
        view.addSubview(homeButton)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: homeButtonView.leadingAnchor).isActive = true
        homeButton.trailingAnchor.constraint(equalTo: homeButtonView.trailingAnchor).isActive = true
        homeButton.topAnchor.constraint(equalTo: homeButtonView.topAnchor, constant: 2).isActive = true
        //MARK: Fight Button
        fightButtonView.layer.cornerRadius = 5
        footerView.addSubview(fightButtonView)
        fightButtonView.translatesAutoresizingMaskIntoConstraints = false
        fightButtonView.widthAnchor.constraint(equalToConstant: (screenWidth - 16) / 5).isActive = true
        fightButtonView.heightAnchor.constraint(equalToConstant: screenHeight * 0.112767).isActive = true
        fightButtonView.leadingAnchor.constraint(equalTo: homeButtonView.trailingAnchor, constant: 4).isActive = true
        fightButtonView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 4).isActive = true
        
        let fightImage = UIImageView()
        fightImage.image = UIImage(named: "icon_fight")
        fightImage.contentMode = .scaleAspectFit
        fightButtonView.addSubview(fightImage)
        fightImage.translatesAutoresizingMaskIntoConstraints = false
        fightImage.topAnchor.constraint(equalTo: fightButtonView.topAnchor, constant: 2).isActive = true
        fightImage.bottomAnchor.constraint(equalTo: fightButtonView.bottomAnchor, constant: -2).isActive = true
        fightImage.leadingAnchor.constraint(equalTo: fightButtonView.leadingAnchor, constant: 2).isActive = true
        fightImage.trailingAnchor.constraint(equalTo: fightButtonView.trailingAnchor, constant: -2).isActive = true
        
        let fightButton = UIButton()
        fightButton.backgroundColor = currentTheme.overlay
        fightButton.layer.cornerRadius = 5
        fightButton.setTitle("", for: .normal)
        view.addSubview(fightButton)
        fightButton.translatesAutoresizingMaskIntoConstraints = false
        fightButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        fightButton.leadingAnchor.constraint(equalTo: fightButtonView.leadingAnchor).isActive = true
        fightButton.trailingAnchor.constraint(equalTo: fightButtonView.trailingAnchor).isActive = true
        fightButton.topAnchor.constraint(equalTo: fightButtonView.topAnchor, constant: 2).isActive = true
        //MARK: Shop Button
        shopButtonView.layer.cornerRadius = 5
        footerView.addSubview(shopButtonView)
        shopButtonView.translatesAutoresizingMaskIntoConstraints = false
        shopButtonView.widthAnchor.constraint(equalToConstant: (screenWidth - 16) / 5).isActive = true
        shopButtonView.heightAnchor.constraint(equalToConstant: screenHeight * 0.112767).isActive = true
        shopButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shopButtonView.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 4).isActive = true
        
        let shopImage = UIImageView()
        shopImage.image = UIImage(named: "icon_shop")
        shopImage.contentMode = .scaleAspectFit
        shopButtonView.addSubview(shopImage)
        shopImage.translatesAutoresizingMaskIntoConstraints = false
        shopImage.topAnchor.constraint(equalTo: shopButtonView.topAnchor, constant: 4).isActive = true
        shopImage.bottomAnchor.constraint(equalTo: shopButtonView.bottomAnchor, constant: -4).isActive = true
        shopImage.leadingAnchor.constraint(equalTo: shopButtonView.leadingAnchor, constant: 4).isActive = true
        shopImage.trailingAnchor.constraint(equalTo: shopButtonView.trailingAnchor, constant: -4).isActive = true
        
        let shopButton = UIButton()
        shopButton.backgroundColor = currentTheme.overlay
        shopButton.layer.cornerRadius = 5
        shopButton.setTitle("", for: .normal)
        view.addSubview(shopButton)
        shopButton.translatesAutoresizingMaskIntoConstraints = false
        shopButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        shopButton.leadingAnchor.constraint(equalTo: shopButtonView.leadingAnchor).isActive = true
        shopButton.trailingAnchor.constraint(equalTo: shopButtonView.trailingAnchor).isActive = true
        shopButton.topAnchor.constraint(equalTo: shopButtonView.topAnchor, constant: 2).isActive = true
        //MARK: Actions
        questButton.addTarget(self, action: #selector(questTapped), for: .touchUpInside)
        chatButton.addTarget(self, action: #selector(chatTapped), for: .touchUpInside)
        homeButton.addTarget(self, action: #selector(homeTapped), for: .touchUpInside)
        fightButton.addTarget(self, action: #selector(fightTapped), for: .touchUpInside)
        shopButton.addTarget(self, action: #selector(shopTapped), for: .touchUpInside)
    }
}
