//
//  Agent.swift
//  Gauntlet
//
//  Created by Maxwell Poffenbarger on 2/25/20.
//  Copyright © 2020 Maxwell Poffenbarger. All rights reserved.
//

import Foundation
import UIKit.UIImage

class Agent: Codable {
  let name: String
  let codeName: String
  let confirmedKills: Double
  let specialty: String
  let language: String
  let membership: String
  let profilePic: Image
   
  init(name: String, codeName: String, confirmedKills: Double, specialty: String, language: String, membership: String, profilePic: Image) {
    self.name = name
    self.codeName = codeName
    self.confirmedKills = confirmedKills
    self.specialty = specialty
    self.language = language
    self.membership = membership
    self.profilePic = profilePic
  }
}
extension Agent: Equatable {
  static func == (lhs: Agent, rhs: Agent) -> Bool {
    return lhs.name == rhs.name && lhs.codeName == rhs.codeName && lhs.confirmedKills == rhs.confirmedKills && lhs.specialty == rhs.specialty && lhs.language == rhs.language
  }
}
