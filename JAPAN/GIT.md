# Cursor에서 수정 → GitHub 저장소에 바로 반영하기

저장소: **https://github.com/seung031220/JAPAN_2**

---

## 1. 최초 1회: 이 폴더를 GitHub 저장소와 연결

### 방법 A: 이 폴더를 JAPAN_2와 연결 (지금 폴더 그대로 사용)

1. **Git 설치**  
   [git-scm.com](https://git-scm.com) 에서 설치 후, **새 터미널**에서 `git --version` 이 나오는지 확인.

2. **JAPAN 폴더에서 터미널 열기**  
   - 파일 탐색기에서 `JAPAN` 폴더 열기  
   - **주소창에 `cmd` 입력 후 Enter**

3. **아래 명령 한 번에 실행**
   ```bash
   git init
   git remote add origin https://github.com/seung031220/JAPAN_2.git
   git branch -M main
   git add .
   git commit -m "초기 연결"
   git push -u origin main
   ```
   - `git push` 시 **GitHub 로그인**이 뜨면:
     - 비밀번호 대신 **Personal Access Token** 사용  
       → [GitHub 토큰 생성](https://github.com/settings/tokens) (repo 권한 체크)
     - 또는 **SSH** 사용:  
       `git remote set-url origin git@github.com:seung031220/JAPAN_2.git` 후 SSH 키 설정

### 방법 B: JAPAN_2를 클론해서 그 폴더에서 작업

1. 작업할 위치에서:
   ```bash
   git clone https://github.com/seung031220/JAPAN_2.git
   ```
2. Cursor에서 **파일 → 폴더 열기** → `JAPAN_2` 폴더 선택  
   → 이제 이 폴더에서 수정하면, 아래 2번만 하면 저장소에 반영됩니다.

---

## 2. 수정 후 저장소에 반영 (매번)

연결을 한 번 해 두었다면, **Cursor 안에서** 아래만 하면 됩니다.

1. **소스 제어 열기**  
   왼쪽 사이드바 **가지 모양 아이콘** 클릭  
   또는 `Ctrl + Shift + G`

2. **변경된 파일 스테이징**  
   - "변경 사항" 아래 파일 옆 **+** 클릭 → 모두 스테이징  
   - 또는 "변경 사항" 제목 옆 **+** 한 번에 모두 스테이징

3. **커밋**  
   - 위쪽 메시지 입력란에 `수정 내용 한 줄` 입력  
   - **✓ 커밋** 버튼 클릭

4. **푸시**  
   - **⋯** (점 3개) 메뉴 → **푸시** 선택  
   - 또는 아래 **"main" 옆 동기화(↑↓) 아이콘** 클릭

이렇게 하면 **여기서 수정 → Cursor에서 커밋·푸시** = **GitHub 저장소에 바로 반영**됩니다.

---

## 3. 저장할 때마다 자동 커밋·푸시 (선택)

저장(Ctrl+S)할 때마다 자동으로 커밋하고 푸시하려면:

### 옵션 1: Cursor 확장 프로그램

1. **확장** 탭 (`Ctrl + Shift + X`) 열기  
2. **"Auto Commit"** 또는 **"Git Automator"** 검색 후 설치  
3. 해당 확장 설정에서 "Commit on Save" 또는 "Auto push" 옵션 켜기  

(이름이 비슷한 확장이 여러 개 있을 수 있으니, 설치 수·평점 확인 후 선택하세요.)

### 옵션 2: 단축키로 한 번에 커밋+푸시

자동은 아니지만, **한 번의 단축키**로 커밋+푸시를 하려면:

1. `Ctrl + K` → `Ctrl + S` (키보드 단축키 설정 열기)  
2. **"Git: Sync"** 검색  
3. **키 바인딩**에 원하는 단축키 지정 (예: `Ctrl + Shift + P`)  
4. 수정 후 **모두 스테이징** → **커밋 메시지 입력** → 방금 정한 단축키로 Sync(푸시) 실행

---

## 요약

| 하고 싶은 것 | 하는 방법 |
|-------------|-----------|
| **여기서 수정한 게 GitHub에 반영되게** | 1번에서 저장소 연결 한 번 → 2번에서 커밋·푸시 |
| **가장 빠르게** | Cursor 왼쪽 **소스 제어** → + 로 스테이징 → 메시지 입력 → ✓ 커밋 → ⋯ → 푸시 |
| **저장 시 자동 반영** | 3번의 확장 프로그램 사용 |

한 번 연결해 두면, **수정 → 스테이징 → 커밋 → 푸시**만 Cursor 안에서 하면 저장소에 바로 반영됩니다.
