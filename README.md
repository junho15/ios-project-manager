# 프로젝트 매니저

## 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [UML](#-UML)
5. [실행 화면](#-실행-화면)
6. [트러블 슈팅](#-트러블-슈팅)
7. [참고 링크](#-참고-링크)

## 소개
    
### 앱 소개

* `프로젝트 매니저` 앱은 프로젝트 할일을 관리하는 앱으로 iPad 가로모드 전용 앱입니다.
* 첫 화면에서 프로젝트 할일 리스트를 볼 수 있으며 새로운 할일을 추가하거나 기존 할일을 수정할 수 있습니다.
* 할일을 상태(TODO, DOING, DONE) 별로 관리할 수 있으며 삭제할 수 있습니다

### 개발환경 및 라이브러리

![Swift](https://img.shields.io/badge/Swift-5.7.1-orange)
![Xcode](https://img.shields.io/badge/Xcode-14.1.0-blue)
![SwiftLint](https://img.shields.io/badge/SwiftLint-0.50.3-red)
![Firebase](https://img.shields.io/badge/Firebase-9.6.0-yellow)

## 팀원

|<img src="https://camo.githubusercontent.com/a482a55a5f5456520d73f6c2debdd13375430060d5d1613ca0c733853dedacc0/68747470733a2f2f692e696d6775722e636f6d2f436558554f49642e706e67" width=160>|
|:--:|
|[junho](https://github.com/junho15)|

## 타임라인

<details>
<summary>STEP 1</summary>
<div markdown="1">

* **23/01/10**
    * SwiftLint 추가
    * Firebase 추가

</div>
</details>

<details>
<summary>STEP 2</summary>
<div markdown="1">

* **22/01/13**
    * 스토리보드 제거, ProjectListViewController 추가
* **22/01/14**
    * Project, ProjectState 추가
    * Project 목록 CollectionView 추가
    * ProjectListContentView 추가
    * DataSource 추가 및 updateSnapshot 기능 구현
    * add 버튼, ProjectDetailViewController 추가
    * 상세내용 표시 기능 추가
    * Project 추가, 수정 기능 추가
    * 목록 헤더 추가
    * 스와이프하여 삭제하는 기능 추가
    * 길게 터치하여 상태 변경하는 기능 추가
* **22/01/16**
    * ProjectListViewModel, ProjectViewModel 추가
    * ViewController 에 ViewModel 추가
* **22/01/17**
    * 코드 호출 순서 및 메서드 파라미터 정리
* **22/01/19**
    * 네이밍 수정 및 타입 변경
    * 프로퍼티 private 키워드 추가 및 text 설정 메서드 추가
    * 접근 제어자 추가 및 줄바꿈 등 컨벤션 수정
    * viewModel을 class로 변경하고 bind 메서드 수정
    * 필요한 경우(파라미터와 프로퍼티의 이름이 같은 경우) 제외 모든 self 제거

</div>
</details>

## UML

![UML](https://camo.githubusercontent.com/23214ded041a7a061a1f72fa0a0c0639d8a8d305d6320acc90f936d7e0efd051/68747470733a2f2f692e696d6775722e636f6d2f5a3363673777442e6a7067)

## 실행 화면

| ![](https://i.imgur.com/TTEsnbH.png) | ![](https://i.imgur.com/INOnJ0E.png) |
|:---:|:---:|
| ![](https://i.imgur.com/U2LIeSk.png) | ![](https://i.imgur.com/pE9nH19.png) |

## 트러블 슈팅

### 기술스택 선택하기

<details>
<summary>내용 보기</summary>
<div markdown="1">

#### 선택한 기술스택

| UI | 아키텍쳐 | 로컬 DB | 리모트 DB | 의존성 관리도구 |
|:---:|:---:|:---:|:---:|:---:|
| UIKit | MVVM | CoreData | Firebase | Swift Package Manager |

#### 선택한 이유

##### UI - UIKit

* `SwiftUI`, `UIKit` 중에서 `UIKit`을 더 공부하는 게 지금은 더 중요하다고 생각해서 `UIKit`을 선택했습니다.

##### 아키텍쳐 - MVVM

* 지금까지는 `MVC` 아키텍쳐 패턴으로 프로젝트롤 해왔습니다. 이번 프로젝트에서는 `MVVM` 아키텍쳐 패턴을 사용해보고자 합니다.
* `MVC`와 `MVVM`에 대한 설명을 여기저기서 읽어봤지만, 역시 직접 사용해보는 게 더 많이 배우고 느낄 수 있다고 생각해서 이번에는 사용해보지 않은 `MVVM` 패턴을 선택했습니다.

##### 로컬 DB - CoreData

* 선택할 수 있는 로컬 DB 에는 `Realm`, `SQLite`, `CoreData` 가 있었습니다. 이 중에 `CoreData`를 선택했습니다.
* `CoreData` 는 `iOS 3.0` 이상 버전부터 지원하므로 하위 버전 호환성에 큰 문제가 없고, `iOS`에서 자체 제공하기 때문에 비교적 안정적입니다.
* `SQLite` 보다 많은 메모리를 사용하고 더 많은 저장공간이 필요하다는 단점이 있지만, 더 빠르게 저장된 기록을 가져올 수 있다는 장점이 있습니다.
* Thread-Safe 하지 않아 Lock으로 동기화 처리를 해줘야 합니다.
* `Realm`은 `SQLite` 및 `CoreData` 대비 속도가 빠르지만 외부 라이브러리를 사용해야합니다.
* `CoreData`를 `Realm`으로 리팩토링할 수 있다고해서 이번 프로젝트에서는 우선 `CoreData`를 선택해서 사용하고 이후에 `Realm`을 공부해보고자 합니다.

##### 리모트 DB - Firebase

* 이번 프로젝트에서 사용할 리모트 DB로 `Firebase`, `Dropbox`, `iCloud` 중에서 `Firebase`를 선택했습니다.
* `iCloud`는 개발자 계정이 필요하다고 해서 이번 프로젝트에서는 `Firebase`를 선택해서 공부해보고자 합니다.
* `Firebase`는 구글에서 제공하는 모바일 앱개발 플랫폼으로 `iOS 11` 이상 버전부터 지원합니다.
* [iOS 및 iPadOS 사용 현황](https://developer.apple.com/kr/support/app-store/) 을 보면 96% 이상이 `iOS 14` 이상 버전을 사용 중이기 때문에 하위 버전 호환성에는 큰 문제가 없어 보입니다.
* `Firebase`는 `Swift Package Manager` 와 `Cocoapods` 를 정식으로 지원합니다.
* [Firebase 설치 가이드](https://firebase.google.com/docs/ios/installation-methods?authuser=0&hl=ko)를 보면 `Firebase` 버전 8 이상에서는 `Swift Package Manager`가 권장되는 설치방법이라고 합니다.

##### 의존성 관리도구 - Swift Package Manager

* 의존성 관리도구는 외부 라이브러리를 사용할 때 프로젝트와 해당 라이브러리와의 상관 관계를 관리해주는 도구입니다. 코코아터치 애플리케이션 개발환경에서는  `Cocoapods, Carthage, Swift Package Manager` 가 있습니다.
* 이번 프로젝트에서는 `Swift Package Manager` 을 의존성 관리도구로 선택했습니다.
* `Xcode` 11.0 이상 버전에서 GUI 환경에서 관리가 가능하고, 애플이 지원하는 의존성 관리도구이기 때문에 선택하게 되었습니다.
* 아직 지원하지 않는 라이브러리가 많다는 단점이 있지만 이번 프로젝트에서는 외부 라이브러리를 많이 사용하지 않기 때문에 중요한 문제가 아니라고 생각했습니다.
* [Firebase 설치 가이드](https://firebase.google.com/docs/ios/installation-methods?authuser=0&hl=ko) 에서 `Firebase` 버전 8 이상에서는 `Swift Package Manager`가 권장되는 설치방법이라는 설명도 참고하였습니다.
* `SwiftLint`는 `Homebrew`를 사용하도록 했습니다.

</div>
</details>

### CollectionView 레이아웃 만들기

<details>
<summary>내용 보기</summary>
<div markdown="1">
    
* 처음에는 하나의 CollectionView와 DataSource로 구현하고 싶었습니다. TODO, DOING, DONE의 구분은 Section을 달리하여 구현할 수 있었기 때문에 섹션을 수평 방향으로 배열하는 CollectionViewLayout이 필요했습니다.

```swift
    private func configureCollectionViewLayout() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33),
                                               heightDimension: .estimated(150))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        ...
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        configuration.interSectionSpacing = 10
        let collectionViewLayout = UICollectionViewCompositionalLayout(section: section,
                                                                       configuration: configuration)
        collectionViewLayout.register(BackgroundView.self, forDecorationViewOfKind: BackgroundView.reuseIdentifier)
        collectionView.collectionViewLayout = collectionViewLayout
    }
```

* 위 코드처럼 `scrollDirection`을 `.horizontal`로 해서 원하는 레이아웃을 만들 수 있었지만, `UICollectionLayoutListConfiguration`에 있는 `trailingSwipeActionsConfigurationProvider` 가 `UICollectionViewCompositionalLayoutConfiguration`에는 없어서 스와이프하여 삭제하는 기능을 구현할 수 없었습니다.
* 결국 현재 코드와 같이 세 개의 CollectionView와 DataSource를 사용하는 방식으로 구현하였습니다.

</div>
</details>

### MVVM 적용하기

<details>
<summary>내용 보기</summary>
<div markdown="1">
    
#### MVVM에 대한 공부 내용

* 기존 MVC 패턴은 View와 Controller가 너무 밀접하고 비즈니스 로직들이 Controller에 대부분 들어가게 되어 Controller가 비대해지는 한계가 있습니다.
* MVVM 패턴은 뷰 로직과 비즈니스 로직을 분리합니다.
* MVVM 패턴에서 View는 ViewModel로부터 데이터를 가져와서 표현하고, 사용자와의 상호작용을 수신하여 이에 대한 처리를 ViewModel에 요청합니다.
* ViewModel은 View로부터 전달받은 요청을 처리할 로직을 가지고 있으며 Model에 변화가 생기면 View에 알립니다.
* View는 ViewModel을 알고 있으며, 소유합니다. ViewModel은 View를 알지 못하고 Model을 알고 있습니다.
* View는 ViewModel 과의 데이터 바인딩을 통해 스스로 데이터를 보여줍니다.
* 데이터 바인딩을 하기 위해 델리게이트 패턴, 콜백 클로저, KVO, NotificationCenter 등을 사용할 수 있습니다.

#### 프로젝트에 적용

* `ProjectListViewController`에서 `Project` 배열인 `projects` 프로퍼티를 제거하고`ProjectListViewModel` 타입의 `projectListViewModel` 프로퍼티를 추가했습니다. `projects`에 직접 접근하여 데이터를 가져오던 기능들을 모두`projectListViewModel`의 메서드를 호출하도록 수정했습니다.
* ViewModel에서 데이터가 변경되었음을 View에 알리기 위해서 프로퍼티 옵저버와 콜백 클로저를 사용했습니다. View에서 ViewModel의 `bind` 메서드를 호출하여 스냅샷을 업데이트하는 클로저를 전달합니다.
    * 다른 방법들보다 간단하게 데이터바인딩을 할 수 있을거 같아서 콜백 클로저를 사용해보았습니다. PR을 작성하면서 `Observable` 타입을 만들어서 사용할 수 있다는 걸 알았네요. 다음 스텝에서 반영해보겠습니다.
* `ProjectDetailViewController`에서도 `project`, `editingProject` 프로퍼티를 제거하고 `projectViewModel` 프로퍼티를 추가했습니다.
* 프로젝트 정보를 사용자가 변경하면 `projectViewModel`의 `editingProject`를 수정하도록 했습니다.

</div>
</details>
    
    
## 참고링크

* [Core Data](https://developer.apple.com/documentation/coredata)
* [iOS 및 iPadOS 사용 현황](https://developer.apple.com/kr/support/app-store/)
* [Firebase 시작하기 - Apple 프로젝트에 Firebase 추가](https://firebase.google.com/docs/ios/setup?hl=ko&authuser=0)
* [Firebase 설치 가이드](https://firebase.google.com/docs/ios/installation-methods?authuser=0&hl=ko)
* [MVC 디자인 패턴 in iOS](https://velog.io/@ictechgy/MVC-%EB%94%94%EC%9E%90%EC%9D%B8-%ED%8C%A8%ED%84%B4)
* [MVVM 디자인 패턴 in iOS](https://velog.io/@ictechgy/MVVM-%EB%94%94%EC%9E%90%EC%9D%B8-%ED%8C%A8%ED%84%B4)
* [MVVM 디자인 패턴](https://wnstkdyu.github.io/2018/04/20/mvvmdesignpattern/)
