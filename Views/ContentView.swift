//
//  ContentView.swift
//  Stockx App
//
//  Created by 吉郷景虎 on 2020/08/22.
//  Copyright © 2020 Kagetora Yoshigo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var downloadManager: DownloadManager
    @State var timeFrameChoice = 0
//    let stockData: [DataEntry]
    
    let stockSymbol: String
    
    var body: some View {
        VStack {
            TimeFrameBar(timeFrameChoice: $timeFrameChoice)
            if downloadManager.dataFetched {
                Header(stockData: timeFrameChoice == 0 ? downloadManager.dailyEntries : downloadManager.weeklyEntries)
                Chart(dataSet: timeFrameChoice == 0 ? downloadManager.dailyEntries : downloadManager.weeklyEntries)
                    .frame(height: 300)
            }
            Spacer()
            TransactionButtons()
            Spacer()
        }
            .navigationBarTitle("StockSymbol")
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(downloadManager: DownloadManager(stockSymbol: "AAPL"), stockSymbol: "AAPL")
    }
}

struct Header: View {
    
    let stockData: [DataEntry]
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("$" + String(format: "%.2f", stockData.last?.close ?? 0))
                .font(.custom("Avenir", size: 45))
            Text(String(format: "%.2f", getPercentageChange(stockData: stockData)) + "%")
                .font(.custom("Avenir", size: 18))
                .fontWeight(.medium)
                .foregroundColor(.green)
        }
            .padding()
            .padding(.top, 30)
    }
}

struct TransactionButtons: View {
    var body: some View {
        HStack {
            Text("Sell Shares")
                .font(.custom("Avenir", size: 16))
                .foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
                .padding(20)
                .background(Color(red: 0.25, green: 0.27, blue: 0.3))
            Text("Buy Shares")
                .font(.custom("Avenir", size: 16))
                .foregroundColor(.white)
                .padding(20)
                .background(Color.blue)
        }
        .background(Color.blue)
        .cornerRadius(16)
    }
}



struct TimeFrameBar: View {
    
    @Binding var timeFrameChoice: Int
    
    var body: some View {
        HStack {
            Text("Day")
                .font(.custom("Avenir", size: 18))
                .fontWeight(timeFrameChoice == 0 ? .medium : .none)
                .foregroundColor(timeFrameChoice == 0 ? .blue : .gray)
                .onTapGesture (perform: {self.timeFrameChoice = 0})
            Text("Week")
                .font(.custom("Avenir", size: 18))
                .fontWeight(timeFrameChoice == 1 ? .medium : .none)
                .foregroundColor(timeFrameChoice == 1 ? .blue : .gray)
                .onTapGesture (perform: {self.timeFrameChoice = 1})
            Spacer()
        }
        .padding()
    }
}


