//
//  ActiveLomonViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit

class ActiveLomonViewController: UIViewController {
    //::: UIKit Source :::
    let guardButton = UIButton()
    let nameLabel = UILabel.title(text: "")
    let rankLabel = UILabel.header(text: "")
    let healthLabel = UILabel.header(text: "")
    let abilityLabel = UILabel.body(text: "TERAFORM")
    let talentLabel = UILabel.body(text:"NO TALENT")
    var atkBarWidth = NSLayoutConstraint()
    var defBarWidth = NSLayoutConstraint()
    var matkBarWidth = NSLayoutConstraint()
    var mdefBarWidth = NSLayoutConstraint()
    var spdBarWidth = NSLayoutConstraint()
    var intBarWidth = NSLayoutConstraint()
    let guardImage = UIImageView()
    let groundImage = UIImageView()
    let skill1Image = UIImageView()
    let skill2Image = UIImageView()
    let skill3Image = UIImageView()
    let runeImage = UIImageView()
    var statView: UIView?
    var guardOrigin = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        guardImage.image = UIImage(named: "mossanda")
        groundImage.image = UIImage(named: "ground_earth")
    }
    

    

}
