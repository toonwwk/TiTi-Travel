//
//  FilterViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/4/2564 BE.
//

import UIKit
import SWRevealViewController

enum FilterDetail: Int, CaseIterable {
    case category
    case priceRange
}

enum Category: Int, CaseIterable {
    case historical
    case shoppingMall
    case caltural
    case aquariumAndZoo
    case sportsAndPhysicalActivity
    case spaAndMassage
    case nightlife
    case cafeAndChillax
    case restaurant
    
    var description : String {
        switch self {
        case .historical: return "Historical"
        case .shoppingMall: return "Shopping Mall"
        case .caltural: return "Cutural"
        case .aquariumAndZoo: return "Aquarium and Zoo"
        case .sportsAndPhysicalActivity: return "Sports"
        case .spaAndMassage: return "Spa and Massage"
        case .nightlife: return "Nightlift"
        case .cafeAndChillax: return "Cafe"
        case .restaurant: return "Restaurant"
        }
    }
}

enum PriceRange: Int, CaseIterable {
    case low
    case mid
    case high
    
    var description : String {
        switch self {
        case .low: return "Low"
        case .mid: return "Mid"
        case .high: return "High"
        }
    }
}

protocol FilterViewControllerDelegate: AnyObject {
    func didTapConfirm()
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterBackgroundView: UIView!
    
    weak var delegate: FilterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        filterLabel.text = "Filter"
        filterLabel.font = UIFont.app.bold18
        filterLabel.textColor = UIColor.app.brown
        filterBackgroundView.backgroundColor = UIColor.app.gray229
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.backgroundColor = UIColor.app.orange
        confirmButton.setFontAndColor(with: UIFont.app.bold15, and: UIColor.app.white)
        confirmButton.layer.cornerRadius = 20
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.register(UINib(nibName: "FilterDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterDetailCollectionViewCell")
        filterCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
    }
    
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        delegate?.didTapConfirm()
        self.revealViewController()?.rightRevealToggle(animated: true)
    }
    
    
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return FilterDetail.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch sectionType(at: IndexPath(row: 0, section: section)) {
        case .category:
            return Category.allCases.count
        case .priceRange:
            return PriceRange.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterDetailCollectionViewCell", for: indexPath) as! FilterDetailCollectionViewCell
        cell.configure(with: dataForRow(at: indexPath))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
        header.configure(with: dataForHeader(at: indexPath))
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterDetailCollectionViewCell {
            cell.toggleState()
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
            return "Categoories"
        case .priceRange:
            return "Price Range"
        }
    }
    
}


extension FilterViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2.0
        return CGSize(width: width - 5, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: filterCollectionView.bounds.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
