//
//  DataEntry.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/22.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation

struct DataEntry: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let close: Double
}


let sampleData = [
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, close: 2.33),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, close: 17.319),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, close: 13.94),
    DataEntry(date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, close: 20.4882)
]
