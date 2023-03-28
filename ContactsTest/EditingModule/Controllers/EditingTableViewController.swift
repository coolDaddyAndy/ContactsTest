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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.reuseID,
                                                       for: indexPath) as? TextViewTableViewCell else {
            return UITableViewCell()
        }
        
        let fieldName = Resources.NameFields.allCases[indexPath.row].rawValue
        cell.nameTextViewDelegate = self
        cell.configure(name: fieldName)
        return cell
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
