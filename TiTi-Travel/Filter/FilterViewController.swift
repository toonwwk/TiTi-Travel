//
//  FilterViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 15/4/2564 BE.
//

import UIKit
import SWRevealViewController

protocol FilterViewControllerDelegate: AnyObject {
    func didTapConfirm(with categories: [String], and priceRange: String?)
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var filterLabel: UILabel!
    @IBOutlet weak var filterBackgroundView: UIView!
    
    let viewModel = FilterViewModel();
    private var allCell = [FilterDetailCollectionViewCell]()
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
        filterCollectionView.backgroundColor = UIColor.app.white
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.register(UINib(nibName: "FilterDetailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilterDetailCollectionViewCell")
        filterCollectionView.register(UINib(nibName: "CollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
    }
    
    @IBAction func didTapConfirmButton(_ sender: UIButton) {
        let categories = viewModel.selectedCategories
        let priceRange = viewModel.selectedPriceRange
        delegate?.didTapConfirm(with: categories, and: priceRange)
        viewModel.clear()
        self.revealViewController()?.rightRevealToggle(animated: true)

        for cell in allCell {
            cell.configure(with: false)
        }
    }
    
    
}

extension FilterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.getNumberOfFilterSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfItem(at: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterDetailCollectionViewCell", for: indexPath) as! FilterDetailCollectionViewCell
        let description = viewModel.dataForRow(at: indexPath)
        cell.configure(with: description)
        allCell.append(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
        let description = viewModel.dataForHeader(at: indexPath)
        header.configure(with: description)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterDetailCollectionViewCell {
            switch viewModel.sectionType(at: indexPath) {
            case .category:
                cell.configure(with: !cell.selectedState)
            case .priceRange:
                for row in 0..<viewModel.getNumberOfItem(at: indexPath.section) {
                    guard let priceRangeCell = collectionView.cellForItem(at: IndexPath(row: row, section: indexPath.section)) as? FilterDetailCollectionViewCell else { return }
                    
                    row == indexPath.row ? priceRangeCell.configure(with: !cell.selectedState): priceRangeCell.configure(with: false)
                }
            }
            
            viewModel.didSelectedCell(at: indexPath)
        }
    }
    
    func sectionType(at indexPath: IndexPath) -> FilterDetail {
        return FilterDetail(rawValue: indexPath.section)!
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
