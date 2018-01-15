//
//  FileManagerHelper.swift
//  LearningEnglish
//
//  Created by Kai Pham on 1/12/18.
//  Copyright © 2018 Tien Dinh. All rights reserved.
//

import Foundation

class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    let imagesFolder = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.appendingPathComponent("learnenglish/images")
    
    let voicesFolder = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!.appendingPathComponent("learnenglish/voices")
    
    func createFolder(url: URL) {
        if !checkExistFile(url: url) {
            do {
                try FileManager.default.createDirectory(atPath: url.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("error when create \(url.path)")
            }
        }
    }
    
    func checkExistFile(url: URL) -> Bool {
        return FileManager.default.fileExists(atPath: url.path)
    }
    
    func createImageFolder() {
        self.createFolder(url: imagesFolder)
    }
    
    func createVoiceFolder() {
        self.createFolder(url: voicesFolder)
    }
}
