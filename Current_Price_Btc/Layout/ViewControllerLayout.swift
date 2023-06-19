//
//  ViewControllerLayout.swift
//  CinemoApp
//
//  Created by jung on 21/4/2566 BE.
//

import UIKit

class ViewControllerLayout: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.backgroundColor = .clear
        return indicator
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "BTC Finder"
        lb.textColor = .lightGray
        lb.font = UIFont.systemFont(ofSize: 23, weight: .regular)
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
    
    let chooseBPILabel: UILabel = {
        let lb = UILabel()
        lb.text = "Choose BPI"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    let inputTF: UITextField = {
        let tf = UITextField()
        tf.layer.borderColor = UIColor.purple.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 10
        tf.keyboardType = .numberPad
        tf.setPadding(left: 5)
        tf.placeholder = "Please fill"
        return tf
    }()
    
    let convertBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Convert", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .purple
        return btn
    }()
    
    let summaryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Summary : 0"
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return lb
    }()
    
    let historyBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("History", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .red
        return btn
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
        view.addConstraints(with: "V:[v0(\(screenHeight * 0.4))]", to: tableView)
        view.addConstraints(with: "H:|[v0]|", to: tableView)
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        //label
        view.addSubview(chooseBPILabel)
        view.addConstraints(with: "V:[v0]", to: chooseBPILabel)
        view.addConstraints(with: "H:[v0]", to: chooseBPILabel)
        chooseBPILabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chooseBPILabel.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20).isActive = true
        
        //textfield
        view.addSubview(inputTF)
        view.addConstraints(with: "V:[v0(\(screenHeight * 0.05))]", to: inputTF)
        view.addConstraints(with: "H:|-\(screenWidth * 0.2)-[v0(\(screenWidth * 0.35))]", to: inputTF)
        inputTF.topAnchor.constraint(equalTo: chooseBPILabel.bottomAnchor, constant: 20).isActive = true
        
        //button
        view.addSubview(convertBtn)
        view.addConstraints(with: "V:[v0(\(screenHeight * 0.05))]", to: convertBtn)
        view.addConstraints(with: "H:[v0(\(screenWidth * 0.2))]-\(screenWidth * 0.2)-|", to: convertBtn)
        convertBtn.topAnchor.constraint(equalTo: chooseBPILabel.bottomAnchor, constant: 20).isActive = true
        
        //summary
        view.addSubview(summaryLabel)
        view.addConstraints(with: "V:[v0]", to: summaryLabel)
        view.addConstraints(with: "H:[v0]", to: summaryLabel)
        summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        summaryLabel.topAnchor.constraint(equalTo: convertBtn.bottomAnchor, constant: 20).isActive = true
        
        //button
        view.addSubview(historyBtn)
        view.addConstraints(with: "V:[v0(\(screenHeight * 0.05))]", to: historyBtn)
        view.addConstraints(with: "H:|-\(screenWidth * 0.2)-[v0]-\(screenWidth * 0.2)-|", to: historyBtn)
        historyBtn.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor, constant: 20).isActive = true
        
    }
}

