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
    var inputs = WordBookInput()
    var outputs = WordBookOutput()
    
    // input
    class WordBookInput {
        
    }
    
    // output
    class WordBookOutput {
        var listWordBook = Variable<[WordBook]>([])
    }
    
    private func getWordBookOffline() {
        let wbOffline = KRealmHelper.shared.dbObjects(WordBook.self).toArray(ofType: WordBook.self)
        self.outputs.listWordBook.value = wbOffline
    }
    
    private func getWordBookOnline() {
        APIProvider(target: APIWordbook.getAllWordBook())
            .rxRequestArray(WordBook.self).subscribe(onNext: { wb in
                KRealmHelper.shared.dbAddObjects(wb, update: true)
                
                //---
                if self.outputs.listWordBook.value.isEmpty {
                    self.outputs.listWordBook.value = wb
                }
                
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: bag)
    }
    
    private func downloadImageWordBook(listWordBook: [WordBook]) {
        listWordBook.forEach { wb in
            if let id = wb.idWordBook, let urlImage = wb.urlWordBook, let url = URL(string: urlImage) {
                DownLoadHelper.shared.downLoadImage(url: url, to: id).subscribe( onCompleted: {
                    print(id)
                }).disposed(by: bag)
            }
        }
        
    }
    
    func getAllWordBook() {
        getWordBookOffline()
        getWordBookOnline()
    }
    
    func getWordBookIdAt(index: Int) -> String? {
        return self.outputs.listWordBook.value[index].idWordBook
    }
}
