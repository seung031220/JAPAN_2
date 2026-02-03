@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo JAPAN 프로젝트 의존성 설치 중...
call npm install
if %ERRORLEVEL% equ 0 (
  echo.
  echo 설치 완료.
) else (
  echo.
  echo npm install 실패. Node.js가 설치되어 있는지 확인하세요: https://nodejs.org
)
pause
