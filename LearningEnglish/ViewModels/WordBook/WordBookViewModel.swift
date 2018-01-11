//
//  WordBookViewModel.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/6/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation
import RxSwift

class WordBookViewModel {
    let bag = DisposeBag()
    
    // input
    class WordBookInput {
    
    }
    
    // output
    class WordBookOutput {
        var listWordBook = Variable<[WordBook]>([])
    }
    
    func getAllWordBook() {
        APIProvider(target: APIWordbook.getAllWordBook())
            .rxRequestArray(WordBook.self).subscribe(onNext: { wb in
                self.outputs.listWordBook.value = wb
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: bag)
    }
    
    var inputs = WordBookInput()
    var outputs = WordBookOutput()
}
