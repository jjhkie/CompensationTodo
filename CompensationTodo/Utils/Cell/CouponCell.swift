//
//  CouponCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/11.
//

import UIKit
import SnapKit
import Then

class CouponCell:UITableViewCell{
    
    var containerStackView = UIStackView().then{
        $0.alignment = .center
        $0.axis = .vertical
    }
    
    var circle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50)).then{
        $0.layer.borderColor = CGColor(gray: 0.7, alpha: 0.7)
        $0.backgroundColor = .white
        $0.layer.borderWidth = 2
        $0.layer.cornerRadius = 15
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 0.5
        
        // masksToBounds 속성 설정
        $0.layer.masksToBounds = false
    }
    
    //MARK: Top View
    //top Container View
    var topContainerView = UIView().then{
        $0.layer.cornerRadius = 3
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 0.5
        
        // masksToBounds 속성 설정
        $0.layer.masksToBounds = false
    }
    
    var line = UIView().then{
        $0.backgroundColor = UIColor(hex: "#B1B2FF", alpha: 1) // remove
        $0.layer.cornerRadius = 2
    }
    
    //상단의 Image
    var topImageView = UIImageView().then{
        $0.image = UIImage(systemName: "books.vertical.fill")
    }
    
    //상단의 추첨권 Label
    var topTitleLabel = UILabel().then{
        $0.text = "test Coupon Text" // remove
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: Bottom View
    
    //조건을 담아둘 하단 View
    var bottomContainerView = UIView().then{
        //$0.axis = .vertical
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 0.5
    }
    
    //조건 Label
    var bottomDescriptionLabel = UILabel().then{
        $0.isHidden = true
        $0.text = "Test : Description Text" //Remove
    }
    
    var viewMore = UIButton().then{
        var config = UIButton.Configuration.plain()
        config.title = "viewMore"
        $0.backgroundColor = .white
        $0.configuration = config
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor(hex: Common.backgroundColor)
        layout()
        
        bottomContainerView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CouponCell{
    
    private func layout(){
        [line,circle,topImageView,topTitleLabel].forEach{
            topContainerView.addSubview($0)
        }
        
        [viewMore,bottomDescriptionLabel].forEach{
            bottomContainerView.addSubview($0)
        }

        //ContainerView
        [topContainerView,bottomContainerView].forEach{
            containerStackView.addArrangedSubview($0)
        }
        
        //Wrap
        [containerStackView].forEach{
            contentView.addSubview($0)
        }
        
        containerStackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
            $0.center.equalToSuperview()
        }
        
        topContainerView.snp.makeConstraints{
            $0.trailing.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        bottomContainerView.snp.makeConstraints{
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalTo(50)
        }
        
        line.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(3)
            $0.width.equalToSuperview().multipliedBy(0.8)
        }
        circle.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(-15)
            $0.width.height.equalTo(30)
        }
        
        topImageView.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.height.equalToSuperview().multipliedBy(0.5)
            $0.width.equalTo(topContainerView.snp.height).multipliedBy(0.5)
        }
        
        topTitleLabel.snp.makeConstraints{
            $0.top.equalTo(topImageView.snp.bottom).offset(10)
            $0.leading.equalTo(topImageView.snp.leading)
        }
        
        bottomDescriptionLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        viewMore.snp.makeConstraints{
            $0.top.equalTo(bottomDescriptionLabel.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
}
