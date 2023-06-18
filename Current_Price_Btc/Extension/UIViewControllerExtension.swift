//
//  UIViewControllerExtension.swift
//  CinemoApp
//
//  Created by jung on 21/4/2566 BE.
//

import Foundation
import UIKit

extension UIViewController {
    func showDialog(_ msg: String){
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ตกลง", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func hideKeyboardWhenTappedAroundTableView() {
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            // Do your thang here!
            self.view.endEditing(true)
            for textField in self.view.subviews where textField is UITextField {
                textField.resignFirstResponder()
            }
            
            for searchBar in self.view.subviews where searchBar is UISearchBar {
                searchBar.resignFirstResponder()
            }
        }
        sender.cancelsTouchesInView = false
    }
}
