//
//  SearchingLocationViewController.swift
//  TiTi-Travel
//
//  Created by Kanokporn Wongwaitayakul on 6/4/2564 BE.
//

import UIKit
import MapKit

protocol SearchingLocationViewControllerDelegate: AnyObject {
    func searchingLocationViewControllerDidSelect(_ location: Location)
}

class SearchingLocationViewController: UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var resultTableView: UITableView!
    
    private var searchCompleter = MKLocalSearchCompleter()
    private var searchResults = [MKLocalSearchCompletion]()
    
    weak var delegate: SearchingLocationViewControllerDelegate?
    
    static func instantiate() -> SearchingLocationViewController {
        return UIStoryboard(name: "SearchingLocationView", bundle: nil).instantiateViewController(withIdentifier: "SearchingLocationViewController") as! SearchingLocationViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    func commonInit() {
        searchCompleter.delegate = self
        searchField.delegate = self
        searchField.returnKeyType = UIReturnKeyType.done
        searchField.attributedPlaceholder = NSAttributedString(string: "search here", attributes: [NSAttributedString.Key.foregroundColor: UIColor.app.gray192])
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.backgroundColor = UIColor.app.gray229
        resultTableView.register(UINib.init(nibName: "SearchingLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchingLocationTableViewCell")
        view.backgroundColor = UIColor.app.green
        searchField.font = UIFont.app.regular15
        searchField.textColor = UIColor.app.brown
        searchField.backgroundColor = UIColor.app.white
        searchField.tintColor = UIColor.app.gray192
        searchField.becomeFirstResponder()
        searchImageView.image = UIImage.app.pin
        searchField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(){
        searchCompleter.queryFragment = (searchField.text ?? "")
    }
}

extension SearchingLocationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResults[indexPath.row]
        let cell = resultTableView.dequeueReusableCell(withIdentifier: "SearchingLocationTableViewCell", for: indexPath) as! SearchingLocationTableViewCell
        cell.configure(with: searchResult.title, and: searchResult.subtitle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let result = searchResults[indexPath.row]
        let searchRequest = MKLocalSearch.Request(completion: result)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { (response, error) in
            guard let coordinate = response?.mapItems[0].placemark.coordinate else { return }
            guard let title = response?.mapItems[0].name else { return }
            let location = Location(title: title, coordinate: coordinate)
            self.delegate?.searchingLocationViewControllerDidSelect(location)
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

extension SearchingLocationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

extension SearchingLocationViewController: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        searchResults = completer.results
        resultTableView.reloadData()
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print("error :: " + error.localizedDescription)
    }
    
}
