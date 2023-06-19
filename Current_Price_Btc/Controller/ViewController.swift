//
//  ViewController.swift
//  Current_Price_Btc
//
//  Created by Surawit Supornrutai on 18/6/2566 BE.
//

import UIKit
import Alamofire

class ViewController: ViewControllerLayout {
    
    var listCurrency: [Currency] = []
    var filterListCurrency: [Currency] = []
    var historyListCurrency: [Currency] = []
    var chooseCurrency = ""
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewLayout()
        setupDelegate()
        startAutoUpdate()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            // Stop auto-updating the API when the view disappears
            stopAutoUpdate()
        }
    
    func setupDelegate(){
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.register(ListCoinTableViewCell.self, forCellReuseIdentifier: ListCoinTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchBarView.delegate = self
        convertBtn.addTarget(self, action: #selector(convertBPI), for: .touchUpInside)
        historyBtn.addTarget(self, action: #selector(goToHistoryVC), for: .touchUpInside)
        self.hideKeyboardWhenTappedAroundTableView()
    }
    
    func startAutoUpdate() {
        // Schedule the initial API call
        getCurrentPrice()
        
        // Schedule a repeating timer to update the API every minute
        timer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [weak self] _ in
            self?.getCurrentPrice()
        }
    }
    
    func stopAutoUpdate() {
        // Invalidate the timer to stop the auto-update
        timer?.invalidate()
        timer = nil
    }
    
    @objc func convertBPI(){
        if inputTF.text == "" || self.chooseCurrency.isEmpty {
            self.showDialog("กรุณาใส่ข้อมุล หรือ เลือกBPI ก่อน")
        } else {
            for i in 0...filterListCurrency.count - 1 {
                if filterListCurrency[i].code == self.chooseCurrency {
                    if let amountText = inputTF.text,
                        let amount = Double(amountText),
                        let rateFloat = filterListCurrency[i].rateFloat {

                        let btcAmount = amount / rateFloat
                        summaryLabel.text = "Summary : \(String(format: "%.8f", btcAmount))"
                    }
                }
            }
        }
    }
    
    @objc func goToHistoryVC(){
        let vc = HistoryViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.filterListCurrency = self.filterListCurrency
        vc.historyListCurrency = self.historyListCurrency
        self.present(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterListCurrency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCoinTableViewCell.identifier, for: indexPath) as! ListCoinTableViewCell
        cell.titleLabel.text = "\(filterListCurrency[indexPath.row].rate ?? "") \(filterListCurrency[indexPath.row].code ?? "")"
        cell.currencyLabel.text = filterListCurrency[indexPath.row].description ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseCurrency = filterListCurrency[indexPath.row].code ?? ""
        chooseBPILabel.text = chooseCurrency
    }
}

extension ViewController {
    func getCurrentPrice(){
        self.activityIndicator.startAnimating()
        let url = "\(Connection.API)"
        self.listCurrency.removeAll()
        AF.request(url).responseDecodable(of: CurrentPriceModel.self) { response in
            switch response.result {
            case .success(let bitcoinPrice):
                self.listCurrency.append((bitcoinPrice.bpi?.usd)!)
                self.listCurrency.append((bitcoinPrice.bpi?.eur)!)
                self.listCurrency.append((bitcoinPrice.bpi?.gbp)!)
                self.filterListCurrency = self.listCurrency
                self.historyListCurrency.append((bitcoinPrice.bpi?.usd)!)
                self.historyListCurrency.append((bitcoinPrice.bpi?.eur)!)
                self.historyListCurrency.append((bitcoinPrice.bpi?.gbp)!)
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            case .failure(let error):
                print("xxx \(error)")
                self.activityIndicator.stopAnimating()
            }
        }
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.activityIndicator.startAnimating()
        // Access the search query using searchBar.text
        let searchText = searchBar.text ?? ""
        
        if searchText.isEmpty {
            // Clear the filtered array
            filterListCurrency = self.listCurrency
        } else {
            // Perform search operation
            filterListCurrency = self.listCurrency.filter { currency in
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
            filterListCurrency = self.listCurrency
        } else {
            // Perform search operation
            filterListCurrency = self.listCurrency.filter { currency in
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
