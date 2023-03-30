//
//  EditingTableViewController.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

final class EditingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        tableView.register(TextViewTableViewCell.self,
                           forCellReuseIdentifier: TextViewTableViewCell.reuseID)
        tableView.register(DatePickerTableViewCell.self,
                           forCellReuseIdentifier: DatePickerTableViewCell.reuseID)
        tableView.register(PickerViewTableViewCell.self,
                           forCellReuseIdentifier: PickerViewTableViewCell.reuseID)
        
    }

    private func setupViews() {
        title = "Contact"
        view.backgroundColor = .lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save changes",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editTapped))
    }
    
    @objc private func editTapped() {
        
    }
}

// MARK: - UITableViewDataSource
extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
extension EditingTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}


extension EditingTableViewController: NameTextViewProtocol {
    func changeSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
}
