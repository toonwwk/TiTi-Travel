//
//  TouristSpotDetailViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 23/4/2564 BE.
//

import Foundation

enum TouristSpotDetailCellType: Int, CaseIterable {
    case title
    case description
    case price
    case priceRange
    
    var iconName : String {
        switch self {
            case .title: return "mappin.circle"
            case .description: return "info.circle"
            case .price: return "dollarsign.circle"
            case .priceRange: return "banknote"
        }
    }
}

class TouristSpotDetailViewModel {
    
    let title: String
    let description: String
    let price: String
    let priceRange: String
    var images: [URL]
        
    init(title: String, des: String, price: Double, images: [String], priceRange: String) {
        self.title = title
        self.description = des
        self.price = String(format: "%.2f", price)
        self.priceRange = priceRange
        self.images = [URL]()
        for urlString in images {
            if let url = URL(string: urlString) { self.images.append(url) }
        }
    }
    
    func getNumberOfImages() -> Int {
        return images.count
    }
    
    func imageUrl(at indexPath: IndexPath) -> URL{
        return images[indexPath.row]
    }
    
    func getNumberOfDetailCell() -> Int {
        return TouristSpotDetailCellType.allCases.count
    }
    
    func detailCellType(at indexPath: IndexPath) -> TouristSpotDetailCellType {
        return TouristSpotDetailCellType(rawValue: indexPath.row) ?? .title
    }
    
    func textForDetailCell(at indexPath: IndexPath) -> String {
        switch detailCellType(at: indexPath) {
        case .title:
            return title
        case .description:
            return description
        case .price:
            return price
        case .priceRange:
            return priceRange
        }
    }
    
    func iconNameForDetailCell(at indexPath: IndexPath) -> String {
        return detailCellType(at: indexPath).iconName
    }
    
}
