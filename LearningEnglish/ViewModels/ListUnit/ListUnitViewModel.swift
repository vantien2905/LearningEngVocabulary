//
//  ListUnitViewModel.swift
//  LearningEnglish
//
//  Created by Tu DV on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation
import RxSwift

class ListUnitViewModel {
    
    var outputs = ListUnitOutput()
    var inputs = ListUnitInput()
    let bag = DisposeBag()
    
    //input -- VC -> VM
    class ListUnitInput {
        var idWordBook: String?
    }
    
    func setIdWordbook(idWordBook: String?) {
        self.inputs.idWordBook = idWordBook
    }
    
    // output VM -> VC
    class ListUnitOutput {
        var listUnit = Variable<[LEVUnit]>([])
        var errorMessage = PublishSubject<String>()
    }
    
    func getAllUnit() {
        getUnitOffline()
        getUnitOnline()
    }
    
}

extension ListUnitViewModel {
    
    private func getUnitOffline() {
        
        let unitOffline = KRealmHelper.shared.dbObjects(LEVUnit.self).toArray(ofType: LEVUnit.self)
        if !unitOffline.isEmpty {
            let unitToShow = unitOffline.map { unit -> LEVUnit in
                let newUnit = LEVUnit(idUnit: unit.idUnit, idWordBook: unit.idWordBook, nameUnit: unit.nameUnit, urlUnit: unit.urlUnit, score: unit.score.value)
                return newUnit
            }
            self.outputs.listUnit.value = unitToShow
        }
    }
    
    private func getUnitOnline() {
        guard let id = inputs.idWordBook else { return }
        
        APIProvider(target: APIListUnit.getAllListUnit(idWordBook: id))
            .rxRequestArray(LEVUnit.self)
            .subscribe(onNext: { units in
                self.downLoadImageUnit(listUnit: units)
                
                if self.outputs.listUnit.value.isEmpty {
                    self.outputs.listUnit.value = units
                }
            }, onError: { error in
                self.outputs.errorMessage.onNext(error.localizedDescription)
            }).disposed(by: bag)
    }
    
    private func downLoadImageUnit(listUnit: [LEVUnit]) {
        var tempCount = 0
        listUnit.forEach { unit in
            if let id = unit.idUnit, let urlImage = unit.urlUnit, let url = URL(string: urlImage) {
                DownLoadHelper.shared.downLoadImage(url: url, to: id).subscribe( onCompleted: {
                    tempCount += 1
                    if tempCount == listUnit.count {
                        KRealmHelper.shared.dbAddObjects(listUnit, update: true)
                    }
                }).disposed(by: bag)
            }
        }
        
    }
}
