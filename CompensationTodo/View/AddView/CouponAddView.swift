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
import Then


class CouponAddView: UIViewController{
    
    let bag = DisposeBag()
    
    var couponAddVM = CouponAddViewModel()
 
    private let tableView = UITableView().then{
        //$0.separatorStyle = .none
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        $0.register(AddCouponNameCell.self, forCellReuseIdentifier: "nameCell")
        $0.register(AddCouponImageCell.self, forCellReuseIdentifier: "imageCell")
        $0.register(AddCouponDiscountCell.self, forCellReuseIdentifier: "discountCell")
        $0.register(AddCouponLineColorCell.self, forCellReuseIdentifier: "lineColorCell")
    }
    
    //등록하기 버튼
    private let addButton = UIButton().then{
        $0.titleLabel?.text = "등록하기"
        $0.backgroundColor = .yellow
    }
    
    
    private var dataSource: RxTableViewSectionedReloadDataSource<CouponAddModel> {
        return RxTableViewSectionedReloadDataSource<CouponAddModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                print(indexPath.section)
                switch indexPath.section{
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as? AddCouponNameCell else {return UITableViewCell()}
                    cell.textDidChange = { text in
                        self.couponAddVM.updateText(text)
                    }
                    return cell
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? AddCouponImageCell else {return UITableViewCell()}
                    return cell
                case 2:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "discountCell", for: indexPath) as? AddCouponDiscountCell else {return UITableViewCell()}
                    return cell
                case 3:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "lineColorCell", for: indexPath) as? AddCouponLineColorCell else {return UITableViewCell()}
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
        bind(couponAddVM)
    
        layout()
    }
}

extension CouponAddView{
    
    func bind(_ VM: CouponAddViewModel){
        let input = CouponAddViewModel.Input(addButtonTapped: addButton.rx.tap.asObservable())
        let output = VM.inOut(input: input)
        
        
        output.cellData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
        addButton.rx.tap
            .bind(onNext: {
                self.navigationController?.popViewController(animated: true)
                print("View tap Pass")
            })
            .disposed(by: bag)

    }
    
    
    private func layout(){
        [tableView,addButton].forEach{
            view.addSubview($0)
        }
        
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        addButton.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            
        }
    }
}
