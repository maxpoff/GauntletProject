//
//  AgentTableViewCell.swift
//  Gauntlet
//
//  Created by Maxwell Poffenbarger on 2/25/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import UIKit

class AgentTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var agentName: UILabel!
    @IBOutlet weak var agentCodeName: UILabel!

    
    //MARK: - Class Methods
    func setupCell(agent: Agent) {
        agentImageView.image = UIImage(named: agent.name)
        agentImageView.layer.cornerRadius = agentImageView.frame.height/2
        agentImageView.clipsToBounds = true
        agentName.text = agent.name
        agentCodeName.text = agent.codeName
    }
}//End of class
