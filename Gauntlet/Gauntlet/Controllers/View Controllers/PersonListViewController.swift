//
//  PersonListViewController.swift
//  Gauntlet
//
//  Created by Maxwell Poffenbarger on 2/25/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class PersonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var personSegmentControl: UISegmentedControl!
    @IBOutlet weak var personListTableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        personListTableView.dataSource = self
        personListTableView.delegate = self
        setDataAndReload()
    }
    
    //MARK: - Properties
    var dataSource: [String] = []
    
    //MARK: - Tableview Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        
        cell.textLabel?.text = dataSource[indexPath.row]
        cell.imageView?.image = UIImage(named: "TC Funny")
        
        
        if let height = cell.imageView?.frame.height {
            cell.imageView?.layer.cornerRadius = height/2
            cell.imageView?.layer.masksToBounds = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.view.frame.height / 3
    }
    
    //MARK: - Actions
    @IBAction func personListChanged(_ sender: Any) {
        setDataAndReload()
    }
    
    //MARK: - Class Methods
    func setDataAndReload() {
        
        switch personSegmentControl.selectedSegmentIndex {
            
        case 0:
            dataSource = ["Anna", "Nathan"]
            
        case 1:
            dataSource = ["Meeta", "Clay", "Charles"]
            
        case 2:
            dataSource = ["Adam", "Nicholas", "Poff"]
            
        default:
            dataSource = [""]
        }
        self.personListTableView.reloadData()
    }

    // MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toDetailVC" {
//            guard let indexPath = personListTableView.indexPathForSelectedRow else { return }
//            let destinationVC = segue.destination as? DetailViewController
//            let agent = AgentController.sharedInstance.agents[indexPath.row]
//            destinationVC?.agent = agent
//        }
//    }
}//End of class
