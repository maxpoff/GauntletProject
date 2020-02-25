//
//  DetailViewController.swift
//  Gauntlet
//
//  Created by Maxwell Poffenbarger on 2/25/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var agentCodeNameLabel: UILabel!
    @IBOutlet weak var agentConfirmedKillsLabel: UILabel!
    @IBOutlet weak var agentSpecialtiesLabel: UILabel!
    @IBOutlet weak var agentLanguagesLabel: UILabel!
    @IBOutlet weak var agentNameLabel: UILabel!
    
    //MARK: - Properties
    var agent: Agent?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImageView()
    }
    
    //MARK: - Actions
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Class Methods
    func updateImageView() {
        
        guard let agent = agent else {return}
        
        let imageName = agent.name
        
        agentImageView.image = UIImage(named: imageName)
        
        self.agentImageView.layer.cornerRadius = self.agentImageView.frame.height/2
        
        agentNameLabel.text = agent.name
        
        agentCodeNameLabel.text = agent.codeName
        
        agentConfirmedKillsLabel.text = "\(agent.confirmedKills)"
        
        agentSpecialtiesLabel.text = agent.specialty
        
        agentLanguagesLabel.text = agent.language
    }

}//End of class
