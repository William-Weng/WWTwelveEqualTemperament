//
//  Extension.swift
//  WWTwelveEqualTemperament
//
//  Created by William.Weng on 2025/3/11.
//

import UIKit

// MARK: - FileManager
extension FileManager {
    
    /// 讀取檔案文字
    /// - Parameters:
    ///   - url: 文件的URL
    ///   - encoding: 編碼格式
    /// - Returns: String?
    func _readText(from url: URL?, encoding: String.Encoding = .utf8) -> String? {
        
        guard let url = url,
              let readedText = try? String(contentsOf: url, encoding: encoding)
        else {
            return nil
        }
        
        return readedText
    }
}

// MARK: - String
extension String {
    
    /// String => Data
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - isLossyConversion: 失真轉換
    /// - Returns: Data?
    func _data(using encoding: String.Encoding = .utf8, isLossyConversion: Bool = false) -> Data? {
        let data = self.data(using: encoding, allowLossyConversion: isLossyConversion)
        return data
    }
    
    /// JSON String => JSON Object
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - options: JSON序列化讀取方式
    /// - Returns: Any?
    func _jsonObject(encoding: String.Encoding = .utf8, options: JSONSerialization.ReadingOptions = .allowFragments) -> Any? {
        
        guard let data = self._data(using: encoding),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: options)
        else {
            return nil
        }
        
        return jsonObject
    }
    
    /// JSON String => [T]
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - options: JSON序列化讀取方式
    /// - Returns: Any?
    func _array<T>(encoding: String.Encoding, options: JSONSerialization.ReadingOptions = .allowFragments) -> [T]? {
        let array = self._jsonObject(encoding: encoding, options: options) as? [T]
        return array
    }
    
    /// JSON String => [String: T]
    /// - Parameters:
    ///   - encoding: 字元編碼
    ///   - options: JSON序列化讀取方式
    /// - Returns: Any?
    func _dictionary<T>(encoding: String.Encoding, options: JSONSerialization.ReadingOptions = .allowFragments) -> [String: T]? {
        let dictionary = self._jsonObject(encoding: encoding, options: options) as? [String: T]
        return dictionary
    }
}

// MARK: - Sequence (function)
extension Sequence {
    
    /// [仿javaScript的forEach()](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
    /// - Parameter forEach: (Int, Element, Self)
    func _forEach(_ forEach: (Int, Element, Self) -> Void) {
        
        for (index, object) in self.enumerated() {
            forEach(index, object, self)
        }
    }
}
