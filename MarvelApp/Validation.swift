//
//  Validation.swift
//  MarvelApp
//
//  Created by Adam Bayes on 05/10/2020.
//

import Foundation

extension String {
    
    enum ValidityType {
        case searchForSuperhero
        case password
        case name
        case email
    }
    
    enum Regex: String {
        case name = "[A-Za-z]{1,}"
        case searchForSuperhero = "[A-Za-z]{3,}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,}$"
    }
        
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        switch validityType {
        case .searchForSuperhero: regex = Regex.searchForSuperhero.rawValue
        case .email: regex = Regex.email.rawValue
        case .password: regex = Regex.password.rawValue
        case .name: regex = Regex.name.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
