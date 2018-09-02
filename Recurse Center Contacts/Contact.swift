//
//  Contact.swift
//  Recurse Center Contacts
//
//  Created by David Albert on 9/2/18.
//  Copyright © 2018 David Albert. All rights reserved.
//

import UIKit

struct Contact : Comparable {
    let firstName: String
    let lastName: String

    static func < (lhs: Contact, rhs: Contact) -> Bool {
        if lhs.lastName == rhs.firstName {
            return lhs.firstName < rhs.firstName
        } else {
            return lhs.lastName < rhs.lastName
        }
    }

    var name: String {
        return "\(firstName) \(lastName)"
    }
}
