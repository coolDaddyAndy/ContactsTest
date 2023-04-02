//
//  EditingTableView.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 2.04.23.
//

import UIKit

final class EditingTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self,
                 forCellReuseIdentifier: TextViewTableViewCell.reuseID)
        register(DatePickerTableViewCell.self,
                 forCellReuseIdentifier: DatePickerTableViewCell.reuseID)
        register(PickerViewTableViewCell.self,
                 forCellReuseIdentifier: PickerViewTableViewCell.reuseID)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - UITableViewDataSource
extension EditingTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fieldName = Resources.NameFields.allCases[indexPath.row].rawValue
        
        switch indexPath.row {
        case 0...1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.reuseID,
                                                           for: indexPath) as? TextViewTableViewCell else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: fieldName, scrollEnable: false)
            } else {
                cell.configure(name: fieldName, scrollEnable: true)
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.reuseID,
                                                           for: indexPath) as? DatePickerTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: fieldName)
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PickerViewTableViewCell.reuseID,
                                                           for: indexPath) as? PickerViewTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(name: fieldName)
            return cell
        default:
            return UITableViewCell()
        }
    }
}


// MARK: - UITableViewDelegate
extension EditingTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}


extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}
