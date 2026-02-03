# Resend + Vercel 연결 방법

## 1. Resend 설정

1. [resend.com](https://resend.com) 에서 회원가입 후 로그인
2. **API Keys** 메뉴에서 **Create API Key** 클릭
3. 이름 입력 후 생성된 키(`re_xxxx...`) 복사 (한 번만 표시되므로 저장해 두기)

> 테스트용으로는 **발신 도메인 검증 없이** `onboarding@resend.dev` 로 발송 가능합니다.

---

## 2. Vercel 배포 및 환경 변수

### 배포

1. [vercel.com](https://vercel.com) 로그인
2. **Add New** → **Project** 선택
3. 이 폴더(JAPAN)를 Git으로 연결하거나 **Import** 후 업로드
4. **Root Directory**는 프로젝트 루트 그대로 두기
5. **Deploy** 클릭

### 환경 변수 설정

1. Vercel 대시보드에서 해당 프로젝트 선택
2. **Settings** → **Environment Variables**
3. 추가:
   - **Name**: `RESEND_API_KEY`
   - **Value**: Resend에서 복사한 API 키 (`re_xxxx...`)
   - **Environment**: Production, Preview, Development 모두 체크
4. **Save** 후 **Redeploy** 한 번 실행 (기존 배포에 변수 반영)

---

## 3. 로컬에서 테스트 (선택)

```bash
# 의존성 설치
npm install

# Vercel CLI로 로컬 실행 (API 라우트 포함)
npx vercel dev
```

`.env` 또는 `.env.local` 파일을 만들고 다음 한 줄 추가:

```
RESEND_API_KEY=re_여기에_키_붙여넣기
```

`npx vercel dev` 실행 후 브라우저에서 http://localhost:3000 접속해 폼 제출을 테스트할 수 있습니다.

---

## 4. 동작 흐름

- 사용자가 **이름 / 전화번호 / 이메일** 입력 후 **제출하기** 클릭
- 프론트엔드에서 `POST /api/send-info` 로 전송
- Vercel 서버리스 함수가 Resend API를 호출
- **seung031220@naver.com** 으로 참가자 정보 메일 발송

발신 주소는 현재 `onboarding@resend.dev` (Resend 테스트용)입니다.  
자신의 도메인으로 보내려면 Resend에서 **Domains** 에 도메인을 추가·검증한 뒤, `api/send-info.js` 의 `from` 값을 해당 도메인으로 수정하면 됩니다.
