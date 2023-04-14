//
//  AddCouponCell.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import SnapKit
import Then

protocol AddNameCellInput{
    var text: String { get}
    var textDidChange: ((String) -> Void)? {get set}
}

class AddCouponNameCell: UITableViewCell,AddNameCellInput{
    
    var nameTextView = UITextField().then{
        $0.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    var text: String {
        return nameTextView.text ?? ""
    }
    
    var textDidChange: ((String) -> Void)?
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("hey")
        textDidChange?(textField.text ?? "")
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        nameTextView.placeholder = "Coupon Name"
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
}

extension AddCouponNameCell{
    
    private func layout(){
        contentView.addSubview(nameTextView)
        
        nameTextView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            
        }
    }
}
