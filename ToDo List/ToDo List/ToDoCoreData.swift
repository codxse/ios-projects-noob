//
//  ToDoCoreData.swift
//  ToDo List
//
//  Created by Nadiar Ahmad Syaripul on 30/03/20.
//  Copyright © 2020 Nadiar Syaripul. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ToDoCoreData: NSManagedObject {
    @NSManaged var name : NSString
    @NSManaged var isImportant : Bool
}
