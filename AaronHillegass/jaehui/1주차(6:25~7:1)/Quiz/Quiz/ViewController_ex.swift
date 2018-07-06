//import UIKit
//
//class ViewController: UIViewController {
//
//    @IBOutlet var questionLabel: UILabel! //질문 라벨
//    @IBOutlet var answerLabel: UILabel! //정답 라벨
//
//    let questions : [String] = ["What is 7+7?", "What is the capital of Vermont?", "From what is cognac made?"] //질문 배열
//    let answers : [String] = ["14", "Montpelier", "Grapes"] //대답 배열
//    var currentQuestionIndex: Int = 0 //현재 질문의 인덱스
//
//    @IBAction func showNextQuestion(_ sender: Any) { //다음 질문 보여주는 버튼
//        //다음 질문을 보여줘야 하므로 인덱스 하나 증가
//        currentQuestionIndex += 1
//        //3번 질문까지 하고 나면 다시 1번으로
//        if currentQuestionIndex == questions.count {
//            currentQuestionIndex = 0
//        }
//        questionLabel.text = questions[currentQuestionIndex]
//        answerLabel.text = "???" //아직 정답 공개 전이므로 "???"로 세팅
//    }
//
//    @IBAction func showAnswer(_ sender: Any) { //정답 보여주는 버튼
//        //현재 질문에 맞는 정답 공개
//        answerLabel.text = answers[currentQuestionIndex]
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        questionLabel.text = questions[currentQuestionIndex] //앱 실행 했을 때 첫번째 질문이 보이게 설정
//    }
//
//}
//
//
//
//
