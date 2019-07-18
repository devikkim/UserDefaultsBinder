//
//  UserDefaultsWrapper.swift
//  UserDefaultsBinder
//
//  Created by InKwon James Kim on 18/07/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

protocol KeyProtocol: RawRepresentable, CaseIterable {}

class UserDefaultsWrapper<Keys: KeyProtocol> where Keys.RawValue == String {
  func float(_ key: Keys) -> Float? {
    return UserDefaults.standard.float(forKey: key.rawValue)
  }
  
  func string(_ key: Keys) -> String? {
    return UserDefaults.standard.string(forKey: key.rawValue)
  }
  
  func bool(_ key: Keys) -> Bool {
    return UserDefaults.standard.bool(forKey: key.rawValue)
  }
  
  func double(_ key: Keys) -> Double? {
    return UserDefaults.standard.double(forKey: key.rawValue)
  }
  
  func integer(_ key: Keys) -> Int {
    return UserDefaults.standard.integer(forKey: key.rawValue)
  }
  
  func object(_ key: Keys) -> Any? {
    return UserDefaults.standard.object(forKey: key.rawValue)
  }
}

extension UserDefaultsWrapper {
  @discardableResult
  func set(_ url: URL?, _ key: Keys) -> Self {
    UserDefaults.standard.set(url, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: Any?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: Bool?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: Double?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: String?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: Int?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func set(_ value: Float?, _ key: Keys) -> Self {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    return self
  }
}

extension UserDefaultsWrapper {
  @discardableResult
  func remove(_ key: Keys) -> Self {
    UserDefaults.standard.removeObject(forKey: key.rawValue)
    return self
  }
  
  @discardableResult
  func remove(_ keys: [Keys]) -> Self {
    keys.forEach {
      UserDefaults.standard.removeObject(forKey: $0.rawValue)
    }
    return self
  }
  
  @discardableResult
  func removeAll() -> Self {
    Keys.allCases.forEach{
      UserDefaults.standard.removeObject(forKey: $0.rawValue)
    }
    return self
  }
}

extension UserDefaultsWrapper {
  @discardableResult
  func debugPrint(_ key: Keys) -> UserDefaultsWrapper {
    print("\(key.rawValue): \(object(key) as Any)")
    return self
  }
  
  @discardableResult
  func debugPrintAllElement() -> Self {
    print("\(Keys.self)'s All Elements")
    
    Keys.allCases.forEach{
      print("\($0.rawValue): \(object($0) as Any)")
    }
    return self
  }
}
