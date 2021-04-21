//
//  Service.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 16/2/2564 BE.
//

import Foundation
import Alamofire

class TiTiService {
    
    func fetchData(lat: Int, long: Int, priceRange: String, categories: [String], isCompleted: @escaping (TouristSpotResponse) -> (), isFailed: @escaping (Error) -> ()) {
                
        let categories = (categories.map{ category in "&catagories[]=" + category}).joined()
        let url = "https://titi/spots/?lat=\(lat)&long=\(long)&price_range=\(priceRange)" + categories

        AF.request(url).responseJSON { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success:
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let data = try decoder.decode(TouristSpotResponse.self, from: response.data!)
                    isCompleted(data)
                } catch {
                    isFailed(error)
                }
            }
        }
    }
    
}
