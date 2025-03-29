//
//  ViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit

class BackgroundViewController: UIViewController {
    //::: Header Elements :::
    var headerView = UIView()
    var headerBGLayer = CALayer()
    let headerButton = UIButton()
    let userRankView = UIView()
    let userRankLabel = UILabel.title(text: "")
    let progressEmptyView = UIView()
    let progressFillView = UIView()
    var progressFillWidth: NSLayoutConstraint!
    let progressLabel = UILabel.body(text: "")
    let nameLabel = UILabel.title(text: "")
    let moneyLabel = UILabel.body(text: "")
    let coinLabel = UILabel.body(text: "")
    let vipLabel = UILabel.body(text: "")
    let spLabel = UILabel.body(text: "")
    let bpLabel = UILabel.body(text: "")
    //::: Footer Elements :::
    let footerView = UIView()
    let questButtonView = UIView()
    let questButton = UIButton()
    let chatButtonView = UIView()
    let chatLabel = UILabel.body(text: "!")
    let chatButton = UIButton()
    let homeButtonView = UIView()
    let homeButton = UIButton()
    let fightButtonView = UIView()
    let fightButton = UIButton()
    let shopButtonView = UIView()
    let shopButton = UIButton()
    //::: Container :::
    let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = currentTheme.background
        setupHeader()
        setupFooter()
        setupContainer()
    }
    
    //MARK: Navigation
    func removeChildren() {
        print(children.count)
        let home = children[0]
        print(home)
        for vc in children {
            if vc != home {
                vc.willMove(toParent: vc.parent)
                vc.view.removeFromSuperview()
                vc.removeFromParent() }
            //else { NotificationHandler.shared.postNotification(.shouldResumeAnimation, data: nil) }
        }
        for homeChild in home.children {
            print("removing child: \(homeChild), count: \(home.children.count)")
            homeChild.willMove(toParent: homeChild.parent)
            homeChild.view.removeFromSuperview()
            homeChild.removeFromParent() }
        if home.children.count == 0 {
            print("child count is 0")
            //NotificationHandler.shared.postNotification(.shouldResumeAnimation, data: nil)
        }
         
    }


}

