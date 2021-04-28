//
//  FilterViewModel.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 26/4/2564 BE.
//

import Foundation

enum FilterDetail: Int, CaseIterable {
    case category
    case priceRange
}

enum Category: Int, CaseIterable {
    case historical
    case shopping
    case cafe
    case food
    case relexing
    case bar
    case zoo
    
    var description: String {
        switch self {
            case .historical: return "Historical"
            case .shopping: return "Shopping Mall"
            case .cafe: return "Cafe"
            case .food: return "Restaurant"
            case .relexing: return "Relexing"
            case .bar: return "Bar"
            case .zoo: return "Zoo"
        }
    }
    
    var key: String {
        switch self {
            case .historical: return "historical"
            case .shopping: return "shopping"
            case .cafe: return "cafe"
            case .food: return "food"
            case .relexing: return "relexing"
            case .bar: return "bar"
            case .zoo: return "zoo"
        }
    }
}

enum PriceRange: Int, CaseIterable {
    case low
    case mid
    case high
    
    var description: String {
        switch self {
            case .low: return "Low"
            case .mid: return "Mid"
            case .high: return "High"
        }
    }
    
    var key: String {
        switch self {
            case .low: return "low"
            case .mid: return "mid"
            case .high: return "high"
        }
    }
}

class FilterViewModel {
    
    var selectedCategories = [String]()
    var selectedPriceRange: String?
    
    func clear() {
        selectedCategories = []
        selectedPriceRange = nil
    }
    
    func getNumberOfFilterSection() -> Int {
        return FilterDetail.allCases.count
    }
    
    func getNumberOfItem(at section: Int) -> Int {
        switch sectionType(at: IndexPath(row: 0, section: section)) {
        case .category:
            return Category.allCases.count
        case .priceRange:
            return PriceRange.allCases.count
        }
    }
    
    func sectionType(at indexPath: IndexPath) -> FilterDetail {
        return FilterDetail(rawValue: indexPath.section)!
    }
    
    func dataForRow(at indexPath: IndexPath) -> String {
        switch sectionType(at: indexPath) {
        case .category:
            return Category(rawValue: indexPath.row)?.description ?? ""
        case .priceRange:
            return PriceRange(rawValue: indexPath.row)?.description ?? ""
        }
    }
    
    func dataForHeader(at indexPath: IndexPath) -> String {
        switch sectionType(at: indexPath) {
        case .category:
            return "Categories"
        case .priceRange:
            return "Price Range"
        }
    }
    
    func didSelectedCell(at indexPath: IndexPath) {
        switch sectionType(at: indexPath) {
        case .category:
            if let category = Category(rawValue: indexPath.row)?.key, !selectedCategories.contains(category) {
                selectedCategories.append(category)
            }
        case .priceRange:
            selectedPriceRange = PriceRange(rawValue: indexPath.row)?.key
        }
    }
    
}
