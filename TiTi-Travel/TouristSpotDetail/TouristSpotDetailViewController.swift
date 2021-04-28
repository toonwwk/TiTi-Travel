//
//  TouristSpotDetailViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 21/4/2564 BE.
//

import UIKit

class TouristSpotDetailViewController: UIViewController {
    
    @IBOutlet weak var imagesBackgroundView: UIView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var viewModel: TouristSpotDetailViewModel?
    
    static func instantiate() -> TouristSpotDetailViewController {
        return UIStoryboard(name: "TouristSpotDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "TouristSpotDetailViewController") as! TouristSpotDetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        detailTableView.backgroundColor = UIColor.app.white
        imagesBackgroundView.backgroundColor = UIColor.app.gray229
        imageCollectionView.layer.cornerRadius = 20
        imageCollectionView.backgroundColor = .clear
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        detailTableView.register(UINib.init(nibName: "TouristSpotDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "TouristSpotDetailTableViewCell")
    }
    
    func configure(with viewModel: TouristSpotDetailViewModel) {
        self.viewModel = viewModel
    }

}

extension TouristSpotDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getNumberOfImages() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let url = viewModel?.imageUrl(at: indexPath)
        cell.configure(with: url!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

extension TouristSpotDetailViewController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfDetailCell() ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TouristSpotDetailTableViewCell") as! TouristSpotDetailTableViewCell
        var icon = UIImage()
        
        if #available(iOS 13.0, *) {
            icon = UIImage(systemName: (viewModel?.detailCellType(at: indexPath).iconName)!) ?? UIImage.app.appLogo
        } else {
            icon = UIImage.app.appLogo
        }

        cell.configure(with: icon, and: viewModel?.textForDetailCell(at: indexPath) ?? "")
        return cell
    }
    
}
