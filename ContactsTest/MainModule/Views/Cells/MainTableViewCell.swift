//
//  MainTableViewCell.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    static var reuseID: String = "idMainTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaNeue(size: 20)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "For test"
        label.font = Resources.Fonts.helveticaNeue(size: 20)
        return label
    }()
    
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
        addView(valueLabel)
    }
    
    public func configure(name: String, value: String) {
        nameLabel.text = name
        valueLabel.text = value
    }
}

extension MainTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 44),
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            valueLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 12)
        ])
    }
}
