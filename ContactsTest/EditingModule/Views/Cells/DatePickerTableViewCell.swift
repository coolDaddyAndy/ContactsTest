//
//  DatePickerTableViewCell.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 30.03.23.
//

import UIKit


final class DatePickerTableViewCell: UITableViewCell {
    
    static var reuseID: String = "idDatePickerCell"
    
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        addView(nameLabel)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
    }
}


extension DatePickerTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
        ])
    }
}