//
//  MyPageView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxDataSources

class CouponPageView: UIViewController{
    
    let bag = DisposeBag()
    
    let tableView = UITableView().then{
        $0.backgroundColor = UIColor(hex: Common.backgroundColor)
        $0.register(CouponCell.self, forCellReuseIdentifier: "Cell")

        $0.estimatedRowHeight = 100
        $0.rowHeight = UITableView.automaticDimension
        
        $0.separatorStyle = .none
        //$0.register(UITableViewCell.self, forHeaderFooterViewReuseIdentifier: "Header")
    }
    
    var dataSource: RxTableViewSectionedReloadDataSource<CouponModel> {
        return RxTableViewSectionedReloadDataSource<CouponModel>(
            configureCell: { dataSource, tableView, indexPath, item in
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CouponCell else {return UITableViewCell()}
                cell.bottomDescriptionLabel.text = item.title
                
                cell.bottomView.isHidden = !item.expanded
                //cell.textLabel?.text = item
                return cell
            },
            titleForHeaderInSection: { dataSource, index in
                return dataSource.sectionModels[index].header
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: Common.backgroundColor)
        
        bind(CouponPageViewModel())
        layout()
    }
}



extension CouponPageView{
    
    func bind(_ VM: CouponPageViewModel){
        
        let input = CouponPageViewModel.Input(cellItemClick: tableView.rx.itemSelected.asObservable())
        
        let output = VM.inOut(input: input)
        
        output.cellData
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
        
//        tableView.rx.itemSelected
//            .bind(onNext: {indexPath in
//                guard let cell = self.tableView.cellForRow(at: indexPath) as? CouponCell else {return}
//                cell.bottomView.isHidden = !cell.bottomView.isHidden
//                print(indexPath)
//                self.tableView.reloadRows(at: [indexPath], with: .automatic)
//            })
//            .disposed(by: bag)
//
//        tableView.rx.itemSelected
//            .bind(onNext: {indexPath in
//                //현재 선택된 셀의 정보
//                guard let cell = self.tableView.cellForRow(at: indexPath) as? CouponCell else {return}
//                cell.expanded = !cell.expanded
//                if cell.expanded{
//                    UIView.animate(withDuration: 0.1, delay: 0,options: .curveEaseOut, animations: {
//                        
//                        cell.backgroundColor = .blue
//                        cell.wrapView.snp.updateConstraints{
//
//                            $0.height.equalTo(500)
//                        }
//                        cell.layoutIfNeeded()
//                    })
//                }else{
//                    UIView.animate(withDuration: 0.1, delay: 0,options: .curveEaseOut, animations: {
//                        cell.backgroundColor = .green
//                        cell.wrapView.snp.updateConstraints{
//                            $0.height.equalTo(200)
//                        }
//                        cell.layoutIfNeeded()
//                    })
//                    
//                    //self.tableView.reloadRows(at: [indexPath], with: .automatic)
//                }
//            })
//            .disposed(by: bag)
    }
    
    
    
    private func layout(){
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
}
