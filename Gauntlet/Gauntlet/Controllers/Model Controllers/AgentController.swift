//
//  AgentController.swift
//  Gauntlet
//
//  Created by Maxwell Poffenbarger on 2/25/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import Foundation
import UIKit.UIImage

class AgentController {
    //MARK: - Singleton
    static let sharedInstance = AgentController()
    
    //MARK: - Properties
    var agents: [Agent] = {
        let adamImage = Image(withImage: #imageLiteral(resourceName: "Adam Hatch"))
        let adam = Agent(name: "Adam Hatch", codeName: "Big Boy", confirmedKills: 0, specialty: "Being big", language: "Big", membership: "iOS", profilePic: adamImage )
        
        let annaImage = Image(withImage: #imageLiteral(resourceName: "Anna Free"))
        let anna = Agent(name: "Anna Free", codeName: "The Frizz", confirmedKills: 7, specialty: "Can overthink on behalf of anyone.", language: "Japanese, English, Pets", membership: "UI", profilePic: annaImage )
        
        let meetaImage = Image(withImage: #imageLiteral(resourceName: "Caley Meeta"))
        let meeta = Agent(name: "Caley Meeta", codeName: "Unicorn", confirmedKills: -15, specialty: "Giving a hard time to her kids.", language: "Hindi, Punjabi, Nepali, English, talking with her puppy", membership: "QA", profilePic: meetaImage)
        
        let charlesImage = Image(withImage: #imageLiteral(resourceName: "Charles Pullen"))
        let charles = Agent(name: "Charles Pullen", codeName: "Chuck Pullen", confirmedKills: 0, specialty: "Microwaves 1 min rice in 58 seconds.", language: "English, Australian", membership: "QA", profilePic: charlesImage)
        
        let clayImage = Image(withImage: #imageLiteral(resourceName: "M. Clay Orton"))
        let clay = Agent(name: "M. Clay Orton", codeName: "Michael Scarn", confirmedKills: 7, specialty: "Can almost dunk a basketball.", language: "English, French, Sarcasm", membership: "UI", profilePic: clayImage)
        
        let maxImage = Image(withImage: #imageLiteral(resourceName: "Maxwell Poffenbarger"))
        let max = Agent(name: "Maxwell Poffenbarger", codeName: "Poff Daddy", confirmedKills: 13.5, specialty: "Can spend more money than he makes", language: "English, Indonesian, Parseltongue", membership: "iOS", profilePic: maxImage)
        
        let nathanImage = Image(withImage: #imageLiteral(resourceName: "Nathan Sparks"))
        let nathan = Agent(name: "Nathan Sparks", codeName: "Sparky", confirmedKills: 1, specialty: "Can tune a 4 cylinder engine into a 560hp beast.", language: "English, German(Deutsch), Swiss Deutsch", membership: "UI", profilePic: nathanImage)
        
        let nickImage = Image(withImage: #imageLiteral(resourceName: "Nicholas Boleky"))
        let nick = Agent(name: "Nicholas Boleky", codeName: "Mr. Hands", confirmedKills: 52, specialty: "Hand to hand coding.", language: "English, Swift", membership: "iOS", profilePic: nickImage)
        
        return [adam, anna, meeta, charles, clay, max, nathan, nick]
        
    }()
    
    let uxAgents: [Agent] = {
        let annaImage = Image(withImage: #imageLiteral(resourceName: "Anna Free"))
        let anna = Agent(name: "Anna Free", codeName: "The Frizz", confirmedKills: 7, specialty: "Can overthink on behalf of anyone.", language: "Japanese, English, Pets", membership: "UI", profilePic: annaImage )
        
        let nathanImage = Image(withImage: #imageLiteral(resourceName: "Nathan Sparks"))
        let nathan = Agent(name: "Nathan Sparks", codeName: "Sparky", confirmedKills: 1, specialty: "Can tune a 4 cylinder engine into a 560hp beast.", language: "English, German(Deutsch), Swiss Deutsch", membership: "UI", profilePic: nathanImage)
        
        return [anna, nathan]
    }()
    
    let qaAgents: [Agent] = {
        let meetaImage = Image(withImage: #imageLiteral(resourceName: "Caley Meeta"))
        let meeta = Agent(name: "Caley Meeta", codeName: "Unicorn", confirmedKills: -15, specialty: "Giving a hard time to her kids.", language: "Hindi, Punjabi, Nepali, English, talking with her puppy", membership: "QA", profilePic: meetaImage)
        
        let charlesImage = Image(withImage: #imageLiteral(resourceName: "Charles Pullen"))
        let charles = Agent(name: "Charles Pullen", codeName: "Chuck Pullen", confirmedKills: 0, specialty: "Microwaves 1 min rice in 58 seconds.", language: "English, Australian", membership: "QA", profilePic: charlesImage)
        
        let clayImage = Image(withImage: #imageLiteral(resourceName: "M. Clay Orton"))
        let clay = Agent(name: "M. Clay Orton", codeName: "Michael Scarn", confirmedKills: 7, specialty: "Can almost dunk a basketball.", language: "English, French, Sarcasm", membership: "UI", profilePic: clayImage)
        
        return [meeta, clay, charles]
    }()
    
    let iosAgents: [Agent] = {
        let adamImage = Image(withImage: #imageLiteral(resourceName: "Adam Hatch"))
        let adam = Agent(name: "Adam Hatch", codeName: "Big Boy", confirmedKills: 0, specialty: "Being big", language: "Big", membership: "iOS", profilePic: adamImage )
        
        let maxImage = Image(withImage: #imageLiteral(resourceName: "Maxwell Poffenbarger"))
        let max = Agent(name: "Maxwell Poffenbarger", codeName: "Poff Daddy", confirmedKills: 13.5, specialty: "Can spend more money than he makes", language: "English, Indonesian, Parseltongue", membership: "iOS", profilePic: maxImage)
        
        let nickImage = Image(withImage: #imageLiteral(resourceName: "Nicholas Boleky"))
        let nick = Agent(name: "Nicholas Boleky", codeName: "Mr. Hands", confirmedKills: 52, specialty: "Hand to hand coding.", language: "English, Swift", membership: "iOS", profilePic: nickImage)
        
        return [adam, nick, max]
    }()
    
    //MARK: - Crud Func
    func addAgentWith(name: String, codeName: String, confirmedKills: Double, specialty: String, language: String, membership: String, profilePic: Image) {
        let agent = Agent(name: name, codeName: codeName, confirmedKills: confirmedKills, specialty: specialty, language: language, membership: membership, profilePic: profilePic)
        agents.append(agent)
    }
    
    //MARK: - Persistence
    private func fileURL() -> URL {
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "Agent.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func loadFromPersistentStorage() {
        
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let agents = try decoder.decode([Agent].self, from: data)
            self.agents = agents
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
    
    private func saveToPersistentStorage() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(agents)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving to persistent storage: \(error)")
        }
    }
}
