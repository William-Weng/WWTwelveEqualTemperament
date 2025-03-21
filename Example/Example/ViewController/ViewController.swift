//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/3/11.
//

import UIKit
import WWPrint
import WWTwelveEqualTemperament

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func demo(_ sender: UIButton) {
        let table = WWTwelveEqualTemperament.shared.table(type: .solfeggio)
        label.text = "\(table)"
    }
}
