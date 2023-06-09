//
//  EditingTableView.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 2.04.23.
//

import UIKit

final class EditingTableView: UITableView {
    
    private var userModel = UserModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self)
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUserModel(_ model: UserModel) {
        userModel = model
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
            guard let cell = dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            
            switch indexPath.row {
            case 0: cell.configure(name: fieldName, scrollEnable: true, value: userModel.firstName)
            case 1: cell.configure(name: fieldName, scrollEnable: false, value: userModel.lastName)
            default:
                cell.configure(name: fieldName, scrollEnable: true, value: userModel.firstName)
            }
            return cell
        case 2:
            guard let cell = dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            
            cell.configure(name: fieldName, date: userModel.birthday.getDateFromString())
            return cell
        case 3:
            guard let cell = dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: fieldName, value: userModel.gender)
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
