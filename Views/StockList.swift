//
//  StockList.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/22.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import SwiftUI

struct StockList: View {
    var body: some View {
        NavigationView {
            List {
                StockListRow(downloadManager: DownloadManager(stockSymbol: "AAPL"), stockSymbol: "AAPL", stockName: "Apple,Inc")
                StockListRow(downloadManager: DownloadManager(stockSymbol: "AMZN"), stockSymbol: "AMZN", stockName: "Amazon.com,Inc")
                StockListRow(downloadManager: DownloadManager(stockSymbol: "TSLA"), stockSymbol: "TSLA", stockName: "Tesla,Inc")
                StockListRow(downloadManager: DownloadManager(stockSymbol: "GOOG"), stockSymbol: "GOOG", stockName: "Alphabet,Inc")
                StockListRow(downloadManager: DownloadManager(stockSymbol: "NFLX"), stockSymbol: "NFLX", stockName: "Netflix,Inc")
            }
            .navigationBarTitle("StockX")
        }
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockList()
    }
}

struct StockListRow: View {
    
    @ObservedObject var downloadManager: DownloadManager
    
    let stockSymbol: String
    let stockName: String
    
//    let stockData: [DataEntry]
    
    var body: some View {
        HStack {
            NavigationLink(destination: ContentView(downloadManager: downloadManager, stockSymbol: stockSymbol)) {
                VStack(alignment: .leading) {
                    Text(stockSymbol)
                        .font(.custom("Avenir", size: 20))
                        .fontWeight(.medium)
                    Text(stockName)
                        .font(.custom("Avenir", size: 16))
                }
                Spacer()
                if downloadManager.dataFetched {
                    VStack(alignment: .trailing) {
                        Text(String(format: "%.2f", getPercentageChange(stockData: downloadManager.dailyEntries)) + "%")
                            .font(.custom("Aveir", size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(getPercentageChange(stockData: downloadManager.dailyEntries)>0 ? .green : .red)
                        Text("$" + String(format: "%.2f", downloadManager.dataEntries.last?.close ?? 0))
                            .font(.custom("Avenir", size: 26))
                    }
                }
                
            }
        }
    }
}
