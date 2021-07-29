//
//  UserDefault.swift
//  PropertyWrappersSample
//
//  Created by phong070 on 29/07/2021.
//

import Foundation
@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard

    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    @UserDefault(key: "hasInitilized", defaultValue: false)
    static var hasIntializedValue: Bool
}
