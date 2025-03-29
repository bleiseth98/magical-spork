//
//  DirectMessageViewController.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import UIKit
import Foundation

class DirectMessageViewController: UIViewController, UITextFieldDelegate {
    //::: Data Source :::
    //::: UIKit Source :::
    let textInputView = UITextField()
    let sendView = UIView()
    var sendViewBottomConstraint: NSLayoutConstraint?
    let tableView = UITableView()
    let titleLabel = UILabel.title(text: "")
    var recipientUID: String?
    var recipientName: String?
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        // Do any additional setup after loading the view.
        //!!! Begin Delete
        titleLabel.text = recipientName
    }
    
    //MARK: Actions
    @objc func sendTapped() {
        if textInputView.text != "" && textInputView.text != nil {
            //sendMessage(content: textInputView.text!, uid: internalRecipientUID, name: internalRecipientName)
            //messageContent.append(textInputView.text!)
            //messageWasSent.append(true)
            //messageTimestamps.append(Date().timestamp())
            tableView.reloadData()
            textInputView.endEditing(true)
            textInputView.text = ""
            tableView.scrollToBottom()
        } else { print("no message to send, show error")}
        updateWhenNotInNormalFlow()
    }
    
    func updateWhenNotInNormalFlow() {
        /*let string = parent?.description
        if string?.localizedStandardContains("ProfileViewController") == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                findChatWithID(self.recipientUID!) { vm in
                    self.viewModel = vm
                    self.tableView.reloadData()
                    self.tableView.scrollToBottom()
                }}} else { //parent is chat view controller
                    print("chat: parent is chat view controller and will update on its own")
                }*/
    }
}
