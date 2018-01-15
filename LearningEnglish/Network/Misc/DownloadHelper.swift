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
    
    func downLoadImage(url: URL, to name: String) -> Observable<Double> {
        //---
        FileManagerHelper.shared.createImageFolder()
        return downLoad(url: url, to: name, fileType: .image)
    }
    
    func downLoadVoice(url: URL, to name: String) -> Observable<Double> {
        //---
        FileManagerHelper.shared.createVoiceFolder()
        return downLoad(url: url, to: name, fileType: .mp3)
    }
    
    /********************************* HELPER *******************************/
    
    private func createFolder(url: URL) {
        if !FileManager.default.fileExists(atPath: url.path) {
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
            
            var fileUrl: URL!
            
            if fileType == .image {
                fileUrl = FileManagerHelper.shared.imagesFolder.appendingPathComponent("\(name).\(fileType.rawValue)")
            } else {
                fileUrl = FileManagerHelper.shared.voicesFolder.appendingPathComponent("\(name).\(fileType.rawValue)")
            }
            
            // only download one time
            if FileManagerHelper.shared.checkExistFile(url: fileUrl) {
                observer.onCompleted()
            } else {
                Alamofire.request(url)
                    .downloadProgress { progress in
                        let percent = progress.fractionCompleted
                        observer.onNext(percent)
                        if percent == 1.0 {
                            observer.onCompleted()
                        }
                    }
                    .responseData { dataResponse in
                        if dataResponse.response?.statusCode ==  200 {
                            do {
                                if let data = dataResponse.data {
                                    try data.write(to: fileUrl, options: .atomic)
                                }
                            } catch {
                                print("error when save file \(name).\(fileType.rawValue)")
                                observer.onCompleted()
                            }
                        } else {
                            observer.onCompleted()
                        }
                }
            }
            return Disposables.create()
        })
    }
}
