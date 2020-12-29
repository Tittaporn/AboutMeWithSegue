//
//  PersonTableViewController.swift
//  AboutMeWithSegue
//
//  Created by Lee McCormick on 12/28/20.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        // This is called when the view has loaded
        super.viewDidLoad()
       
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont( name: "Apple Color Emoji", size: 30) ?? UIFont.systemFont(ofSize: 30), NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        navigationItem.compactAppearance = appearance
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // I want the number of rows in my section to be equal to the count of people I've created
        return PersonController.shared.people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // I want to make sure the cells in my Tableview are a personCell, and not a default UITableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        // Now I need a person to populate that cell. I can have the cells row number match the location of that person in my array. I.E. The first person in my array will be placed on the first cell of my TableView
        let person = PersonController.shared.people[indexPath.row]
        // Now set the name from that person Object to the text on the textfield
        cell.textLabel?.text = person.name
        cell.textLabel?.textColor = .white
        cell.textLabel?.font =  UIFont(name: "Apple Color Emoji", size: 20)!
        // Now that I have configured the cell to my will. Populate the tableView with it
        
        return cell
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            
            let destinationVC = segue.destination as! DetailViewController
            
            guard let index = tableView.indexPathForSelectedRow else {return}
            
            let person = PersonController.shared.people[index.row]
            
            destinationVC.person = person
        }
    }
    
}
