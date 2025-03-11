//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2025/3/11.
//

import UIKit
import WWTwelveEqualTemperament

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func demo(_ sender: UIButton) {
        if let table = WWTwelveEqualTemperament.shared.table(type: .solfeggio) { label.text = "\(table)" }
    }
}
