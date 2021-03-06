import UIKit

// 뷰를 프로그래밍 방식으로 초기화 하고 스토리보드에서 뷰를 로드 할 수 있는 방법을 사용한다.
// Interface Builder에게 정보를 제공하기 위해 IBDesignable 속성 사용
@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]() // 여러개의 버튼을 만들어야함
    var rating = 0 {
        didSet {
            updateButtonSelectionStates() // 값이 변할때마다 버튼 상태를 바꿈
        }
    }
    
    // 인스펙터블 프로퍼티 (버튼의 크기가 버튼 수)
    // InterfaceBuilder에서 변경할때 관찰하고 응답하기 위해 관찰자 추가
    @IBInspectable var startSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var startCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    //MARK: Private Methods
    // 어떤 이니셜라이저가 호출됐는지 관계없이 버튼을 추가하기 위해 아래 private 메소드를 만든다.
    // private 수정자를 사용하면 클래스 내의 코드로만 호출 할 수 있다. 메소드를 캡슐화하고 외부에서 실수로 메소드가 호출되지 않도록 한다.
    private func setupButtons() {
        // 관찰자에 의해 해당 함수가 실행될때 이전 버튼은 삭제
        for button in ratingButtons {
            removeArrangedSubview(button) // 스택뷰가 관리하는 뷰에서 제거 (여전히 하위 뷰임)
            button.removeFromSuperview() // 스택뷰에서 완전 삭제
        }
        ratingButtons.removeAll() // 배열 아이템 제거
        
        // 버튼 이미지 불러오기
        // 앱의 기본 번들 호출
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // UIButton 클래스의 컨비니언스 초기화중 하나를 사용함.
        // 이 초기화는 크기가 0인 사각형을 호출하여 전달한다.
        // 자동레이아웃을 사용하고 있기 때문에 0인 버튼으로 시작하는 것이 좋다.
        // 스택뷰는 버튼의 유ㅣ치를 자동으로 정의하고 버튼의 크기를 정의하는 constaraintes 조건을 추가한다.
        // 5개의 버튼을 만들어야 하므로 반복문을 사용한다.
        for index in 0..<startCount { // 루프의 반복을 알필요가 없어서 _ 를 사용한다.
            let button = UIButton()
            
            // 버튼에는 일반, 강조표시, 포커스, 선택, 비활성화 총 5가지의 상태가 있다.
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // constraints 추가
            // 스택뷰가 자동으로 false로 설정하지만 오토레이아웃을 사용하는 경우 명시적으로 비활성화 하는것이 좋다. (실수 방지)
            button.translatesAutoresizingMaskIntoConstraints = false // 기본 값은 true 오토레이아웃을 사용하는 경우 자동생성조건을 자신의 것으로 바꿈
            button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            
            // 접근성 라벨 추가
            button.accessibilityLabel = "\(index+1) 별점으로 세팅되어 있습니다."
            
            // 버튼에 액션 추가
            // target-action 패턴을 사용
            // Interface Builder를 사용하지 않기 때문에 IBAction 속성을 사용할 필요 없다.
            // 엔클로징 클래스의 현재 인스턴스를 참조한다.
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // 스택에 버튼을 추가
            addArrangedSubview(button)
            
            // 배열에 추가
            ratingButtons.append(button)
        }
        
        // 버튼을 컨트롤에 추가 할때마다 상태 업데이트
        updateButtonSelectionStates()
    }
    
    // MARK: Initialization
    // 프로그래밍 방식으로 뷰를 초기화 하기 위해 필요
    // init()은 각 프로퍼티의 초기값을 설정하고 임이의 다른 설정을 행하는 것을 포함하여 클래스의 인스턴스를 준비하는 방법이다.
    // 스위프트느 이니셜라이저를 제공하지 않으면 자동으로 모든 슈퍼클래스의 지정된 이니셜라이저를 상속한다.
    // 이니셜라이저를 구현하면 슈퍼클래스의 이니셜라이저를 상속하지 않는다.
    
    override init(frame: CGRect) {
        // 슈퍼 클래스의 이니셜라이저를 호출
        super.init(frame: frame)
        setupButtons()
    }
    
    // 스토리 보드에서 뷰를 불러오기 위해 필요
    // 반드시 구현하라는 의미의 required 키워드가 있으면 굳이 override 키워드를 붙이지 않아도 됨
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("\(button)이, ratingButtons 배열 안에 없습니다:\(ratingButtons)")
        }
        
        // 선택된 버튼의 평점 계산
        let selectedRating = index + 1
        
        if selectedRating == rating {
            rating = 0 // 같은 점수면 초기화
        } else {
            rating = selectedRating
        }
    }
    
    // rating이 설정되면 버튼 모양을 업데이트 할 메서드
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // 버튼의 인덱스가 rating보다 작으면 버튼을 선택해야 함
            button.isSelected = index < rating
            
            let hintString: String?
            if rating == index + 1 {
                hintString = "평점을 0점으로 리셋했습니다."
            } else {
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "평점이 설정되어 있지 않습니다."
            case 1:
                valueString = "1점이 설정되었습니다."
            default:
                valueString = "\(rating)점이 설정되었습니다."
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
