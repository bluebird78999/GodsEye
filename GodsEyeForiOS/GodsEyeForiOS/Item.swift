//
//  Item.swift
//  GodsEyeForiOS
//
//  Created by LiuHongfeng on 13/3/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
