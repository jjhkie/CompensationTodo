//
//  MyPageViewModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import RxSwift
import RxCocoa
import UIKit

class CouponPageViewModel{
    
    let bag = DisposeBag()
    
    var testData = [
        CouponModel(header: "예시1", items: [ConditionType(title: "쿠폰1", image: UIImage(systemName: "pill")!, paymentDate: Date(), expanded: false, condition: [ConditionItem(name: "조건 1", check: false)])]),
        CouponModel(header: "예시1", items: [ConditionType(title: "쿠폰1", image: UIImage(systemName: "pill")!, paymentDate: Date(), expanded: false, condition: [ConditionItem(name: "조건 1", check: false)])]),
        CouponModel(header: "예시1", items: [ConditionType(title: "쿠폰1", image: UIImage(systemName: "pill")!, paymentDate: Date(), expanded: false, condition: [ConditionItem(name: "조건 1", check: false)])])
    ]
    
    
    
    
    
    
    struct Input{
        let cellItemClick: Observable<IndexPath>
    }
    
    struct Output{
        let cellData: Driver<[CouponModel]>
    }
    
    //MARK:  Data
    let mainData = BehaviorRelay<[CouponModel]>(value: [])
    let selectedCellIndex = PublishSubject<IndexPath>()
    

}

//MARK: - Functions
extension CouponPageViewModel{
    
    func inOut(input: Input) -> Output{
        mainData.accept(testData)
        
        
        input.cellItemClick
            .subscribe(onNext: {indexPath in
                print(indexPath)
                var newData = self.mainData.value
                newData[indexPath.section].items[0].expanded = !newData[indexPath.section].items[0].expanded
                self.mainData.accept(newData)
            })
            .disposed(by: bag)
        
        return Output(cellData:mainData.asDriver(onErrorJustReturn: []))
    }
    
    func dataChange(){
        
    }
}
