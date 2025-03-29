//
//  Extensions.swift
//  Lost-Summoner
//
//  Created by Bailey Leiseth on 12/25/23.
//

import Foundation
import UIKit
//MARK: Foundation Elements
/// ::: Date :::
///--init(timestamp)
///--timestamp -> TimeInterval
/// ::: Array ::
///--appendUnique           | only adds unique entries
///--removeDuplicates
///remove(Element)          | removes **first** instance of Element
//MARK: - Date
extension Date {
    init(timestamp: TimeInterval) {
        self.init(timeIntervalSince1970: timestamp)
    }
    
    func timestamp() -> TimeInterval {
        return self.timeIntervalSince1970
    }
    
    static func convertTime(_ time: TimeInterval) -> String {
        //let currentTime = Date().timeIntervalSince1970
        let restoredTime = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy HH:mm"
        let dateString = dateFormatter.string(from: restoredTime)
        return dateString
    }

    static func convertTimeGroup(_ time: TimeInterval) -> String {
        //let currentTime = Date().timeIntervalSince1970
        let restoredTime = Date(timeIntervalSince1970: time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yy"
        let dateString = dateFormatter.string(from: restoredTime)
        return dateString
    }
}
//MARK: Array
extension Array where Element: Hashable {
    mutating func appendUnique(_ element: Element) {
        var array = self
        if !array.contains(element) {
            array.append(element)
        }
        self = array
    }
    
    mutating func removeDuplicates() {
        var array: [Element] = []
        for element in self {
            if !array.contains(element) {
                array.append(element)
            }
        }
        self = array
    }
    
