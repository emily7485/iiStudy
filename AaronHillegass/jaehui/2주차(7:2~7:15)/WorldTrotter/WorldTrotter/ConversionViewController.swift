import UIKit
import Foundation

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: properies
    var fahrenheitValue: Measurement<UnitTemperature>? { //화씨 온도
        didSet { //프로퍼티 옵저버
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? { //섭씨 온도
        if let fahrenheitValue = fahrenheitValue { //옵셔널 바인딩
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = { //숫자 포맷 지정자, decimal 스타일로 한자리 소수점만 표시
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //MARK: IBOutlet
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    @IBAction func dismissKeyboard(sender: AnyObject) { //키보드 숨김 처리
        textField.resignFirstResponder()
    }

    //MARK: IBAction
    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = textField.text
//        } else {
//            celsiusLabel.text = "???"
//        }
        
        if let text = textField.text, let value = Double(text) { //텍스트가 입력됐는지, Double로 나타낼 수 있는지 점검
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let firstFrame = CGRect(x: 160, y:240, width: 100, height: 150)
        //        let firstView = UIView(frame: firstFrame)
        //        firstView.backgroundColor = UIColor.blue
        //        view.addSubview(firstView)
        
        updateCelsiusLabel()
    }
    
    //MARK: Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { // 복수의 소수점을 사용하지 못하도록 설정
        //        print("Current text: \(textField.text)")
        //        print("Replacement text: \(string)")
        //        return true
        
        //Bronze Challenge: Disallow Alphabetic Characters
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet) {
            print("Rejected (Invalid Character)")
            return false
        }
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    
    //MARK: Custom Methods
    func updateCelsiusLabel() { //celsiusLabel을 갱신하는 메서드
        if let celsiusValue = celsiusValue {
            //            celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }

}


