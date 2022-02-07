//
//  DownloadHelper.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/23.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import Foundation


let apiKey = "PU11V65FDIJZATT9"

func generateRequestURL(stockSymbol: String) -> String {
    return "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(stockSymbol)&interval=15min&outputsize=full&apikey=\(apiKey)"
}




