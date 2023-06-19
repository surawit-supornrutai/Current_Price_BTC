//
//  HistoryLayout.swift
//  Current_Price_Btc
//
//  Created by Surawit Supornrutai on 19/6/2566 BE.
//

import UIKit

class HistoryLayout: UIViewController {

    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.backgroundColor = .clear
        return indicator
    }()
    
    let backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Back", for: .normal)
        return btn
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Back"
        lb.textColor = .lightGray
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    let searchBarView: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Search with your currency"
        sb.searchBarStyle = .minimal
        return sb
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = UITableView.automaticDimension
        return table
    }()
    
    func setUpViewLayout(){
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        view.addConstraints(with: "V:[v0(50)]", to: activityIndicator)
        view.addConstraints(with: "H:[v0(50)]", to: activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //title
        view.addSubview(titleLabel)
        view.addConstraints(with: "V:[v0]", to: titleLabel)
        view.addConstraints(with: "H:|-\(screenWidth * 0.04)-[v0]", to: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        
        //searchBar
        view.addSubview(searchBarView)
        view.addConstraints(with: "V:[v0]", to: searchBarView)
        view.addConstraints(with: "H:[v0]-\(screenWidth * 0.04)-|", to: searchBarView)
        searchBarView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        searchBarView.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: screenWidth * 0.04).isActive = true
        
        //table
        view.addSubview(tableView)
        view.addConstraints(with: "V:[v0]|", to: tableView)
        view.addConstraints(with: "H:|[v0]|", to: tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
    }
}

