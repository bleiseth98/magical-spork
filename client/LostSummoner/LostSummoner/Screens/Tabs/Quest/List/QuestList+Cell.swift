//
//  QuestList+Cell.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

class QuestListCell: UITableViewCell {
    //::: Data Source :::
    //var viewModel: Quest?
    //::: UIKit Source :::
    let nameLabel = UILabel.subheader(text: "")
    let descriptionLabel = UILabel.body(text: "")
    let expLabel = UILabel.body(text: "")
    let moneyLabel = UILabel.body(text: "")
    let progressLabel = UILabel.body(text: "")
    let actionButton = UIButton.standard()
    let progressBG = UIView()
    let progressFill = UIView()
    var progressFillWidth = NSLayoutConstraint()
    let item1Image = UIImageView()
    let item2Image = UIImageView()
    let item3Image = UIImageView()
    //::: Action Blocks :::
    var actionBlock: (() -> Void)? = nil
    //var heldBlock: (() -> Void)? = nil
    //MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: Actions
    @objc func actionTapped() { actionBlock?() }
    
    @objc func actionHeld() {
        //heldBlock?()
        ///https://stackoverflow.com/questions/34235903/press-and-hold-button-for-repeat-fire
        //guard let data = viewModel else { return }
        //data.performQuest()
    }
    //MARK: View
    func setUI() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.frame.size.height = 104
        backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.borderWidth = 2
        backgroundView.layer.borderColor = UIColor.black.cgColor
        backgroundView.backgroundColor = currentTheme.cellBG
        backgroundView.frame.size.height = 100
        
        contentView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        backgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        //::: Left Side :::
        backgroundView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8).isActive = true
        
        backgroundView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        let moneyImage = UIImageView()
        moneyImage.image = UIImage(named: "icon_money")
        moneyImage.contentMode = .scaleAspectFit
        backgroundView.addSubview(moneyImage)
        moneyImage.translatesAutoresizingMaskIntoConstraints = false
        moneyImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        moneyImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -8).isActive = true
        moneyImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 8).isActive = true
        moneyImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        backgroundView.addSubview(moneyLabel)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.leadingAnchor.constraint(equalTo: moneyImage.trailingAnchor, constant: 4).isActive = true
        moneyLabel.centerYAnchor.constraint(equalTo: moneyImage.centerYAnchor).isActive = true
        
        let expImage = UIImageView()
        expImage.image = UIImage(named: "icon_exp")
        expImage.contentMode = .scaleAspectFit
        backgroundView.addSubview(expImage)
        expImage.translatesAutoresizingMaskIntoConstraints = false
        expImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        expImage.bottomAnchor.constraint(equalTo: moneyImage.topAnchor, constant: -4).isActive = true
        expImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 8).isActive = true
        expImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        backgroundView.addSubview(expLabel)
        expLabel.translatesAutoresizingMaskIntoConstraints = false
        expLabel.leadingAnchor.constraint(equalTo: expImage.trailingAnchor, constant: 4).isActive = true
        expLabel.centerYAnchor.constraint(equalTo: expImage.centerYAnchor).isActive = true
        expLabel.trailingAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
        //MARK: - Action Button
        backgroundView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
        actionButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        actionButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        actionButton.addTarget(self, action: #selector(actionTapped), for: .touchUpInside)
        //::: Progress :::
        progressLabel.textAlignment = .center
        backgroundView.addSubview(progressLabel)
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.widthAnchor.constraint(equalTo: actionButton.widthAnchor).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor).isActive = true
        progressLabel.topAnchor.constraint(equalTo: actionButton.bottomAnchor, constant: 4).isActive = true
        
        progressBG.layer.cornerRadius = 2
        progressBG.backgroundColor = currentTheme.expBG
        backgroundView.addSubview(progressBG)
        progressBG.translatesAutoresizingMaskIntoConstraints = false
        progressBG.leadingAnchor.constraint(equalTo: actionButton.leadingAnchor).isActive = true
        progressBG.widthAnchor.constraint(equalToConstant: 60).isActive = true
        progressBG.topAnchor.constraint(equalTo: progressLabel.bottomAnchor).isActive = true
        progressBG.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        progressFill.layer.cornerRadius = 2
        progressFill.backgroundColor = currentTheme.expFill
        backgroundView.addSubview(progressFill)
        progressFill.translatesAutoresizingMaskIntoConstraints = false
        progressFill.leadingAnchor.constraint(equalTo: progressBG.leadingAnchor).isActive = true
        progressFill.heightAnchor.constraint(equalToConstant: 5).isActive = true
        progressFill.topAnchor.constraint(equalTo: progressBG.topAnchor).isActive = true
        progressFillWidth = progressFill.widthAnchor.constraint(equalToConstant: 0)
        //::: Items :::
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        backgroundView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: moneyLabel.bottomAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 1.0/3.0).isActive = true
        
        stackView.addSubview(item3Image)
        item3Image.layer.borderColor = UIColor.black.cgColor
        item3Image.layer.borderWidth = 1
        item3Image.layer.cornerRadius = 5
        item3Image.translatesAutoresizingMaskIntoConstraints = false
        item3Image.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        item3Image.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item3Image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item3Image.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        
        stackView.addSubview(item2Image)
        item2Image.layer.borderColor = UIColor.black.cgColor
        item2Image.layer.borderWidth = 1
        item2Image.layer.cornerRadius = 5
        item2Image.translatesAutoresizingMaskIntoConstraints = false
        item2Image.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        item2Image.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item2Image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item2Image.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        
        stackView.addSubview(item1Image)
        item1Image.layer.borderColor = UIColor.black.cgColor
        item1Image.layer.borderWidth = 1
        item1Image.layer.cornerRadius = 5
        item1Image.translatesAutoresizingMaskIntoConstraints = false
        item1Image.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        item1Image.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item1Image.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.9).isActive = true
        item1Image.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
    }
}
