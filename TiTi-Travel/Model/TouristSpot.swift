//
//  TouristSpot.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 9/4/2564 BE.
//

import Foundation

struct TouristSpot: Decodable {
    let category: [String]?
    let name: String?
    let description: String?
    let estimatePrice: Double?
    let latitude: Double?
    let longtitude: Double?
    let image: [String]?
    let priceRange: String?
    let id: Int?
}

