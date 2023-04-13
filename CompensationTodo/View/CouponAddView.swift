//
//  CouponAddView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import RxDataSources
import RxSwift

class CouponAddView: UITableViewController{
    
    let bag = DisposeBag()
    //let floaty = Floaty()
    
    var dataSource: RxTableViewSectionedReloadDataSource<CouponAddModel> {
        return RxTableViewSectionedReloadDataSource<CouponAddModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UITableViewCell else {return UITableViewCell()}
                
                cell.textLabel?.text = item.couponName

                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(CouponAddViewModel())
        attribute()
        layout()
    }
}

extension CouponAddView{
    
    func bind(_ VM: CouponAddViewModel){
        let input = CouponAddViewModel.Input()
        let output = VM.inOut(input: input)
        
        
        output.cellData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    private func attribute(){
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    
    private func layout(){
        //view.addSubview(floaty)
    }
}
