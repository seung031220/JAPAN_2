# JAPAN 프로젝트 의존성 설치
Set-Location $PSScriptRoot
Write-Host "JAPAN 프로젝트 의존성 설치 중..." -ForegroundColor Cyan
npm install
if ($LASTEXITCODE -eq 0) {
  Write-Host "`n설치 완료." -ForegroundColor Green
} else {
  Write-Host "`nnpm install 실패. Node.js 설치 확인: https://nodejs.org" -ForegroundColor Yellow
}
