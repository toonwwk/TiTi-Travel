//
//  Service.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import Foundation
import Alamofire

class TiTiService {
    
    func fetchData(isCompleted: @escaping ([TouristSpot]) -> (), isFailed: @escaping (Error) -> ()) {
        let tempURL = "http://127.0.0.1:5000/mock"

        AF.request(tempURL).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let data = try decoder.decode([TouristSpot].self, from: response.data!)
                    isCompleted(data)
                } catch {
                    isFailed(error)
                }
            }
        }
    }
    
    func fetchData(with model: QueryModel, isCompleted: @escaping ([TouristSpot]) -> (), isFailed: @escaping (Error) -> ()) {
        let urlString = getUrl(from: model)
        
        AF.request(urlString).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let data = try decoder.decode([TouristSpot].self, from: response.data!)
                    isCompleted(data)
                } catch {
                    isFailed(error)
                }
            }
        } 
    }
    
    func getUrl(from model: QueryModel) -> String {

        var urlString = "https://stormy-meadow-26849.herokuapp.com/titi/spots?lat=\(roundDouble(model.lat))&long=\(roundDouble(model.long))"
        
        if(!model.categories.isEmpty) {
            urlString = urlString + (model.categories.map{ category in "&categories=" + category}).joined()
        }
        
        if let priceRange = model.priceRange { urlString = urlString + "&price_ranges=\(priceRange)" }
        
        print("url ::::: ", urlString)
        return urlString
    }
    
    func roundDouble(_ double: Double) -> Double{
        return Double(round(100000 * double)/100000)
    }
    
}
