//
//  userDefaultHelper.swift
//  Gap
//
//  Created by GTC on 2/4/1400 AP.
//

import Foundation
import UIKit


final class UserDefaultsHelper {
static func setData<T>(value: T, key: UserDefaultKeys) {
   let defaults = UserDefaults.standard
   defaults.set(value, forKey: key.rawValue)
}
static func getData<T>(type: T.Type, forKey: UserDefaultKeys) -> T? {
   let defaults = UserDefaults.standard
   let value = defaults.object(forKey: forKey.rawValue) as? T
   return value
}
static func removeData(key: UserDefaultKeys) {
   let defaults = UserDefaults.standard
   defaults.removeObject(forKey: key.rawValue)
}
}

enum UserDefaultKeys: String, CaseIterable {
    case authToken
 
}
// How to use UserDefaultHelper in other Class :

/*
 **user defualt set value**
 
 UserDefaultsHelper.setData(value: "user-001", key: .userId)
 UserDefaultsHelper.setData(value: true, key: .isAdmin)
 UserDefaultsHelper.setData(value: 123, key: .pinCode)
 */

/*
 ** user default get value**
 
 let id = UserDefaultsHelper.getData(type: String.self, forKey: .userId)
 let userType = UserDefaultsHelper.getData(type: Bool.self, forKey: .isAdmin)
 let code = UserDefaultsHelper.getData(type: Int.self, forKey: .pinCode)
/*
 remove key:
 //        _ = UserDefaultKeys.allCases.map({ _ in UserDefaultsHelper.removeData(key: " entery the key name") })
 */*/
