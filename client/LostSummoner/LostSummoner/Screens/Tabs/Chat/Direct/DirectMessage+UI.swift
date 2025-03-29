//
//  DirectMessage+UI.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

extension DirectMessageViewController {
    func setUI() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = currentTheme.background
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 7).isActive = true
        
        let backButton = UIButton.standard()
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backButton.addTarget(self, action: #selector(sendBack), for: .touchUpInside)
        
        view.addSubview(sendView)
        sendView.translatesAutoresizingMaskIntoConstraints = false
        sendViewBottomConstraint = sendView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -2)
        sendViewBottomConstraint?.isActive = true
        sendView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4).isActive = true
        sendView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        sendView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        let sendButton = UIButton.standard()
        sendButton.setTitle("SEND", for: .normal)
        sendView.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.trailingAnchor.constraint(equalTo: sendView.trailingAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: sendView.centerYAnchor).isActive = true
        sendButton.addTarget(self, action: #selector(sendTapped), for: .touchUpInside)
        
        textInputView.font = UIFont(name: "RussoOne-Regular", size: 12)
        textInputView.textColor = wireframe.body
        textInputView.placeholder = "Type a message..."
        textInputView.borderStyle = .roundedRect
        textInputView.enablesReturnKeyAutomatically = true
        textInputView.returnKeyType = .send
        textInputView.backgroundColor = .white
        textInputView.delegate = self
        sendView.addSubview(textInputView)
        textInputView.translatesAutoresizingMaskIntoConstraints = false
        textInputView.leadingAnchor.constraint(equalTo: sendView.leadingAnchor, constant: 1).isActive = true
        textInputView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -2).isActive = true
        textInputView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textInputView.centerYAnchor.constraint(equalTo: sendView.centerYAnchor).isActive = true
        
        let tableBackView = UIView()
        tableBackView.backgroundColor = currentTheme.accent
        tableBackView.layer.cornerRadius = 10
        view.addSubview(tableBackView)
        tableBackView.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: Table View
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(ChatSentCell.self, forCellReuseIdentifier: "ChatSentCell")
        tableView.register(ChatRecievedCell.self, forCellReuseIdentifier: "ChatRecievedCell")
        tableView.backgroundColor = currentTheme.cellBG
        tableView.layer.cornerRadius = 10
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 32).isActive = true
        tableView.bottomAnchor.constraint(equalTo: sendView.topAnchor, constant: -12).isActive = true
        
        tableBackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4).isActive = true
        tableBackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4).isActive = true
        tableBackView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 8).isActive = true
        tableBackView.bottomAnchor.constraint(equalTo: sendView.topAnchor, constant: -4).isActive = true
        
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: tableBackView.leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: tableBackView.trailingAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: tableBackView.topAnchor, constant: 2).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -2).isActive = true
    }
    //MARK: Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sendTapped()
        textInputView.resignFirstResponder()
        return true
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if textInputView.isEditing {
            moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.sendViewBottomConstraint!, keyboardWillShow: true)
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        moveViewWithKeyboard(notification: notification, viewBottomConstraint: self.sendViewBottomConstraint!, keyboardWillShow: false)
    }
    
    func moveViewWithKeyboard(notification: NSNotification, viewBottomConstraint: NSLayoutConstraint, keyboardWillShow: Bool) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let keyboardHeight = keyboardSize.height
        // Keyboard's animation duration
        let keyboardDuration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        // Keyboard's animation curve
        let keyboardCurve = UIView.AnimationCurve(rawValue: notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! Int)!
        // Change the constant
        if keyboardWillShow {
            let safeAreaExists = (self.view?.window?.safeAreaInsets.bottom != 0)
            viewBottomConstraint.constant = -keyboardHeight - (safeAreaExists ? 0: 0) + screenHeight * footerHeightPercentage
        } else { viewBottomConstraint.constant = -2 }
        // Animate the view the same way the keyboard animates
        let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
            // Update Constraints
            self!.tableView.scrollToBottom()
            self!.view.layoutIfNeeded()
        }
        // Perform the animation
        animator.startAnimation()
    }
}