    mutating func remove(_ element: Element) {
        var array = self
        while let index = array.firstIndex(of: element) {
            array.remove(at: index)
        }
        self = array
    }
}
//MARK: - UIKit Elements
/// ::: UIViewController :::
///--hideKeyboardWhenTappedAround
///--dismissKeyboard
///--sendBack                                               | dismisess childVC and send back to parentVC
///--animateGuardBounce
/// ::: UIButton :::
///--standard                                                | creates standard 60x30 button
///--standardLong                                        | creates standard 2/3 screen width x30 button
/// ::: UILabel :::
///-- body                          | creates 12pt text
///--shadowedBody           | creates shadowed 12pt text
///--subheader                  | creates 14pt text
///--header                         | creates shadowed 18pt text
///--title                              | creates shadowed 24pt (adjustable) text
///--rank                            | creates shadowed 60pt (adjustable) text
/// ::: UIColor :::
///--hex with optional opacity          | creates UIColor from 6-8digit #hex color
/// ::: UITableView :::
///--scrollToBottom
///--scrollToTop
///--hasRowAtIndex
///--registerCell
///--dequeueTypedCell
/// ::: UIView :::
///--makeGuardInfo(NSLayoutConstraint, NSLayoutConstraint) -> UIView
//MARK: - UIViewController
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func sendBack() {
        willMove(toParent: parent)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    func animateGuardBounce(_ image: UIImageView, originFrame: CGRect) {
        image.frame = originFrame
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: [.repeat, .autoreverse, .beginFromCurrentState], animations: {
            var frame = originFrame
            frame.origin.y -= (screenWidth * 0.2)
            image.frame = frame
        })
    }
}
//MARK: - UIButton
extension UIButton {
    class func standard() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        button.backgroundColor = currentTheme.buttonFill
        button.layer.borderColor = currentTheme.buttonBorder.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowColor = currentTheme.shadow.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.7
        button.setTitle("<BACK", for: .normal)
        button.titleLabel?.font = UIFont(name: "RussoOne-Regular", size: 12)
        button.setTitleColor(currentTheme.body, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        return button
    }
    class func standardLong() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: screenWidth * 0.66, height: 30)
        button.backgroundColor = currentTheme.buttonFill
        button.layer.borderColor = currentTheme.buttonBorder.cgColor
        button.layer.borderWidth = 3
        button.layer.cornerRadius = 5
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.5
        button.setTitle("<BACK", for: .normal)
        button.titleLabel?.font = UIFont(name: "RussoOne-Regular", size: 12)
        button.setTitleColor(currentTheme.body, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
        return button
    }
    
    func showTap() {
        UIView.animate(withDuration: 0.5, animations: { self.alpha = 0.5 }) { _ in
            UIView.animate(withDuration: 0.5, animations: { self.alpha = 1.0 })
        }
    }
}
//MARK: - UILabel
extension UILabel {
    class func body(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.body
        label.adjustsFontSizeToFitWidth = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "RussoOne-Regular", size: 12)
        return label
    }
    
    class func shadowedBody(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.body
        label.shadowColor = .white
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.adjustsFontSizeToFitWidth = false
        label.numberOfLines = 1
        label.font = UIFont(name: "RussoOne-Regular", size: 12)
        return label
    }
    
    class func subheader(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.body
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.font = UIFont(name: "RussoOne-Regular", size: 14)
        return label
    }
    
    class func header(text: String) ->UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.title
        label.shadowColor = currentTheme.shadow
        label.shadowOffset = CGSize(width: 1, height: 1)
        label.adjustsFontSizeToFitWidth = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "RussoOne-Regular", size: 18)
        return label
    }
    
    class func title(text: String) ->UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.title
        label.shadowColor = currentTheme.shadow
        label.shadowOffset = CGSize(width: 2, height: 1)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.font = UIFont(name: "RussoOne-Regular", size: 24)
        return label
    }
    
    class func rank(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = currentTheme.title
        label.shadowColor = currentTheme.shadow
        label.shadowOffset = CGSize(width: 2, height: 1)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byClipping
        label.font = UIFont(name: "RussoOne-Regular", size: 60)
        return label
    }
}
//MARK: - UIColor
extension UIColor {
    public convenience init?(hex: String, opacity: CGFloat? = nil) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            var hexColor = String(hex[start...])
            if hexColor.count == 6 && opacity == nil {
                hexColor += "FF"
            } else if opacity != nil {
                hexColor += String(format: "%02X", Int(opacity! * 255))
            }
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
//MARK: - UITableView
extension UITableView {
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(
                row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                section: self.numberOfSections - 1)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
        }
    }
    
    func scrollToTop() {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: false)
            }
        }
    }
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    
    func registerCell(ofType cellType: UITableViewCell.Type) {
        let name = String(describing: cellType.self)
        register(cellType.self, forCellReuseIdentifier: name)
    }
    
    func dequeueTypedCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: String(describing: T.self),
                                   for: indexPath) as! T
    }
}
//MARK: - UIView
extension UIView {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 3)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
    }
   
    class func makeGuardInfo(rank: UILabel, health: UILabel) -> (UIView, [String:NSLayoutConstraint]) {
        print("stat bar with theme: \(currentTheme.key)")
        let completeView = UIView()
        var barWidthDict: [String:NSLayoutConstraint] = [:]
        let statView = UIView()
        completeView.addSubview(statView)
        statView.translatesAutoresizingMaskIntoConstraints = false
        statView.widthAnchor.constraint(equalToConstant: 132).isActive = true
        statView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        statView.leadingAnchor.constraint(equalTo: completeView.leadingAnchor).isActive = true
        statView.bottomAnchor.constraint(equalTo: completeView.bottomAnchor).isActive = true
        ///MARK: - Static Int
        let staticInt = UILabel.body(text: "INT")
        statView.addSubview(staticInt)
        staticInt.translatesAutoresizingMaskIntoConstraints = false
        staticInt.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticInt.bottomAnchor.constraint(equalTo: statView.bottomAnchor, constant: -8).isActive = true
        let staticSpd = UILabel.body(text: "SPD")
        statView.addSubview(staticSpd)
        staticSpd.translatesAutoresizingMaskIntoConstraints = false
        staticSpd.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticSpd.bottomAnchor.constraint(equalTo: staticInt.topAnchor).isActive = true
        let staticMdf = UILabel.body(text: "MDF")
        statView.addSubview(staticMdf)
        staticMdf.translatesAutoresizingMaskIntoConstraints = false
        staticMdf.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticMdf.bottomAnchor.constraint(equalTo: staticSpd.topAnchor).isActive = true
        let staticMtk = UILabel.body(text: "MTK")
        statView.addSubview(staticMtk)
        staticMtk.translatesAutoresizingMaskIntoConstraints = false
        staticMtk.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticMtk.bottomAnchor.constraint(equalTo: staticMdf.topAnchor).isActive = true
        let staticDef = UILabel.body(text: "DEF")
        statView.addSubview(staticDef)
        staticDef.translatesAutoresizingMaskIntoConstraints = false
        staticDef.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticDef.bottomAnchor.constraint(equalTo: staticMtk.topAnchor).isActive = true
        let staticAtk = UILabel.body(text: "ATK")
        statView.addSubview(staticAtk)
        staticAtk.translatesAutoresizingMaskIntoConstraints = false
        staticAtk.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        staticAtk.bottomAnchor.constraint(equalTo: staticDef.topAnchor).isActive = true
        ///MARK: - Attack
        let atkBar = UIView()
        atkBar.backgroundColor = currentTheme.buttonFill
        atkBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        atkBar.layer.borderWidth = 1
        atkBar.layer.cornerRadius = 2
        statView.addSubview(atkBar)
        atkBar.translatesAutoresizingMaskIntoConstraints = false
        atkBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        atkBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        atkBar.centerYAnchor.constraint(equalTo: staticAtk.centerYAnchor).isActive = true
        barWidthDict["atk"] = atkBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Defense
        let defBar = UIView()
        defBar.backgroundColor = currentTheme.buttonFill
        defBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        defBar.layer.borderWidth = 1
        defBar.layer.cornerRadius = 2
        statView.addSubview(defBar)
        defBar.translatesAutoresizingMaskIntoConstraints = false
        defBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        defBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        defBar.centerYAnchor.constraint(equalTo: staticDef.centerYAnchor).isActive = true
        barWidthDict["def"] = defBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Magic Attack
        let mtkBar = UIView()
        mtkBar.backgroundColor = currentTheme.buttonFill
        mtkBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        mtkBar.layer.borderWidth = 1
        mtkBar.layer.cornerRadius = 2
        statView.addSubview(mtkBar)
        mtkBar.translatesAutoresizingMaskIntoConstraints = false
        mtkBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        mtkBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        mtkBar.centerYAnchor.constraint(equalTo: staticMtk.centerYAnchor).isActive = true
        barWidthDict["matk"] = mtkBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Magic Defense
        let mdfBar = UIView()
        mdfBar.backgroundColor = currentTheme.buttonFill
        mdfBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        mdfBar.layer.borderWidth = 1
        mdfBar.layer.cornerRadius = 2
        statView.addSubview(mdfBar)
        mdfBar.translatesAutoresizingMaskIntoConstraints = false
        mdfBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        mdfBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        mdfBar.centerYAnchor.constraint(equalTo: staticMdf.centerYAnchor).isActive = true
        barWidthDict["mdef"] = mdfBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Speed
        let spdBar = UIView()
        spdBar.backgroundColor = currentTheme.buttonFill
        spdBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        spdBar.layer.borderWidth = 1
        spdBar.layer.cornerRadius = 2
        statView.addSubview(spdBar)
        spdBar.translatesAutoresizingMaskIntoConstraints = false
        spdBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        spdBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        spdBar.centerYAnchor.constraint(equalTo: staticSpd.centerYAnchor).isActive = true
        barWidthDict["spd"] = spdBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Int
        let intBar = UIView()
        intBar.backgroundColor = currentTheme.buttonFill
        intBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        intBar.layer.borderWidth = 1
        intBar.layer.cornerRadius = 2
        statView.addSubview(intBar)
        intBar.translatesAutoresizingMaskIntoConstraints = false
        intBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor, constant: 32).isActive = true
        intBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        intBar.centerYAnchor.constraint(equalTo: staticInt.centerYAnchor).isActive = true
        barWidthDict["int"] = intBar.widthAnchor.constraint(equalToConstant: 0)
        ///MARK: - Health
        let staticHealth = UILabel.header(text: "HP")
        let healthBar = UIView()
        healthBar.layer.borderColor = currentTheme.buttonBorder.cgColor
        healthBar.layer.borderWidth = 1
        healthBar.layer.cornerRadius = 4
        healthBar.backgroundColor = currentTheme.buttonFill
        completeView.addSubview(healthBar)
        healthBar.translatesAutoresizingMaskIntoConstraints = false
        healthBar.leadingAnchor.constraint(equalTo: statView.leadingAnchor).isActive = true
        healthBar.heightAnchor.constraint(equalToConstant: 8).isActive = true
        healthBar.widthAnchor.constraint(equalToConstant: 130).isActive = true
        healthBar.bottomAnchor.constraint(equalTo: statView.topAnchor, constant: -4).isActive = true
        staticHealth.textColor = .red
        staticHealth.shadowColor = currentTheme.buttonFill
        staticHealth.shadowOffset = CGSize(width: 1.5, height: 1.5)
        completeView.addSubview(staticHealth)
        staticHealth.translatesAutoresizingMaskIntoConstraints = false
        staticHealth.bottomAnchor.constraint(equalTo: statView.topAnchor, constant: -2).isActive = true
        staticHealth.leadingAnchor.constraint(equalTo: healthBar.leadingAnchor).isActive = true
        completeView.addSubview(health)
        health.translatesAutoresizingMaskIntoConstraints = false
        health.trailingAnchor.constraint(equalTo: healthBar.trailingAnchor, constant: -16).isActive = true
        health.bottomAnchor.constraint(equalTo: statView.topAnchor, constant: -2).isActive = true
        ///MARK: - Rank
        let staticRank = UILabel.body(text: "RANK")
        completeView.addSubview(staticRank)
        staticRank.translatesAutoresizingMaskIntoConstraints = false
        staticRank.leadingAnchor.constraint(equalTo: staticHealth.leadingAnchor).isActive = true
        staticRank.bottomAnchor.constraint(equalTo: healthBar.topAnchor, constant: -8).isActive = true
        completeView.addSubview(rank)
        rank.translatesAutoresizingMaskIntoConstraints = false
        rank.leadingAnchor.constraint(equalTo: staticRank.trailingAnchor, constant: 2).isActive = true
        rank.centerYAnchor.constraint(equalTo: staticRank.centerYAnchor).isActive = true
        
        return (completeView, barWidthDict)
    }
}

