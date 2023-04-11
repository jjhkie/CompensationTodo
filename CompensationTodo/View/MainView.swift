//
//  MainView.swift
//  CompensationTodo
//
//  Created by 김진혁 on 2023/04/10.
//

import UIKit
import SnapKit
import Then
import RxCocoa
import RxSwift

class MainView:UIViewController{
    
    let bag = DisposeBag()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then{
        $0.backgroundColor = UIColor(hex: Common.backgroundColor)

        $0.register(MainCell.self, forCellWithReuseIdentifier: "Cell")
        $0.contentInset = UIEdgeInsets(top: Common.cellInset, left: Common.cellInset, bottom: Common.cellInset, right: Common.cellInset)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: Common.backgroundColor)
        
        setupFlowLayout()
        bind(MainViewModel())
        layout()
    }
}


extension MainView{
    
    func bind(_ VM: MainViewModel){
        let input = MainViewModel.Input()
        
        let output = VM.inOut(input: input)
        

        output.mainColVData
            .drive(collectionView.rx.items(cellIdentifier: "Cell",cellType: MainCell.self)){row,element,cell in

                if let titleData = element.name{
                    cell.titleLabel.text = "\(titleData)"
                }else{
                    cell.titleLabel.text = "등록된 상품이 없습니다."
                }
                
                //날짜 설정
                if let timeData = element.time{
                    cell.timeLabel.text = "\(timeData)"
                }else{
                    cell.timeLabel.text = "상품을 등록해주세요"
                }
                
                //이미지 설정
                if let mainImage = element.image{
                    cell.thumnail.image = mainImage
                }else{
                    cell.thumnail.image = UIImage(systemName: "plus")
                }
                
                //즐겨찾기 설정
                if let favoriteData = element.favorite{
                    cell.starButton.image = favoriteData ? UIImage(named: "star.fill") : UIImage(systemName: "star")
                }else{
                    cell.starButton.isHidden = true
                }
                
            }
            .disposed(by: bag)
        
        //상품 클릭 시 화면 이동
        collectionView.rx.modelSelected(MainListModel.self)
            .bind(onNext: {mainData in
                if mainData.name != nil{
                    self.navigationController?.pushViewController(ProductDetailView(), animated: true)
                }else{
                    self.navigationController?.pushViewController(ProductAddView(), animated: true)
                }
            })
            .disposed(by: bag)
    }
    
    
    //MARK:  Layout
    private func layout(){
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK:  flowLayout Setting
    func setupFlowLayout(){
        let flowLayout = UICollectionViewFlowLayout().then{
            let width = (Common.screenWidth - (Common.cellInset * 3)) / 2
            
            $0.itemSize = CGSize(width: width, height: width * 1.3)
        }
        collectionView.collectionViewLayout = flowLayout
    }
}
