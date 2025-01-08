import UIKit
import Foundation

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var a = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        historyTextView.scrollRangeToVisible(NSMakeRange(16, 480))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTextView.isScrollEnabled = true
        counterLabel.text = "0"
    }
    
    private func scroll() {
        historyTextView.scrollRangeToVisible(historyTextView.selectedRange)
    }
    
    private func dateAndTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY HH:MM:SS"
        let dateString = dateFormatter.string(from: Date())
        return dateString
    }
    
    @IBAction private func plusOne(_ sender: Any) {
        a += 1
        counterLabel.text = "Значение счетчика: \(a)"
        historyTextView.text += "\n\(dateAndTime()): Значение изменено на +1"
        scroll()
    }
    
    @IBAction private func minusOne(_ sender: Any) {
        if a != 0 {
            a -= 1
            historyTextView.text += "\n\(dateAndTime()): Значение изменено на -1"
            counterLabel.text = "Значение счетчика: \(a)"
            scroll()
        } else {
            historyTextView.text += "\n\(dateAndTime()):попытка уменьшить значение счетчика ниже 0"
        }
    }
    
    @IBAction private func zeroingOut(_ sender: Any) {
        a = 0
        counterLabel.text = "0"
        historyTextView.text += "\n\(dateAndTime()): Значение сброшено"
        scroll()
    }
    
}
