//
//  UserDefaultsWrapperTests.swift
//  UserDefaultsWrapperTests
//
//  Created by InKwon James Kim on 18/07/2019.
//  Copyright © 2019 InKwon Devik Kim. All rights reserved.
//

import XCTest
@testable import UserDefaultsBinder

class UserDefaultsBinderTests: XCTestCase {
  func testSet() {
    
    // set data
    UserDefaultsBinder
      .shared
      .user
      .set("James Kim", .name)
      .set("Devik", .nickname)
      .debugPrintAllElement()
    
    let uuid = UUID().uuidString
    
    UserDefaultsBinder
      .shared
      .app
      .set(uuid, .uuid)
      .set("1.0.0", .version)
      .debugPrintAllElement()
    
    // get data for verification
    guard let name = UserDefaultsBinder
      .shared
      .user
      .string(.name) else {
        XCTAssert(false)
        return
    }
    
    XCTAssert(name == "James Kim")
    
    guard let nickname = UserDefaultsBinder
      .shared
      .user
      .string(.nickname) else {
        XCTAssert(false)
        return
    }
    
    XCTAssert(nickname == "Devik")
    
    guard let appUUID = UserDefaultsBinder
      .shared
      .app
      .string(.uuid) else {
        XCTAssert(false)
        return
    }
    
    XCTAssert(appUUID == uuid)
    
    guard let version = UserDefaultsBinder
      .shared
      .app
      .string(.version) else {
        XCTAssert(false)
        return
    }
    XCTAssert(version == "1.0.0")
  }
  
  func testRemove() {
    
    // set data for remove verification
    UserDefaultsBinder
      .shared
      .user
      .set("James Kim", .name)
      .set("Devik", .nickname)
      .debugPrintAllElement()
    
    UserDefaultsBinder
      .shared
      .app
      .set(UUID().uuidString, .uuid)
      .set("1.0.0", .version)
      .debugPrintAllElement()
    
    UserDefaultsBinder
      .shared
      .user
      .remove([.name, .nickname])
    
    UserDefaultsBinder
      .shared
      .app
      .removeAll()
    
    // remove verification
    guard let _ = UserDefaultsBinder
      .shared
      .user
      .string(.name) else {
        XCTAssert(true)
        return
    }
    XCTAssert(false)
    
    guard let _ = UserDefaultsBinder
      .shared
      .user
      .string(.nickname) else {
        XCTAssert(true)
        return
    }
    XCTAssert(false)
    
    guard let _ = UserDefaultsBinder
      .shared
      .app
      .string(.uuid) else {
        XCTAssert(true)
        return
    }
    XCTAssert(false)
    
    guard let _ = UserDefaultsBinder
      .shared
      .app
      .string(.version) else {
        XCTAssert(true)
        return
    }
    XCTAssert(false)
  }
}
