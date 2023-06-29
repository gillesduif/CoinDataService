//
//  File.swift
//  
//
//  Created by Gilles D'huyvetter on 28/06/2023.
//
//first commit
import Foundation

public struct CoinDataClient {
    
private let urlSession = URLSession.shared
private let baseURL = "https://api.coingecko.com/api/v3/"

private let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}()

    
    
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter
}()

    public init() {}
public func fetchTop250Coins(currency: String) async throws -> [Coin] {
    let url = baseURL + "/coins/markets?vs_currency=\(currency)&order=market_cap_desc&per_page=250&page=1&sparkline=false&price_change_percentage=24h"
    let urlRequest = URLRequest(url: URL(string: url)!)
    let response: CoinResponse = try await fetchData(request: urlRequest)
    guard let coinsTable = response.coins else {
        throw "Top Scorers not found"
    }
    print(response)
    return coinsTable
}

private func fetchData<D: Decodable>(request: URLRequest) async throws -> D {
    let urlRequest = request
    let (data, response) = try await urlSession.data(for: urlRequest)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw "Data not found. Code \((response as? HTTPURLResponse)?.statusCode ?? -1)"
    }
    
    let model = try self.jsonDecoder.decode(D.self, from: data)
    return model
}

}


extension String: Error, LocalizedError {

public var errorDescription: String? { self }

}
