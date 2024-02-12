//
//  JsonReader.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

class JsonReader {
    func getJsonData(from fileName: String) -> Data? {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: filePath), options: .mappedIfSafe)
                return data
            } catch {
                return nil
            }
        }
        
        return nil
    }
}
