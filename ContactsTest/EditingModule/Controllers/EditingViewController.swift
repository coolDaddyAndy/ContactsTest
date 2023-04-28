//
//  EditingTableViewController.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

final class EditingViewController: UIViewController {
    
    private var userModel = UserModel()
    
    private let editingTableView = EditingTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupViews() {
        title = "Contact"
        view.backgroundColor = .lightGray
        view.addView(editingTableView)
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save changes",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(saveChangesTapped))
        let backBarButtonItem = UIBarButtonItem.createCustomButton(viewController: self,
                                                                   selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem
        editingTableView.setUserModel(userModel)
    }
    
    @objc private func saveChangesTapped() {
        if authFields() {
            presentSimpleAlert(title: "Success!", message: "Saved!")
        } else {
            presentSimpleAlert(title: "Ooops!", message: "Fill in all the fields.")
        }
    }
    
    @objc private func backButtonTapped() {
        presentChangesAlert { value in
            if value {
                print(self.userModel)
                self.navigationController?.popViewController(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func authFields() -> Bool {
        if userModel.firstName != "Add some text" ||
            userModel.lastName != "Add some text" ||
            userModel.birthday != "" ||
            userModel.gender != "" ||
            userModel.gender != "No specified" {
            return true
        }
        return false
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
