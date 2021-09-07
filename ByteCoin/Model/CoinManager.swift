//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "05908BDB-30DA-47EF-B9FC-FB09B121F9BD"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlPart1 = "/\(currency)"
        let urlPart2 = "?apikey=\(apiKey)"
        let urlString = baseURL + urlPart1 + urlPart2
        performRequest(urlString: urlString)
        print(urlString)
        return
    }
    
    func performRequest(urlString: String) {
        // 1. Create a URL
        
        if let url = URL(string:urlString) {
            
            // 2. Create a URL Session
            let session = URLSession (configuration: .default)
            
            // 3. Give the session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
    func didUpdateCoinPrice() -> Bool {
        return true
    }
    
}
