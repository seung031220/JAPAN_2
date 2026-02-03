@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ========================================
echo  JAPAN 폴더를 GitHub JAPAN_2에 연결
echo ========================================
echo.

where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo [오류] Git이 PATH에 없습니다.
  echo Git 설치 후 "시작 메뉴 - Git - Git Bash" 에서
  echo 이 폴더로 이동해 아래 명령을 직접 실행하세요.
  echo.
  goto :show_commands
)

echo 1. git init ...
git init
if %ERRORLEVEL% neq 0 goto :error

echo 2. git remote add origin ...
git remote remove origin 2>nul
git remote add origin https://github.com/seung031220/JAPAN_2.git
if %ERRORLEVEL% neq 0 goto :error

echo 3. git branch -M main ...
git branch -M main
if %ERRORLEVEL% neq 0 goto :error

echo 4. git add .
git add .
if %ERRORLEVEL% neq 0 goto :error

echo 5. git commit ...
git commit -m "초기 연결: Resend+Vercel, 토스 스타일, GitHub 푸시 설정"
if %ERRORLEVEL% neq 0 (
  echo 커밋할 변경이 없거나 이미 커밋된 상태일 수 있습니다.
)

echo 6. git push -u origin main ...
git push -u origin main
if %ERRORLEVEL% neq 0 (
  echo.
  echo [안내] 푸시 실패 시 GitHub 인증이 필요합니다.
  echo - GitHub 비밀번호 대신 Personal Access Token 사용
  echo   https://github.com/settings/tokens
  echo - 또는 SSH 사용: git remote set-url origin git@github.com:seung031220/JAPAN_2.git
  echo.
  goto :show_commands
)

echo.
echo ========================================
echo  연결 완료. 이제 Cursor에서 커밋/푸시하면
echo  GitHub 저장소에 바로 반영됩니다.
echo ========================================
goto :end

:error
echo [오류] 명령 실행 실패.
goto :show_commands

:show_commands
echo.
echo ----- 수동 실행용 명령 -----
echo git init
echo git remote add origin https://github.com/seung031220/JAPAN_2.git
echo git branch -M main
echo git add .
echo git commit -m "초기 연결"
echo git push -u origin main
echo ---------------------------

:end
echo.
pause
