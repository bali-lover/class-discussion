# 🚀 GitHub Pages 배포 가이드

이 문서는 학급 토론 게시판 시스템을 GitHub Pages에 배포하는 방법을 안내합니다.

## 📋 사전 준비사항

1. **GitHub 계정** 생성
2. **Firebase 프로젝트** 생성 및 설정
3. **Git** 설치 ([https://git-scm.com/](https://git-scm.com/))

## 🔧 Firebase 프로젝트 설정

### 1. Firebase 프로젝트 생성
1. [Firebase Console](https://console.firebase.google.com/) 접속
2. "프로젝트 추가" 클릭
3. 프로젝트 이름 입력 (예: `classroom-discussion-system`)
4. Google Analytics 설정 (선택사항)

### 2. Realtime Database 활성화
1. 왼쪽 메뉴에서 "Realtime Database" 클릭
2. "데이터베이스 만들기" 클릭
3. **중요**: 위치를 "아시아 남동부(asia-southeast1)" 선택
4. "테스트 모드에서 시작" 선택
5. "완료" 클릭

### 3. 웹 앱 등록
1. 프로젝트 개요 → "웹" 아이콘 클릭
2. 앱 닉네임 입력 (예: `classroom-discussion-web`)
3. "앱 등록" 클릭
4. **구성 정보 복사 및 저장** (나중에 사이트에서 입력할 정보)

## 🌐 GitHub Pages 배포

### 1. GitHub 리포지토리 생성
1. GitHub에 로그인
2. "New repository" 클릭
3. Repository name: `classroom-discussion` (또는 원하는 이름)
4. "Public" 선택
5. "Add a README file" 체크
6. "Create repository" 클릭

### 2. 로컬에서 Git 설정
```bash
# 로컬 폴더에서 Git 초기화
git init

# GitHub 리포지토리를 원격으로 추가
git remote add origin https://github.com/USERNAME/REPOSITORY_NAME.git

# 파일 추가 및 커밋
git add .
git commit -m "Initial commit: 학급 토론 게시판 시스템"

# GitHub에 푸시
git push -u origin main
```

### 3. GitHub Pages 활성화
1. GitHub 리포지토리 페이지에서 "Settings" 탭 클릭
2. 왼쪽 메뉴에서 "Pages" 클릭
3. Source: "Deploy from a branch" 선택
4. Branch: "main" 선택
5. Folder: "/ (root)" 선택
6. "Save" 클릭

### 4. 배포 완료 확인
- 약 5-10분 후 `https://USERNAME.github.io/REPOSITORY_NAME/`에서 사이트 접속 가능
- GitHub Pages 상단의 녹색 체크마크로 배포 상태 확인

## ⚙️ 사이트 설정

### 1. 첫 방문 시 Firebase 설정
1. 배포된 사이트 접속
2. "⚙️ Firebase 설정" 버튼 클릭
3. Firebase 프로젝트 정보 입력:
   - **API Key**: Firebase 구성에서 `apiKey` 값
   - **Project ID**: Firebase 구성에서 `projectId` 값
4. "🔗 연결 및 저장" 클릭

### 2. 교사 이름 설정
1. Firebase 설정 모달에서 "👤 교사 이름 재설정" 클릭
2. 원하는 교사 이름 입력

### 3. 반 생성 및 토론 시작
1. "➕ 새 반 만들기"로 반 생성
2. "📝 새 토론방 만들기"로 토론 주제 생성
3. "🚪 토론 입장"으로 토론 시작

## 🔐 보안 설정 (운영환경)

### Firebase Database 규칙 강화
테스트 완료 후 보안을 위해 규칙을 강화하세요:

```json
{
  "rules": {
    "classes": {
      "$classId": {
        ".read": "auth != null",
        ".write": "auth != null"
      }
    }
  }
}
```

### 도메인 제한 (선택사항)
Firebase 프로젝트 설정에서 승인된 도메인에 GitHub Pages URL 추가:
- `https://USERNAME.github.io`

## 📱 사용자 접속 방법

### 교사용
- 직접 GitHub Pages URL 접속: `https://USERNAME.github.io/REPOSITORY_NAME/`
- Firebase 설정 후 반 관리 시작

### 학생용
- **권장**: 교사가 "🔗 학생 링크 공유" 버튼으로 생성한 링크 접속 
  (Firebase 설정이 자동으로 포함됨)
- **직접 접속**: `https://USERNAME.github.io/REPOSITORY_NAME/student.html`
  (이 경우 Firebase 설정이 필요할 수 있음)

## 🔧 트러블슈팅

### 1. Firebase 연결 실패
- **원인**: 잘못된 API Key 또는 Project ID
- **해결**: Firebase Console에서 구성 정보 재확인

### 2. Database 권한 오류
- **원인**: Realtime Database 규칙 문제
- **해결**: Firebase Console → Realtime Database → 규칙에서 테스트 모드로 변경

### 3. GitHub Pages 404 오류
- **원인**: `index.html` 파일이 루트에 없음
- **해결**: `index.html`이 리포지토리 최상위에 있는지 확인

### 4. 학생 접속 불가
- **원인**: 잘못된 반 코드 또는 Firebase 연결 문제
- **해결**: 반 코드 재확인, Firebase 연결 상태 점검

## 📊 성능 최적화

### 1. Firebase 무료 할당량 관리
- Realtime Database: 월 1GB 다운로드
- 동시 연결: 100개
- 대용량 사용 시 유료 요금제 고려

### 2. GitHub Pages 제한사항
- 리포지토리 크기: 1GB 이하
- 월 대역폭: 100GB
- 시간당 빌드: 10회

## 🆙 업데이트 방법

```bash
# 코드 수정 후
git add .
git commit -m "Update: 새로운 기능 추가"
git push origin main
```

GitHub Pages는 자동으로 업데이트를 감지하고 재배포합니다.

## 📞 지원

문제 발생 시:
1. 이 가이드의 트러블슈팅 섹션 확인
2. Firebase Console에서 오류 로그 확인
3. 브라우저 개발자 도구(F12)에서 Console 오류 확인
4. GitHub Issues를 통해 문의

---

🎉 배포 완료 후 학생들과 함께 실시간 토론을 즐겨보세요!