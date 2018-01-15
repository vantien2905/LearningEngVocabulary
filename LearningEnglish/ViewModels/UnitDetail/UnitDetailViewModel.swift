//
//  UnitDetailViewModel.swift
//  LearningEnglish
//
//  Created by Felix Dinh on 1/9/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation
import RxSwift

class UnitDetailViewModel {
    let disposeBag = DisposeBag()
    
    class UnitDetailInput {
        
    }
    
    class UnitDetailOutput {
        var listVocabulary = Variable<[Vocabulary]>([])
    }
    
    var inputs = UnitDetailInput()
    var outputs = UnitDetailOutput()
    
    init() {
        getAllVocabulary()
    }
    
    func getListVocabularyOffline() {
        let listVocabulary = KRealmHelper.shared.dbObjects(Vocabulary.self).toArray(ofType: Vocabulary.self)
        if !listVocabulary.isEmpty {
            let vocabularyToShow = listVocabulary.map { unit -> Vocabulary in
                let vocabulary = Vocabulary(num: unit.num, english: unit.english, vnRaw: unit.vnRaw, example: unit.example, vietnamese: unit.vietnamese, idUnit: unit.idUnit, thumbUrl: unit.thumbUrl, voice: unit.voice)
                return vocabulary
            }
            self.outputs.listVocabulary.value = vocabularyToShow
        }
    }
    
    func getListVocabularyOnline() {
        APIProvider(target: APIUnitDetail.getUnitDetail(idListUnit: "u1_1"))
            .rxRequestArray(Vocabulary.self).subscribe(onNext: { listVocabulary in
                KRealmHelper.shared.dbAddObjects(listVocabulary, update: true)
                self.outputs.listVocabulary.value = listVocabulary
            }).disposed(by: disposeBag)
    }
    
    func getAllVocabulary() {
        getListVocabularyOffline()
        getListVocabularyOnline()
    }
}
