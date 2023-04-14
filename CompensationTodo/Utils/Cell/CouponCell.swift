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
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //상단의 Image
    var topImageView = UIImageView().then{
        $0.image = UIImage(systemName: "books.vertical.fill")
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //상단의 추첨권 Label
    var topTitleLabel = UILabel().then{
        $0.text = "test Coupon Text" // remove
        //$0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    //MARK: Bottom View
    
    //조건을 담아둘 하단 View
    var bottomView = UIStackView().then{
        $0.axis = .vertical
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 0.5
    }
    
    //조건 Label
    var bottomDescriptionLabel = UILabel().then{
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CouponCell{
    
    private func layout(){
        [line,topImageView,topTitleLabel].forEach{
            topContainerView.addSubview($0)
        }
//        [bottomDescriptionLabel,viewMore].forEach{
//            bottomView.addArrangedSubview($0)
//        }
        [topContainerView].forEach{
            containerStackView.addArrangedSubview($0)
        }
        [viewMore,bottomDescriptionLabel,containerStackView,circle].forEach{
            contentView.addSubview($0)
        }
        
        topContainerView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        //상단 line Constraints
        line.snp.makeConstraints{
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(3)
            $0.width.equalToSuperview().dividedBy(1.3)
        }
        
        
        //상단 image Constraints
        topImageView.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }
        
        // 상단 Label COnsstraints
        topTitleLabel.snp.makeConstraints{
            $0.top.equalTo(topImageView.snp.bottom)
            $0.leading.equalTo(topImageView.snp.leading)
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        
        
        
        bottomDescriptionLabel.snp.makeConstraints{
            $0.top.equalTo(containerStackView.snp.bottom).offset(-5)
            //$0.leading.equalTo()
            $0.height.equalTo(50)
            $0.edges.equalToSuperview()
        }
        
        //        viewMore.snp.makeConstraints{
        //            $0.leading.bottom.trailing.equalToSuperview().inset(10)
        //        }
        
        
        
        
        
        
        circle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().inset(15)
            $0.width.height.equalTo(30)
        }
        
        
        containerStackView.snp.makeConstraints{
            
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20))
        }
        //self.contentView.bringSubviewToFront(topContainerView)
        self.contentView.bringSubviewToFront(circle)
    }
    
}
