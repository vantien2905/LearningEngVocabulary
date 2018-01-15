//
//  DownloadHelper.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/11/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//
import Alamofire
import RxSwift

enum FileTypeDownLoad: String {
    case mp3  = "mp3"
    case image = "jpg"
}

class DownLoadHelper {
    static let shared = DownLoadHelper()
    
    private let imagesFolder = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.appendingPathComponent("images")
    
    private let voicesFolder = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.appendingPathComponent("voices")
    
    func downLoadImage(url: URL, to name: String) -> Observable<Double> {
        //---
        createFolder(url: imagesFolder)
        return downLoad(url: url, to: name, fileType: .image)
    }
    
    func downLoadVoice(url: URL, to name: String) -> Observable<Double> {
        //---
        createFolder(url: voicesFolder)
        return downLoad(url: url, to: name, fileType: .mp3)
    }
    
    /********************************* HELPER *******************************/
    
    private func createFolder(url: URL) {
        if !FileManager.default.fileExists(atPath: imagesFolder.path) {
            do {
                try FileManager.default.createDirectory(atPath: url.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("error when create \(url.path)")
            }
        }
    }
    
    private func downLoad(url: URL, to name: String, fileType: FileTypeDownLoad) -> Observable<Double> {
        //---
        return Observable.create({ observer -> Disposable in
            Alamofire.request(url)
                .downloadProgress { progress in
                    let percent = progress.fractionCompleted
                    observer.onNext(percent)
                    if percent == 1.0 {
                        observer.onCompleted()
                    }
                }
                .responseData { dataResponse in
                    do {
                        let fileUrl = self.imagesFolder.appendingPathComponent("\(name).\(fileType.rawValue)")
                        if let data = dataResponse.data {
                            print(fileUrl)
                            try data.write(to: fileUrl, options: .atomic)
                        }
                    } catch {
                        print("error when save file \(name).\(fileType.rawValue)")
                        observer.onCompleted()
                    }
            }
            
            return Disposables.create()
        })
    }
}
