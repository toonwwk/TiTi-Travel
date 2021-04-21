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
    
    static func instantiate() -> TouristSpotDetailViewController {
        return UIStoryboard(name: "TouristSpotDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "TouristSpotDetailViewController") as! TouristSpotDetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        imagesBackgroundView.backgroundColor = UIColor.app.gray229
        imageCollectionView.layer.cornerRadius = 20
        imageCollectionView.backgroundColor = .clear
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        detailTableView.register(UINib.init(nibName: "TouristSpotDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "TouristSpotDetailTableViewCell")
    }
    var d = false

}

extension TouristSpotDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        let url = URL(string: "https://scontent.fkdt1-1.fna.fbcdn.net/v/t1.6435-9/37875455_1737957706241327_895234938704494592_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=8bfeb9&_nc_eui2=AeFtt2pYgFXsevD2mAZ18Zoo-bWwVKcUjgn5tbBUpxSOCS4gQUNHmnjbzpaOyEgNbdfgFancdcxaPzoK2hvyFIJM&_nc_ohc=LeJKWZQipycAX-Cu6qj&_nc_ht=scontent.fkdt1-1.fna&oh=131206530a2b8e6b0ad0a2bcaf23b345&oe=60A3A148")!
        cell.configure(with: url)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        d = !d
        let cell = tableView.dequeueReusableCell(withIdentifier: "TouristSpotDetailTableViewCell") as! TouristSpotDetailTableViewCell
        cell.configure(with: UIImage.app.appLogo, and: d ? "this is erosion cry with rock ajsdhnkandu kjdsnfjknd sdkjfbnjdbsnji bn fnkjdnjk ns fkjnsjdnf kjsdnfjkn  sndkjfn": "sss")
        return cell
    }
    
}
