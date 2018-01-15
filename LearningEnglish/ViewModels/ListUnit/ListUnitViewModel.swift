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
    }
    
    func getAllUnit() {
        guard let id = inputs.idWordBook else { return }
        
        APIProvider(target: APIListUnit.getAllListUnit(idWordBook: id))
            .rxRequestArray(LEVUnit.self)
            .subscribe(onNext: { units in
            self.outputs.listUnit.value = units
        }, onError: { error in
            print(error.localizedDescription)
        }).disposed(by: bag)
    }
}
