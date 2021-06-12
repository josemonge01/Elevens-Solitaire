//
//  Data+CoreDataProperties.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 5/19/21.
//
//

import Foundation
import CoreData


extension Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Data> {
        return NSFetchRequest<Data>(entityName: "Data")
    }

    @NSManaged public var background: Int32
    @NSManaged public var bestTime: Int32
    @NSManaged public var deck: Int32
    @NSManaged public var bestScore: Int32

}

extension Data : Identifiable {

}
