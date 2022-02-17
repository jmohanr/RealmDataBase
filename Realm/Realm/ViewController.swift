//
//  ViewController.swift
//  Realm
//
//  Created by apple on 17/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    @IBAction func onTapButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add Contact", message: "Please Add your inputs", preferredStyle: .alert)
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            if let name = alert.textFields?.first?.text,
               let age = alert.textFields?.last?.text {
                debugPrint("\(name),\(age)")
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addTextField { name in
            name.placeholder = "Enter Your Name"
        }
        alert.addTextField { age in
            age.placeholder = "Enter Your Age"
        }
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if var cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            return cell
        }
      return  UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
            
        }
        edit.backgroundColor = .systemMint
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            
        }
        let action = UISwipeActionsConfiguration(actions: [edit,delete])
        return action
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let alert = UIContextualAction(style: .normal, title: "Alert"){ _, _, _ in
            
        }
        let action = UISwipeActionsConfiguration(actions: [alert])
        return action
    }
}
