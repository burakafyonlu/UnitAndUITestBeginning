//
//  ViewController.swift
//  SwiftTesting
//
//  Created by Burak Afyonlu on 7.05.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var toDoList = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    @IBAction func addFunction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Item", message: "Enter your to do item", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField() { textField in
            
            textField.placeholder = "Enter Item"
        }
        
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            
            guard let textField = alert.textFields?[0], let imputText = textField.text , !imputText.isEmpty else {
                
                return
                
            }
            
            self.toDoList.insert(imputText, at: 0)
            
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic)
            
            
        }
        
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        toDoList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            self.toDoList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            
        }
        
    }
    
}
