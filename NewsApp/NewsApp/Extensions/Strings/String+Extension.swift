//
//  String+Extension.swift
//  NewsApp
//
//  Created by Yogesh Arora on 09/02/24.
//

import Foundation

extension String {
    func numberOfOccurrencesOf(string: String) -> Int {
        return self.components(separatedBy:string).count - 1
    }
}
