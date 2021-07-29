//
//  UserDefault.swift
//  PropertyWrappersSample
//
//  Created by phong070 on 29/07/2021.
//

import Foundation
import Combine

/// Allows to match for optionals with generics that are defined as non-optional.
public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}
extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

 
@propertyWrapper
struct UserDefault<Value> {
     let key: String
     let defaultValue: Value
     var container: UserDefaults = .standard
     private let publisher = PassthroughSubject<Value, Never>()
     
     var wrappedValue: Value {
         get {
             return container.object(forKey: key) as? Value ?? defaultValue
         }
         set {
             // Check whether we're dealing with an optional and remove the object if the new value is nil.
             if let optional = newValue as? AnyOptional, optional.isNil {
                 container.removeObject(forKey: key)
             } else {
                 container.set(newValue, forKey: key)
             }
             publisher.send(newValue)
         }
     }
     var projectedValue: AnyPublisher<Value, Never> {
         return publisher.eraseToAnyPublisher()
     }
 }

extension UserDefaults {
    @UserDefault(key: "hasInitilized", defaultValue: false)
    static var hasIntializedValue: Bool
    
    @UserDefault(key: "yourAge")
    static var yourAge: Int?
    
    @UserDefault(key: "userName",defaultValue : "")
    static var userName : String
}

extension UserDefault where Value: ExpressibleByNilLiteral {
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: nil, container: container)
    }
}
