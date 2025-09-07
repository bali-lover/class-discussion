@echo off
echo 🚀 GitHub Pages 배포 스크립트 시작...
echo.

REM Git 상태 확인
echo 📋 현재 Git 상태:
git status
echo.

REM 변경사항 추가
echo 📦 변경사항 추가 중...
git add .
echo.

REM 커밋 메시지 입력받기
set /p commit_msg="💬 커밋 메시지를 입력하세요: "

REM 커밋 실행
echo 💾 커밋 생성 중...
git commit -m "%commit_msg%"
echo.

REM GitHub에 푸시
echo 🌐 GitHub에 푸시 중...
git push origin main
echo.

echo ✅ 배포 완료!
echo 🔗 약 5-10분 후 GitHub Pages에서 확인 가능합니다.
echo.
pause