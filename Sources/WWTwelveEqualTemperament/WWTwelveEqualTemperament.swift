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
    ///   - baseFrequency: [主音設為A4 (La) => 440Hz](https://zh.wikipedia.org/zh-tw/簡譜)
    ///   - type: [表格類型](https://youtu.be/7f2GWDXK7vw)
    /// - Returns: [[String: Double]?](https://zh.pngtree.com/freebackground/music-dream-piano-training-poster_1129277.html)
    func table(baseFrequency: Double = 440, type: TableType = .number) -> [String: Double] {
        
        guard let text = FileManager.default._readText(from: Bundle.module.url(forResource: "12-Equal-Temperament.json", withExtension: nil)),
              let dict = text._dictionary(encoding: .utf8) as [String: [[String: Any]]]?,
              let equalTemperament = dict["12-Equal-Temperament"]
        else {
            return [:]
        }
        
        var notesFrequency: [String: Double] = [:]
        
        equalTemperament._forEach { index, element, _ in
            
            for (scale, value) in element {
                
                guard let dict = value as? [String: String] else { return }
                
                let noteFrequency = baseFrequency * pow(2.0, Double(index) / 12.0)
                let solfeggio = dict["solfeggio"]
                let number = dict["number"]
                
                switch type {
                case .scale: notesFrequency[scale] = noteFrequency
                case .solfeggio: if let solfeggio { notesFrequency[solfeggio] = noteFrequency }
                case .number: if let number { notesFrequency[number] = noteFrequency }
                case .all:
                    notesFrequency[scale] = noteFrequency
                    if let solfeggio { notesFrequency[solfeggio] = noteFrequency }
                    if let number { notesFrequency[number] = noteFrequency }
                }
            }
        }
        
        return notesFrequency
    }
    
    /// 產生88鍵鋼琴頻率字典
    /// - Parameter type: 表格類型
    /// - Returns: [String: Double]
    func pianoTable(type: TableType = .number) -> [String: Double] {
        
        var pianoTable: [String: Double] = [:]
        
        let A0 = 27.5       // So----
        let A4 = 440.0      // So
        let C8 = 4186       // Do++++
        let totalCount = 5  // 低音區: 5 / 高音區: 4
        
        /// 低音區 (A0 -> G4#)
        for index in 0..<totalCount {
            
            let baseFrequency = A0 * pow(2.0, Double(index))
            let suffix = (1..<(totalCount - index)).reduce("", { sum, index in return sum + "-" })
            
            table(baseFrequency: baseFrequency, type: type).forEach { key, value in
                let newKey = "\(key)\(suffix)".replacingOccurrences(of: "+-", with: "")
                pianoTable[newKey] = value
            }
        }
        
        /// 高音區 (A5 -> C8)
        for index in 1..<totalCount {
            
            let baseFrequency = A4 * pow(2.0, Double(index))
            let suffix = (0..<index).reduce("", { sum, index in return sum + "+" })
            
            table(baseFrequency: baseFrequency, type: type).forEach { key, value in
                
                if (Int(value) > C8) { return }
                
                let newKey = "\(key)\(suffix)"
                pianoTable[newKey] = value
            }
        }
        
        return pianoTable
    }
}
