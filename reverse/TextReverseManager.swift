//
//  TextReverseManager.swift
//  reverseUITests
//
//  Created by Oleksandr Melnyk on 20.07.2022.
//

import Foundation

final class TextReverseManager {
    
    func reversedText(sentence: String) -> String {
        guard !sentence.isEmpty else { return "" }
        return String(sentence
                        .components(separatedBy: " ")
                        .map({$0.reversed()})
                        .joined(separator: " "))
    }
    
    func reversedTextWithExclusions(sentence: String, ignoredCharacters: String) -> String {
        
        if sentence.isEmpty {
            return ""
        }
        
        var result = ""
        
        for word in sentence.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ") {
            
            var symbolsArray = word.map { String($0) }
            var left = 0
            var right = symbolsArray.count - 1
            
            while left < right {
                if ignoredCharacters.contains(symbolsArray[left]) {
                    left += 1
                } else if ignoredCharacters.contains(symbolsArray[right]) {
                    right -= 1
                } else {
                    symbolsArray.swapAt(left, right)
                    
                    left += 1
                    right -= 1
                }
            }
            
            result += symbolsArray.joined(separator: "").appending(" ")
        }
        
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
