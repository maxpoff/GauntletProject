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
    var dataSource = AgentController.sharedInstance.agents
    
    //MARK: - Tableview Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? AgentTableViewCell else {return UITableViewCell()}
        
        let agent = dataSource[indexPath.row]
        
        cell.setupCell(agent: agent)
        
        return cell
    }
    
    //MARK: - Actions
    @IBAction func personListChanged(_ sender: Any) {
        setDataAndReload()
    }
    
    //MARK: - Class Methods
    func setDataAndReload() {
        
        switch personSegmentControl.selectedSegmentIndex {
            
        case 0:
            dataSource = AgentController.sharedInstance.uxAgents
            
        case 1:
            dataSource = AgentController.sharedInstance.qaAgents
            
        case 2:
            dataSource = AgentController.sharedInstance.iosAgents
            
        default:
            dataSource = []
        }
        self.personListTableView.reloadData()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let indexPath = personListTableView.indexPathForSelectedRow else { return }
            let destinationVC = segue.destination as? DetailViewController
            let agent = dataSource[indexPath.row]
            destinationVC?.agent = agent
        }
    }
}//End of class
