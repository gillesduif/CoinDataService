//
//  File.swift
//  
//
//  Created by Gilles D'huyvetter on 28/06/2023.
//

import Foundation

// CoinGecko API info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 JSON Response:
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 58908,
     "market_cap": 1100013258170,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1235028318246,
     "total_volume": 69075964521,
     "high_24h": 59504,
     "low_24h": 57672,
     "price_change_24h": 808.94,
     "price_change_percentage_24h": 1.39234,
     "market_cap_change_24h": 13240944103,
     "market_cap_change_percentage_24h": 1.21837,
     "circulating_supply": 18704250,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 64805,
     "ath_change_percentage": -9.24909,
     "ath_date": "2021-04-14T11:54:46.763Z",
     "atl": 67.81,
     "atl_change_percentage": 86630.1867,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2021-05-09T04:06:09.766Z",
     "sparkline_in_7d": {
       "price": [
         57812.96915967891,
         57504.33531773738,
       ]
     },
     "price_change_percentage_24h_in_currency": 1.3923423473152687
   }
 
 */

//first commit
public struct Coin: Identifiable, Decodable {
    public let id, symbol, name: String
    public let image: String
    public let currentPrice: Double
    public let marketCap, marketCapRank, fullyDilutedValuation: Double?
    public let totalVolume, high24H, low24H: Double?
    public let priceChange24H: Double?
    public let priceChangePercentage24H: Double?
    public let marketCapChange24H: Double?
    public let marketCapChangePercentage24H: Double?
    public let circulatingSupply, totalSupply, maxSupply, ath: Double?
    public let athChangePercentage: Double?
    public let athDate: String?
    public let atl, atlChangePercentage: Double?
    public let atlDate: String?
    public let lastUpdated: String?
    public let priceChangePercentage24HInCurrency: Double?
    public let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
        
    }
    
    public var rank: Int {
        return Int(marketCapRank ?? 0)
    }
    
}
public struct CoinResponse: Decodable {
    
    public var coins: [Coin]?
    
}



