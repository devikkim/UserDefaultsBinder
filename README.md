# UserDefaultsBinder
This is UserDefaults's Wrapper Class for binding keys and values

## 1. Make wrapper class for combine your keys

```swift
// For binding your keys to UserDefaults
protocol KeyProtocol: RawRepresentable, CaseIterable {}

// This class is combine keys
class UserDefaultsBinder {
  static let shared = UserDefaultsBinder()
  
  // Set your user keys
  enum User: String, KeyProtocol {
    case name
    case nickname
  }

  // Set your app keys
  enum App: String, KeyProtocol {
    case uuid
    case version
  }
  
  let user = UserDefaultsWrapper<User>()
  let app = UserDefaultsWrapper<App>()
}
```

## 2. set

```swift
UserDefaultsBinder
  .shared
  .user
  .set("James Kim", .name)
  
UserDefaultsBinder
  .shared
  .user
  .set("Devik", .nickname)
  
let uuid = UUID().uuidString

// you can use chaining when set data
UserDefaultsBinder
  .shared
  .app
  .set(uuid, .uuid)
  .set("1.0.0", .version)
  .debugPrintAllElement()
```

## 3. get
``` swift
guard let name = UserDefaultsBinder
  .shared
  .user
  .string(.name) else {
    return
  }
  
print(name) // "James Kim"
```

## 4. remove
```swift
UserDefaultsBinder
  .shared
  .user
  .remove([.name, .nickname])
      
UserDefaultsBinder
  .shared
  .app
  .removeAll()

```
