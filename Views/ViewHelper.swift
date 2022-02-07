//
//  ViewHelper.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/22.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation
import SwiftUI

func getPercentageChange(stockData: [DataEntry]) -> Double {
    if let lastEntryClose = stockData.last?.close, let firstEntryClose = stockData.first?.close {
        return ((lastEntryClose - firstEntryClose) / lastEntryClose) * 100
    } else {
        return 0
    }
}


func bullishBearishGradient(lastClose: Double, firstClose: Double) -> Gradient {
    if lastClose < firstClose {
        return Gradient(colors: [Color.red, Color.clear])
    } else {
        return Gradient(colors: [Color.green, Color.clear])
    }
}
