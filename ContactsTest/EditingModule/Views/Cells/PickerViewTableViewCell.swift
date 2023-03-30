//
//  PickerViewTableVIewCell.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 30.03.23.
//

import UIKit


final class PickerViewTableViewCell: UITableViewCell {
    
    static var reuseID: String = "idPickerView"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaNeue(size: 20)
        return label
    }()
    
    private let genderTextField: GenderTextField = {
        let field = GenderTextField()
        return field
    }()
    
    private let genderPicker = GenderPickerView()
    
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
        
        genderPicker.genderDelegate = self
        genderTextField.inputView = genderPicker
        contentView.addView(genderTextField)
    }
    
    public func configure(name: String) {
        nameLabel.text = name
    }
}

extension PickerViewTableViewCell: GenderPickerViewProtocol {
    func didSelectRow(row: Int) {
        genderTextField.text = Resources.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
}


extension PickerViewTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            
            
        ])
    }
}
