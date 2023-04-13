//
//  MyPageModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import RxDataSources

struct CouponModel{
    var header : String
    var items : [Item]
}

struct ConditionItem{
    var name: String
    var check : Bool
}
struct ConditionType{
    var title: String
    var image: UIImage
    var paymentDate : Date
    var expanded : Bool
    var condition : [ConditionItem]
    
    init(title: String, image: UIImage, paymentDate: Date, expanded: Bool, condition: [ConditionItem]) {
        self.title = title
        self.image = image
        self.paymentDate = paymentDate
        self.expanded = expanded
        self.condition = condition
    }
}





extension CouponModel:SectionModelType{
    
    typealias Item = ConditionType
    
    init(original: CouponModel, items: [Item]) {
        self = original
        self.items = items
    }
}
