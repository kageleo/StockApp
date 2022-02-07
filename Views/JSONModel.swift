//
//  JSONModel.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/23.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation


struct TimeSeriesJSON: Decodable {
    let timeSeries: [String: TimeSeries]
    
    private enum CodingKeys: String, CodingKey {
        case timeSeries = "Time Series (15min)"
    }
    
    struct TimeSeries: Decodable {
        let open, close, high, low: String
        
        private enum CodingKeys: String, CodingKey {
            case open = "1. open"
            case high = "2. high"
            case low = "3. low"
            case close = "4. close"
        }
    }
}


