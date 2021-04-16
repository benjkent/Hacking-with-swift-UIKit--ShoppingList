//
//  ViewController.swift
//  ShoppingList
//
//  Created by benjamin kent on 2/28/21.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Shopping List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForShoppingItem))
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "clear", style: .plain, target: self, action: #selector(clearList))
        newList()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    @objc func clearList(){
        newList()
    }
    @objc func promptForShoppingItem(){
        let ac = UIAlertController(title: "Add to list", message: nil, preferredStyle: .alert)
        
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit",style: .default){ [weak self, weak ac]  action in
        guard let answer = ac?.textFields?[0].text else {return}
            
        self?.submit(answer)
        }
        
    ac.addAction(submitAction)
        
    present(ac, animated: true)
        
    }
    func submit(_ answer: String){
        if answer.count >= 1 {
            
            shoppingList.insert(answer, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        } else {return}
    }
    func newList(){
        shoppingList.removeAll(keepingCapacity: false)
        tableView.reloadData()
    }
}

