//
//  MyPageViewModel.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import RxSwift
import RxCocoa
import Foundation

class CouponPageViewModel{
    
    let bag = DisposeBag()
    
    var testData = [CouponModel(title: "Coupon",expanded: false),
                    CouponModel(title: "Coupon",expanded: false),
                    CouponModel(title: "Coupon",expanded: false),
                    CouponModel(title: "Coupon",expanded: false),
                    CouponModel(title: "Coupon",expanded: false)
                    ]
    
    struct Input{
        let cellSelected : Observable<IndexPath>
    }
    
    struct Output{
        let cellData: Driver<[CouponModel]>
    }
    
    //MARK:  Data
    let mainData = BehaviorRelay<[CouponModel]>(value: [])
    

}

//MARK: - Functions
extension CouponPageViewModel{
    
    func inOut(input: Input) -> Output{
        
        mainData.accept(testData)
        
        input.cellSelected
            .subscribe(onNext: {_ in 
                print("abc")
            })
            .disposed(by: bag)
            
        
        return Output(cellData:mainData.asDriver(onErrorJustReturn: []))
    }
    
    func toggleCellHeight(at indexPath: IndexPath) {
        testData[indexPath.row].expanded.toggle()
        
    }
}
