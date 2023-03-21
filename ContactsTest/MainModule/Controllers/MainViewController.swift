//
//  ViewController.swift
//  ContactsTest
//
//  Created by Andrei Sushkou on 21.03.23.
//

import UIKit

final class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseID)
    }

    private func setupViews() {
        title = "Contact"
    }
}

// MARK: - UITableViewDataSource
extension MainViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseID,
                                                       for: indexPath) as? MainTableViewCell
        else {
            return UITableViewCell()
        }
        
        let fieldName = Resources.NameFields.allCases[indexPath.row].rawValue
        if #available(iOS 14.0, *) {
            var content = cell.defaultContentConfiguration()
            content.text = fieldName
            cell.contentConfiguration = content
        } else {
            cell.textLabel?.text = fieldName
        }
        
        return cell
    }
}
