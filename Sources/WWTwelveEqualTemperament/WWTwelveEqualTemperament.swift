//
//  WWTwelveEqualTemperament.swift
//  WWTwelveEqualTemperament
//
//  Created by William.Weng on 2025/3/11.
//

import UIKit

// MARK: - 計算十二平均率
open class WWTwelveEqualTemperament {
    
    @MainActor public static let shared = WWTwelveEqualTemperament()
}

// MARK: - 公開函式
public extension WWTwelveEqualTemperament {
    
    /// [產生十二平均率字典](https://zh.wikipedia.org/zh-tw/十二平均律)
    /// - Parameters:
    ///   - baseFrequency: [主音設為A1 (la) => 440Hz](https://zh.wikipedia.org/zh-tw/簡譜)
    ///   - type: [表格類型](https://youtu.be/7f2GWDXK7vw)
    /// - Returns: [[String: Double]?](https://zh.pngtree.com/freebackground/music-dream-piano-training-poster_1129277.html)
    func table(baseFrequency: Double = 440, type: TableType = .all) -> [String: Double]? {
        
        guard let text = FileManager.default._readText(from: Bundle.module.url(forResource: "12-Equal-Temperament.json", withExtension: nil)),
              let dict = text._dictionary(encoding: .utf8) as [String: [[String: Any]]]?,
              let equalTemperament = dict["12-Equal-Temperament"]
        else {
            return nil
        }
        
        var notesFrequency: [String: Double] = [:]
        
        equalTemperament._forEach { index, element, _ in
            
            for (scale, value) in element {
                
                guard let dict = value as? [String: String] else { continue }
                
                let noteFrequency = baseFrequency * pow(2.0, Double(index) / 12.0)
                let solfeggio = dict["solfeggio"]
                let number = dict["number"]
                
                switch type {
                case .scale: notesFrequency[scale] = noteFrequency; continue
                case .solfeggio: if let solfeggio { notesFrequency[solfeggio] = noteFrequency }; continue
                case .number: if let number { notesFrequency[number] = noteFrequency }; continue
                case .all:
                    notesFrequency[scale] = noteFrequency
                    if let solfeggio { notesFrequency[solfeggio] = noteFrequency }
                    if let number { notesFrequency[number] = noteFrequency }
                }
            }
        }
        
        return notesFrequency
    }
}
