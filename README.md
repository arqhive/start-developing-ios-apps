#  iOS App Dev Study

##  Goal
- Xcode 에서 프로젝트 생성 ✅
- Xcode 프로젝트 템플릿으로 생성된 주요 파일의 목적 구분 ✅
- 프로젝트에서 파일 열기 및 전환 ✅
- iOS 시뮬레이터에서 앱 실행  ✅
- 스토리보드에서 UI 요소 추가, 이동 및 크기 조정 ✅
- 어트리뷰트 인스펙터를 사용하여 스토리보드에서 UI 요소의 속성 편집  ✅
- 아웃라인 뷰를 사용하여 UI 요소보기 및 재정렬  ✅
- 어시스턴트 에디터의 프리뷰 모드를 사용하여 스토리보드 UI 미리보기  ✅
- 자동 레이아웃을 사용하여 사용자의 디바이스 크기에 자동으로 적응하는 UI 배치하기 ✅
- 스토리보드의 씬과 기본 뷰 컨트롤러간의 관계를 설명 ✅
- 스토리보드와 소스코드의 UI 요소간의 아울렛 및 액션 연결 만들기 ✅
- 텍스트 필드에서 사용자 입력을 처리하고 결과를 표시 ✅
- 클래스가 프로토콜을 따르게 하기 ✅
- 델리게이션 패턴 이해 ✅
- 앱 아키텍쳐를 디자인 할때 타겟-액션 패턴을 따르기 ✅
- 뷰 컨트롤러 라이프사이클 및 해당 콜백 ✅
- 뷰 컨트롤러간의 데이터 전달 ✅
- 뷰 컨트롤러 해제 ✅
- 제스처 인식기를 사용하여 이벤트 생성 ✅
- UIView / UIControl 클래스 계층을 기반으로 객체 동작 예측 ✅
- 애셋 카탈로그를 사용하여 이미지 애셋을 프로젝트에 추가 ✅
- 사용자 정의 소스코드 파일을 작성하여 스토리보드의 요소와 연관 ✅
- 커스텀 클래스 정의 ✅
- 커스텀 클래스에서 이니셜라이저 정의 ✅
- UIStackVIew 컨테이너 ✅
- 프로그래밍 방식으로 뷰를 만드는 방법 이해 ✅
- 사용자 정의 컨트롤에 접근성 정보 추가 ✅
- 데이터 모델 생성 ✅
- 사용자 정의 클래스에 대한 실패한 이니셜라이저 프로그램 작성 ✅
- 실패 및 이니셜 불가능한 이니셜 라이저의 차이점에 대한 개념적 이해 ✅
- 단위 테스트를 작성하고 실행 ✅
- 두 번째 스토리보드 씬 만들기 ✅
- 테이블 뷰의 주요 구성요소 이해 ✅
- 커스텀 테이블 뷰 셀 생성 및 디자인 ✅
- 테이블뷰 델리게이트 및 데이터소스의 역할 이해 ✅
- 배열을 사용하여 데이터 저장 및 작업 ✅
- 테이블 뷰에 동적 데이터 표시 ✅
- 스토리보드의 내비게이션 컨트롤러 내에 기존 뷰 컨트롤러 내장
- Create segues between view controllers
- Attrubute inspector를 사용하여 스토리보드에서 segue속성 편집
- prepare()를 사용하여 뷰 컨트롤러간에 데이터 전달
- Perform an unwind segue
- 스택뷰를 사용하여 유연한 레이아웃 만들기


### Comments

- 첫 시작은 Single View Application
- Cmd + R 로 시뮬레이터 실행
- Xcode는 에디터 영역에 시각적 인터페이스 편집기인 Interface Builder에서 스토리보드를 연다. 스토리보드의 배경은 캔버스이다. 
- iOS의 모든 View객체는 UIView 또는 그 하위 클래스의 하나이다.
- 객체 라이브러리 열기 Cmd + Shift + L 또는 우측 상단 `+`버튼 또는 메뉴 View -> Show Library
- 새로운 파일 생성 Command + N
- prettier Control + I

### 직접 추가한 사용자 인터페이스 요소가 View에 중첩되어있는 이유
- View는 화면에 표시되고 사용자 입력에 반응 할 뿐만 아니라 다른 뷰의 컨테이너 역할을 할 수 있다.
- 뷰는 뷰 계층 구조라는 계층구조로 정렬된다.
- 뷰는 여러개의 서브뷰와 하나의 슈퍼뷰만 가질 수 있다.

### Text Field
- 어트리뷰트 인스펙터에서 Return Key를 Done으로 바꿈 -> 이렇게 하면 키보드의 기본 Return키가 Done 키로 변경됨
- Auto-enabled return key 체크 -> 사용자는 텍스트 필드에 텍스트를 입력하기 전에 완료 키를 누를 수 없음 (빈 문자열 입력 불가)

### Auto Layout
- 가장 쉬운 방법중 하나는 UIStackView를 사용하는 것이다.

### Storyboard
- 스토리 보드에서 씬은 하나의 컨텐츠 화면과 일반적으로 하나의 뷰 컨트롤러를 나타낸다.
- 뷰 컨트롤러는 앱의 액션을 구현한다.
- 뷰 컨트롤러는 하위 뷰 계층 구조로 단일 컨텐츠 뷰를 관리한다.
- 뷰 컨트롤러는 앱의 데이터를 캡슐화 하는 앱의 데이터 모델과 해당 데이터를 표시하는 뷰, 컨텐츠 뷰의 수명주기 관리, 기기 회전시 방향 변경 처리, 내비게이션 정의 등의 정보 흐름을 조정한다.
- 씬을 추가할때 Identity inspector에서 직접 연결해야 한다.
- 앱에서 인터랙션을 정의하려면 뷰 컨트롤러의 소스 코드가 스토리 보드의 뷰와 통신 할 수 있어야 한다.
- 스토리보드의 뷰와 뷰 컨트롤러 소스코드 파일 사이에 추가 연결(아울렛과 액션)을 정의하면 된다.

### Image Field
- 사용자와 상호작용하기 위해서는 어트리뷰트 인스펙터에서  User Interaction Enabled 에 체크한다.

### Table View
- 테이블뷰는 스토리 보드에 제공하는 정적데이 또는, 컨트롤러에서 제공되는 동적 데이터를 표시 할 수 있다.
- 기본적으로는 동적 데이터를 사용한다.
