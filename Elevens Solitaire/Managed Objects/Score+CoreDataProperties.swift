//
//  Score+CoreDataProperties.swift
//  Elevens Solitaire
//
//  Created by Jose Monge on 2/9/21.
//
//

import Foundation
import CoreData


extension Score {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Score> {
        return NSFetchRequest<Score>(entityName: "Score")
    }

    @NSManaged public var name: String?
    @NSManaged public var value: Int32

}

extension Score : Identifiable {

}
