//
//  ViewController.swift
//  TodosCoreData
//
//  Created by Matthew Lyles on 4/1/20.
//  Copyright © 2020 Matthew Lyles. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var itemArray = ["Buy Milk", "Go to the doctors", "work on latest dev project"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Todos App"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddGroup))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 80
        
    }
    
    
    @objc func handleAddGroup() {
        let alert = UIAlertController(title: "Add New", message: "Create a todo group", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { [unowned self] (action) in
            guard let textFieldData = alert.textFields?.first,
                let readyText = textFieldData.text else { return }
            print(readyText)
            self.itemArray.append(readyText)
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "enter a new task..."
        }
        alert.addAction(cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.selectionStyle = .none
        cell.accessoryType = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did select item \(indexPath.row)")
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }


}

