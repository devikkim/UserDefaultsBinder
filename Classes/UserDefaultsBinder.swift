//
//  UserDefaultsBinder.swift
//  UserDefaultsBinder
//
//  Created by InKwon James Kim on 18/07/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

class UserDefaultsBinder {
  static let shared = UserDefaultsBinder()
  
  enum User: String, KeyProtocol {
    case name
    case nickname
  }
  
  enum App: String, KeyProtocol {
    case uuid
    case version
  }
  
  let user = UserDefaultsWrapper<User>()
  let app = UserDefaultsWrapper<App>()
}
