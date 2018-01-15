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
        var errorMessage = PublishSubject<String>()
    }
    /**
     1. get offline , if have data get image from local
     2. get online then
        2.1. reload data - if get offline is empty
        2.2 download image into local (in function save, checked exist iamge or not yet )
        2.3 save new data to realm when completed download image
     */
    func getAllWordBook() {
        getWordBookOffline()
        getWordBookOnline()
    }
    
    func getWordBookIdAt(index: Int) -> String? {
        return self.outputs.listWordBook.value[index].idWordBook
    }
}

extension WordBookViewModel {
    private func getWordBookOffline() {
        let wbOffline = KRealmHelper.shared.dbObjects(WordBook.self).toArray(ofType: WordBook.self)
        
        if !wbOffline.isEmpty {
            //--- check iamge saved
            let wbToShow = wbOffline.map { wb -> WordBook in
                let newWb = WordBook(idWordBook: wb.idWordBook, nameWordBook: wb.nameWordBook, urlWordBook: wb.urlWordBook)
                
                return newWb
            }
            self.outputs.listWordBook.value = wbToShow
        }
        
    }
    
    private func getWordBookOnline() {
        APIProvider(target: APIWordbook.getAllWordBook())
            .rxRequestArray(WordBook.self).subscribe(onNext: { wbs in
                self.downloadImageWordBook(listWordBook: wbs)
                //---
                if self.outputs.listWordBook.value.isEmpty {
                    self.outputs.listWordBook.value = wbs
                }
                
            }, onError: { error in
                self.outputs.errorMessage.onNext(error.localizedDescription)
            })
            .disposed(by: bag)
    }
    
    private func downloadImageWordBook(listWordBook: [WordBook]) {
        var tempCount = 0
        listWordBook.forEach { wb in
            if let id = wb.idWordBook, let urlImage = wb.urlWordBook, let url = URL(string: urlImage) {
                DownLoadHelper.shared.downLoadImage(url: url, to: id).subscribe( onCompleted: {
                    tempCount += 1
                    if tempCount == listWordBook.count {
                        KRealmHelper.shared.dbAddObjects(listWordBook, update: true)
                    }
                }).disposed(by: bag)
            }
        }
        
    }
}
