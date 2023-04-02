//
//  EditingTableViewController.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

final class EditingViewController: UIViewController {
    
    private let editingTableView = EditingTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        title = "Contact"
        view.backgroundColor = .lightGray
        view.addView(editingTableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save changes",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(editTapped))
    }
    
    @objc private func editTapped() {
        
    }
}


// MARK: - Set Constraints

extension EditingViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
