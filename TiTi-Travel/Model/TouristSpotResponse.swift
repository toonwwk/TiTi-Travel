//
//  TouristSpotResponse.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 9/4/2564 BE.
//

import Foundation

struct TouristSpotResponse: Decodable {
    let found: Int?
    let locations: [TouristSpot]?
}
