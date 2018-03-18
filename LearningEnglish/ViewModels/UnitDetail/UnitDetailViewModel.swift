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
        var idListUnit = Variable<String>("")
    }
    
    class UnitDetailOutput {
        var listVocabulary = Variable<[Vocabulary]>([])
    }
    
    var inputs = UnitDetailInput()
    var outputs = UnitDetailOutput()
    
    init() {
        getAllVocabulary()
        inputs.idListUnit.asObservable().subscribe(onNext: { [weak self](_) in
            self?.getAllVocabulary()
        }).disposed(by: disposeBag)
    }
    
    func getListVocabularyOffline() {
        let listVocabulary = KRealmHelper.shared.dbObjects(Vocabulary.self).toArray(ofType: Vocabulary.self).filter { (word) -> Bool in
            return word.idUnit == inputs.idListUnit.value
        }
        if !listVocabulary.isEmpty {
            let vocabularyToShow = listVocabulary.map { unit -> Vocabulary in
                let vocabulary = Vocabulary(num: unit.num, english: unit.english, vnRaw: unit.vnRaw, example: unit.example, vietnamese: unit.vietnamese, idUnit: unit.idUnit, thumbUrl: unit.thumbUrl, voice: unit.voice)
                return vocabulary
            }
            self.outputs.listVocabulary.value = vocabularyToShow
        }
    }
    
    func getListVocabularyOnline(idListUnit: String) {
        APIProvider(target: APIUnitDetail.getUnitDetail(idListUnit: idListUnit))
            .rxRequestArray(Vocabulary.self).subscribe(onNext: { [weak self] listVocabulary in
                self?.outputs.listVocabulary.value = listVocabulary
            }).disposed(by: disposeBag)
    }
    
    func getAllVocabulary() {
        getListVocabularyOffline()
        getListVocabularyOnline(idListUnit: inputs.idListUnit.value)
    }
}
