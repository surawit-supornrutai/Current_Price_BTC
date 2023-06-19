import UIKit

class ListCoinTableViewCell : UITableViewCell {

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width
    
    static var identifier: String {
        return String(describing: self)
    }
    
    let borderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = UIScreen.main.bounds.width * 0.04
        view.backgroundColor = UIColor(hex: "F8F9F9")
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "A Quite Place Part ||"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "October 1, 2021"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let viewmoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose This"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    let viewmoreIC: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .lightGray
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        //background
        self.addSubview(borderView)
        self.addConstraints(with: "V:[v0(\(screenWidth * 0.25))]", to: borderView)
        self.addConstraints(with: "H:[v0(\(screenWidth * 0.9))]", to: borderView)
        borderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        borderView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        borderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        borderView.addSubviews([titleLabel, currencyLabel, viewmoreLabel, viewmoreIC])
        
        //nameMovie
        self.addConstraints(with: "V:[v0]", to: titleLabel)
        self.addConstraints(with: "H:|-20-[v0]", to: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 15).isActive = true
        
        //date
        self.addConstraints(with: "V:[v0]", to: currencyLabel)
        self.addConstraints(with: "H:|-20-[v0]", to: currencyLabel)
        currencyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        
        //viewmore
        self.addConstraints(with: "V:[v0]", to: viewmoreLabel)
        self.addConstraints(with: "H:[v0]-30-|", to: viewmoreLabel)
        viewmoreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        
        //viewIC
        self.addConstraints(with: "V:[v0(20)]", to: viewmoreIC)
        self.addConstraints(with: "H:[v0(20)]", to: viewmoreIC)
        viewmoreIC.centerYAnchor.constraint(equalTo: viewmoreLabel.centerYAnchor).isActive = true
        viewmoreIC.leftAnchor.constraint(equalTo: viewmoreLabel.rightAnchor, constant: 5).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
