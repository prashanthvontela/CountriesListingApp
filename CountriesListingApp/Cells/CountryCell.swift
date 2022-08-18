import Foundation
import UIKit

class CountryCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var captialLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ country: CountryViewModel) {
        titleLabel.text = country.name + ", " + country.region
        codeLabel.text = country.code
        captialLabel.text = country.capital
        addSubview(titleLabel)
        addSubview(codeLabel)
        addSubview(captialLabel)
        
        //
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        //
        codeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20).isActive = true
        
        //
        
        captialLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        captialLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    }
}
