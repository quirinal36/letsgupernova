# 발표 슬라이드 이미지 제작 명세 — "1인 소상공인이 AI를 사용하는 방법"

대상 페이지: `site/usecases.html` (배포 사본 `dist/usecases.html`)
저장 위치: `assets/deck/caseN.png` → 배포 시 `dist/assets/deck/caseN.png`로 복사
표시 규격: 슬라이드 우측 620×750px 영역, `object-fit: cover` (세로가 살짝 긴 3:4 권장)
현재 상태: 파일이 없으면 슬라이드가 자동으로 아이콘 대체 그래픽을 보여준다. 파일을 넣으면 즉시 사진으로 바뀐다.

생성 도구: **Codex MCP** (2026-08-19 생성 완료)
그림체(사용자 확정): **실사 + UI 목업 톤**

## 현재 상태 — 완료

- 원본: `assets/deck/case1~6.png` (1086×1448, 3:4, 장당 약 1.7~2.0MB)
- 웹용: `assets/deck/case1~6.jpg` (sips JPEG q82로 변환, 전체 10MB → 1.5MB)
- 슬라이드가 참조하는 것은 **.jpg** 쪽이다. 원본 png는 보존한다(PRD: 기존 산출물 삭제 금지).
- 재변환이 필요하면:
  `cd assets/deck && for i in 1 2 3 4 5 6; do sips -s format jpeg -s formatOptions 82 case$i.png --out case$i.jpg; done`

### 이미지 안의 오탈자

- `case5` — **수정 완료 (2026-08-20)**. "매입 세금계산서" → "매출 세금계산서"로 재생성했다.
  Codex 재생성본은 `case5_v2.png`, 슬라이드가 쓰는 `case5.jpg`는 여기서 변환했다.
  최초본 `case5.png`(매입 표기)는 보존해 두었다.
- `case4` — 공지 목록에 "20**3**4년 겨울방학 특강 안내" 오타, 날짜도 2024년으로 과거다.
  620px로 축소되면 판독이 안 되는 크기라 그대로 두었다.

### Codex 모델 주의

이 계정(ChatGPT 로그인)은 `gpt-5.3-codex` / `gpt-5.1-codex` / `gpt-5.1-codex-max`를
거부한다. `~/.codex/config.toml`의 기본값인 **`gpt-5.6-terra`**를 명시해야 동작한다.

## 공통 스타일 문장 (6장 모두 동일하게 삽입)

"Photorealistic editorial photograph of a Korean small-business owner's real workspace,
bright natural daylight, clean minimal Apple-like aesthetic, light oak desk and soft neutral tones,
crisp modern UI mockup visible on the device screen with subtle mint-cyan (#3EE6C8) accent color,
shallow depth of field, shot on 35mm, no text overlays, no watermark, no logos, vertical 3:4 composition"

> 여정 페이지(index)의 미니어처 디오라마와는 의도적으로 다른 톤이다.
> 여정 = 은유, 활용사례 = 실제. 대신 민트-시안 포인트 색으로 브랜드는 이어붙인다.

## 장면별 프롬프트

### case1.png — 스마트폰으로 어디서든 코딩
한 손에 든 스마트폰 화면에 AI 코딩 에이전트 채팅 UI가 떠 있고, 배경은 흐릿한 강의장 복도.
책상 앞이 아닌 곳에서 일이 시작되는 순간이 핵심.
`a hand holding a smartphone showing an AI coding assistant chat interface with code diff bubbles, blurred lecture-room corridor in the background, person standing, motion of everyday life`

### case2.png — 얼굴인식 자동 출석체크
학원 입구 태블릿/카메라 앞을 지나는 학생, 화면에 얼굴 인식 프레임과 "출석 완료 · 포인트 +10" UI.
`a student walking past a wall-mounted tablet kiosk at an academy entrance, the screen showing a face-detection bounding box and an attendance-confirmed card with a points badge, warm classroom light`

### case3.png — 채팅으로 자격시험 일정 관리
책상 위 스마트폰 채팅 화면에 수강생 명단과 접수 마감 일정이 카드로 정리된 UI.
`smartphone on a light oak desk displaying a chat conversation where an AI has replied with a clean list of student names and exam registration deadlines as UI cards, calendar chips, notebook and pen beside it`

### case4.png — 홈페이지 AI 챗봇
노트북 화면의 학원 홈페이지 우측 하단에 챗봇 위젯이 열려 답변 중.
`laptop screen showing a clean education-business website with an AI chatbot widget open in the bottom-right corner mid-answer, evening indoor light, cozy office`

### case5.png — 세금계산서 채팅 발행
스마트폰 채팅에 세금계산서 발행 초안 카드가 떠 있고, 손가락이 확인 버튼 위에 머무는 순간.
`smartphone chat screen showing an AI-generated tax invoice draft card with amount and client fields, a thumb hovering over the confirm button, paper invoices and a calculator softly blurred behind`

### case6.png — 미니PC + NAS = 협업 거점 (에이전트 4대 + 협업 파트너 4명, 고용 0명)
선반 위 미니PC 한 대와 NAS 한 대, 상태 LED, 옆 모니터에 에이전트 4개의 작업 현황 대시보드.
`a compact mini PC and a small NAS unit sitting on a wooden shelf with status LEDs glowing mint-cyan, a monitor beside them showing a dashboard of four running AI agent sessions, tidy home-office, morning light`

## 생성 후 반영 절차

```sh
# 1) 생성물을 assets/deck/case1.png ... case6.png 로 저장
# 2) 배포 사본 동기화
cp assets/deck/*.png dist/assets/deck/
# 3) 로컬 확인
python3 -m http.server 8787   # → http://localhost:8787/site/usecases.html
```

이미지를 넣은 뒤 별도 코드 수정은 필요 없다. 파일명만 맞추면 자동으로 표시된다.
