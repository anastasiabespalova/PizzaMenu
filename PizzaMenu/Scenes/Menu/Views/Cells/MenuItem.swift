//
//  MenuItem.swift
//  PizzaMenu
//
//  Created by Анастасия Беспалова on 12.12.2021.
//


import UIKit

class MenuItem: UITableViewCell {
    
    let priceButton: UIButton! = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.layer.borderColor = MenuConstants.brightPinkColor.cgColor
        button.layer.borderWidth = 1
        button.setTitleColor(MenuConstants.brightPinkColor, for: .normal)
        button.titleLabel?.font = MenuConstants.priceButtonLabelFont
        return button
    }()
    
    let itemImageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var nameLabel: UILabel! = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = MenuConstants.itemNameLabelFont
        return label
    }()
    
    var descriptionLabel: UILabel! = {
        let label = UILabel()
        label.font = MenuConstants.itemDescriptionLabelFont
        label.textColor = .systemGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(priceButton)
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        
        itemImageView.snp.makeConstraints() {
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.left.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints() {
            $0.top.equalToSuperview().offset(35)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.left.equalTo(itemImageView.snp_rightMargin).offset(20)
        }
        
        descriptionLabel.snp.makeConstraints() {
            $0.top.equalTo(nameLabel.snp_bottomMargin).offset(15)
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.left.equalTo(itemImageView.snp_rightMargin).offset(20)
        }
        
        priceButton.snp.makeConstraints() {
            $0.top.equalTo(descriptionLabel.snp_bottomMargin).offset(15)
            $0.right.equalTo(descriptionLabel.snp_rightMargin)
            $0.width.equalTo(80)
        }
        
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(_ item: DisplayedItem) {
        nameLabel.text = item.name
        descriptionLabel.text = item.composition
        priceButton.setTitle("от \(item.price) ₽", for: .normal)
        if let image = item.img {
            itemImageView.image = image
        }
    }
}
