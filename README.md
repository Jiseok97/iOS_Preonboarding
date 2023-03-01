# iOS Preonboarding 3월 사전과제

### 🍎 과제 내용
<div>
  <p><b>과제 UI ▾</b></p>
  <p><img src="https://user-images.githubusercontent.com/64394744/222153194-a2ef1ec1-3425-4f39-8eea-af9c0c6c17ff.png" width = "200"></p>
</div>

- `Image View`와 `Progress View` 및 `Button`으로 UI 구성
- `Load`라는 이름을 가진 `UIButton`을 누르면 `UIImageView`에 이미지가 로드 되어야 한다.
- 해당 `View`는 `5`개로 구성 되어 있고, 각 버튼들을 누르면 이미지가 로드 되는대로 `UIImageView`에 할당 되어야 한다.
- `Load All Images` 버튼을 누르면 `5`개의 `UIImageView`에 `Image`가 할당이 된다.

⚠️ Unsplash 랜덤 이미지를 가지고 오는 관계로 매번 이미지가 변경되며, 짧은 시간에 동시 호출할 경우 동일한 이미지가 로드됩니다.

</br>

### 🫐 구현
<div>
  <p><b>구현 ▾</b></p>
  <p><img src="https://user-images.githubusercontent.com/64394744/222156100-e57bc302-7ebe-4b04-8fbe-91b57e25a8b4.gif" width = "200"></p>
</div>

- `URLSession`을 이용하여 서버 통신
- `DispatchQueue`를 이용한 비동기 처리

</br>

### 🐝 개발 환경
- iOS 13
- Xcode 13.4.1
- 사용 언어: Swift
- 라이브러리: SnapKit, Then
- Open API: Unsplash
