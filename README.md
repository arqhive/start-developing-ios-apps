#  iOS App Dev Study

##  Goal
- Xcode 에서 프로젝트 생성 ✅
- Identify the purpose of key files that are created with an Xcode project template
(Xcode 프로젝트 템플릿으로 생성된 주요 파일의 목적 구분) ✅
- Open and switch between files in a project (프로젝트에서 파일 열기 및 전환) ✅
- Run an app in iOS Simulator (iOS 시뮬레이터에서 앱 실행) ✅
- Add, move, and resize UI elements in a storyboard (스토리보드에서 UI 요소 추가, 이동 및 크기 조정) ✅
- Edit the attributes of UI elements in a storyboard using the Attributes inspector
(어트리뷰트 인스펙터를 사용하여 스토리보드에서 UI 요소의 속성 편집) ✅
- View and rearrange UI elements using the outline view
(아웃라인 뷰를 사용하여 UI 요소보기 및 재정렬)
- Preview a storyboard UI using Assistant editor’s Preview mode
(어시스턴트 에디터의 프리뷰 모드를 사용하여 스토리보드 UI 미리보기)
- Use Auto Layout to lay out a UI that automatically adapts to the user’s device size
(자동 레이아웃을 사용하여 사용자의 디바이스 크기에 자동으로 적응하는 UI 배치하기)

### Comments

- 첫 시작은 Single View Application
- Cmd + R 로 시뮬레이터 실행
- Xcode는 에디터 영역에 시각적 인터페이스 편집기인 Interface Builder에서 스토리보드를 연다. 스토리보드의 배경은 캔버스이다. 
- iOS의 모든 View객체는 UIView 또는 그 하위 클래스의 하나이다.
- 객체 라이브러리 열기 Cmd + Shift + L 또는 우측 상단 `+`버튼 또는 메뉴 View -> Show Library

### 직접 추가한 사용자 인터페이스 요소가 View에 중첩되어있는 이유
- View는 화면에 표시되고 사용자 입력에 반응 할 뿐만 아니라 다른 뷰의 컨테이너 역할을 할 수 있다.
- 뷰는 뷰 계층 구조라는 계층구조로 정렬된다.
- 뷰는 여러개의 서브뷰와 하나의 슈퍼뷰만 가질 수 있다.

### Text Field
- 어트리뷰트 인스펙터에서 Return Key를 Done으로 바꿈 -> 이렇게 하면 키보드의 기본 Return키가 Done 키로 변경됨
- Auto-enabled return key 체크 -> 사용자는 텍스트 필드에 텍스트를 입력하기 전에 완료 키를 누를 수 없음 (빈 문자열 입력 불가)



