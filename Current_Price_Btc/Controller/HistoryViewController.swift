//
//  HistoryViewController.swift
//  Current_Price_Btc
//
//  Created by Surawit Supornrutai on 19/6/2566 BE.
//

import Foundation
import UIKit

class HistoryViewController: HistoryLayout{
    
    var filterListCurrency: [Currency] = []
    var historyListCurrency: [Currency] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLayout()
        setupDelegate()
        // Do any additional setup after loading the view.
    }
    
    func setupDelegate(){
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ListCoinTableViewCell.self, forCellReuseIdentifier: ListCoinTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchBarView.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backVC))

                // Enable user interaction for the label container view
        self.titleLabel.isUserInteractionEnabled = true

                // Add the tap gesture recognizer to the label container view
        self.titleLabel.addGestureRecognizer(tapGesture)
        self.hideKeyboardWhenTappedAroundTableView()
    }
    
    @objc func backVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterListCurrency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCoinTableViewCell.identifier, for: indexPath) as! ListCoinTableViewCell
        cell.titleLabel.text = "\(filterListCurrency[indexPath.row].rate ?? "") \(filterListCurrency[indexPath.row].code ?? "")"
        cell.currencyLabel.text = filterListCurrency[indexPath.row].description ?? ""
        return cell
    }
}

extension HistoryViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.activityIndicator.startAnimating()
        // Access the search query using searchBar.text
        let searchText = searchBar.text ?? ""
        
        if searchText.isEmpty {
            // Clear the filtered array
            filterListCurrency = self.historyListCurrency
        } else {
            // Perform search operation
            filterListCurrency = self.historyListCurrency.filter { currency in
                let description = currency.description ?? ""
                return description.contains(searchText)
            }
        }
        
        searchBar.resignFirstResponder()
        tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.activityIndicator.startAnimating()
        // Access the search query using searchBar.text
        let searchText = searchBar.text ?? ""
        
        if searchText.isEmpty {
            // Clear the filtered array
            filterListCurrency = self.historyListCurrency
        } else {
            // Perform search operation
            filterListCurrency = self.historyListCurrency.filter { currency in
                let description = currency.description ?? ""
                return description.contains(searchText)
            }
        }
        
        tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.activityIndicator.startAnimating()
        // Clear the search query and the filtered array
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filterListCurrency = []
        tableView.reloadData()
        self.activityIndicator.stopAnimating()
    }
}
