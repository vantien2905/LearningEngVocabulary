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
        
    }
    
}

extension ListUnitViewModel {
    private func getUnitOffline(idWordBook: String) {
//        let wbOffline = KRealmHelper.shared.dbObjects(WordBook.self).toArray(ofType: WordBook.self)
//
//        //--- check iamge saved
//        let wbToShow = wbOffline.map { wb -> WordBook in
//            let newWb = WordBook(idWordBook: wb.idWordBook, nameWordBook: wb.nameWordBook, urlWordBook: wb.urlWordBook)
//
//            return newWb
//        }
//
//        self.outputs.listWordBook.value = wbToShow
    }
    
    private func getUnitOnline() {
        guard let id = inputs.idWordBook else { return }
        
        APIProvider(target: APIListUnit.getAllListUnit(idWordBook: id))
            .rxRequestArray(LEVUnit.self)
            .subscribe(onNext: { units in
                KRealmHelper.shared.dbAddObjects(units, update: true)
                
                
                if self.outputs.listUnit.value.isEmpty {
                    self.outputs.listUnit.value = units
                }
            }, onError: { error in
                self.outputs.errorMessage.onNext(error.localizedDescription)
            }).disposed(by: bag)
    }
}
