//
//  CouponAddView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/13.
//

import UIKit
import RxDataSources
import RxSwift
import SnapKit


class CouponAddView: UIViewController{
    
    let bag = DisposeBag()
 
    private let tableView = UITableView()
    
    private var dataSource: RxTableViewSectionedReloadDataSource<CouponAddModel> {
        return RxTableViewSectionedReloadDataSource<CouponAddModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                print(indexPath.section)
          
                switch indexPath.section{
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? AddCouponNameCell else {return UITableViewCell()}
                    return cell
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? AddCouponImageCell else {return UITableViewCell()}
                    return cell
                case 2:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "discountCell", for: indexPath) as? AddCouponDiscountCell else {return UITableViewCell()}
                    return cell
                default:
                    return UITableViewCell()
                }
  
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
        tableView.register(AddCouponNameCell.self, forCellReuseIdentifier: "nameCell")
        tableView.register(AddCouponImageCell.self, forCellReuseIdentifier: "imageCell")
        tableView.register(AddCouponDiscountCell.self, forCellReuseIdentifier: "discountCell")
        
        
    }
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
