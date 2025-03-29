//
//  QuestArea+Cell.swift
//  LostSummoner
//
//  Created by Bailey Leiseth on 3/27/25.
//

import Foundation
import UIKit

class QuestAreaCell: UITableViewCell {
    ///Data Source
    ///UIKit Elements
    let nameLabel = UILabel.title(text: "")
    let backgroundImage = UIImageView()
    
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
    /*
    func setDataForArea(_ area: Area) {
        nameLabel.text = area.name
        //backgroundImage.image = UIImage(named: "")
    }
    */
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
        backgroundView.clipsToBounds = true
        
        contentView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        backgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2).isActive = true
        backgroundView.addSubview(backgroundImage)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        
        backgroundView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor).isActive = true
    }
}
