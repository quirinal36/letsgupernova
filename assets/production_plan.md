# Let's Coding 스크롤 시네마틱 — 제작 명세

승인: 표준 720p 시나리오 (Seedance 2.0, 이미지 Nano Banana Pro 2K). 잔액 시작점 500.81cr.
단가(실측): NB Pro 2K = 2cr / Seedance 2.0 5s 720p 무음 = 22.5cr

## 공통 스타일 문장 (모든 이미지 프롬프트에 동일 삽입)

"Isometric miniature diorama built inside an open silver anodized aluminum Apple Mac mini style case with rounded corners, standing on a light oak desk in a bright airy modern studio; premium Apple-like aesthetic, bright clean soft daylight, polished metal, warm string lights, subtle neon mint-cyan accent lighting, adorable detailed 3D miniature characters and props, tilt-shift look, photorealistic materials, futuristic mechanical details, high detail 3D render"

## 세계관 / 연결 콘셉트

각 장면은 밝은 오크 책상 위에 놓인 "실버 케이스 디오라마" 하나씩.
- 다이브 영상: 케이스 정면에서 내부로 카메라가 날아 들어감 (start_image = 해당 장면 스틸)
- 연결 영상: 케이스 내부에서 뒤로 빠져나와 책상 풍경 위를 비행, 다음 케이스로 접근
  (start_image = 앞 다이브 마지막 프레임, end_image = 다음 장면 스틸)
- 재생 순서: D1 C1 D2 C2 D3 C3 D4 C4 D5 (총 9클립, 이음새 프레임 일치)

## 캐릭터 (장면 간 동일 유지) — references/ 이미지 기준 (사용자 지정)

- ChatGPT 로봇: references/chatgpt.jpg 기반 — 흰색/민트 톤 라운드 로봇, 가슴·얼굴에
  흰색 OpenAI 매듭(hexaflower knot) 엠블럼, 유리질 민트 액센트
- Claude 로봇: references/claude_code.png 기반 — Claude Code 로고를 3D화한
  각진 복셀/픽셀 스타일 글로시 주황 로봇: 사각 머리, 진갈색 직사각 눈 2개,
  옆면 핀/탭, 짧은 블록 다리
- 사람: 네이비 블레이저+청바지, 큰 머리 미니어처 피규어 비율, 갈색 머리
- 이미지 생성 시 두 레퍼런스 파일을 항상 image-references로 첨부할 것

## 장면별 명세

### 장면 1 — AI Novices
- 이미지: 사람이 두 로봇과 처음 만나 인사/악수 (v1 생성됨 → 캐릭터 조정 재생성 중)
- 카피: 작은 "AI 기본 체험" / 설명 "ChatGPT와 Claude, 내 업무의 새로운 동료를 만나다"

### 장면 2 — AI Optimisers
- 이미지: Claude 로봇이 케이스 내부의 미니어처 컨베이어 벨트 크랭크를 손으로 돌리고, 벨트 위로 서류/작업 아이템이 자동으로 흘러감
- 카피: 작은 "루틴 작업을 자동화" / 제목 "개인 생산성 향상 및 시간 절약" / 설명 "Claude Code, Codex 활용"

### 장면 3 — AI Explorers
- 이미지: 케이스 내부가 미니어처 바다. 사람+두 로봇이 작은 범선을 타고 막 출항, 네온 민트 등대/수평선
- 카피: 작은 "AI Explorer" / 제목 "새로운 활용법을 실험하는 탐험가" / 설명 "자신만의 업무 유즈케이스 발굴"

### 장면 4 — AI Champions
- 이미지: Claude 로봇 문양(스타버스트) 깃발을 높이 든 사람이 언덕 위에서 여러 미니어처 사람+로봇 그룹을 이끎
- 카피: 작은 "AI Champion" / 제목 "인공지능으로 조직을 이끌다" / 설명 "압도적 성과 창출 및 리더십 발휘"

### 장면 5 — 마지막 CTA
- 이미지: reference_img.png의 여성(검은 단발+헤어밴드, 네온 라인 재킷)이 책상 위(거인 스케일 책상, 미니어처 여성)에서 컴퓨터를 조작
- 카피: 제목 "렛츠코딩과 챔피언으로 성장하세요" / 버튼 "활용사례 관찰" → site/usecases.html
  (발표 슬라이드 이미지 명세는 assets/deck_image_plan.md 참고)

## 페이지 규칙 (PRD)

- 1스크롤 = 1장면 스냅 (60fps 전 키프레임 재인코딩 불필요)
- 데스크톱 전용, 모바일 불필요
- 한글 제목 word-break: keep-all (띄어쓰기에서만 줄바꿈), 문장 끝 마침표 제거
- 기존 산출물 삭제 금지 (버전 파일 보존)
- 포인트 색: 네온 민트-시안 (#3EE6C8 계열), 베이스는 애플 실버/화이트

## 영상 프롬프트 설계 (Seedance 2.0, 5s, 720p, 16:9, 무음, mode std)

공통 문구: "Single continuous camera move, no cuts, no scene change, smooth cinematic motion,
keep the exact same miniature diorama world, materials and lighting as the start frame."

- D_i (다이브): start_image=scene_i 스틸. "The camera flies slowly forward from the starting
  framing, approaching the open front of the silver case and gliding INSIDE the diorama
  interior, ending on a close immersive view of [장면별 주제] inside the case."
  - D5는 케이스가 아니라 책상 위 여성에게 다가가 모니터 앞 미디엄샷으로 마무리
- C_i (연결): start_image=D_i 마지막 프레임, end_image=scene_{i+1} 스틸.
  "The camera smoothly pulls back OUT of the diorama interior, rises above the oak desk,
  glides across the bright studio, then approaches and settles exactly on the next silver
  case framing matching the end frame."

파일 규칙: assets/videos/d1..d5.mp4, c1..c4.mp4 + ffmpeg 역방향 rd*.mp4, rc*.mp4
이음새 검증: ffmpeg로 D_i 마지막 프레임 vs C_i 첫 프레임, C_i 마지막 vs Still_{i+1} 비교

## 진행 로그

- scene1_v1.png: 초판 (bf7f315f). 스타일 승인, 캐릭터 조정 요청
- scene1_v2.png: 1차 캐릭터 조정판 (fe81bc69, 구 디자인) — 보존
- scene1_v1_alt.png: v1 중복 생성분 (577e136b) — 보존
- scene1_v3.png = scene1.png: references/ 로고 반영판 (72760109) — 사용자 앵커 확정
- scene2~5_v1.png = scene2~5.png: 일괄 생성 (ca47d059/1df061d8/54907663/d3f65f3c) — 검수 통과
  - 장면4 배경 벽 사인에 경미한 텍스트 아티팩트 (깃발에 가려짐, 영상화 시 허용 수준으로 판단)
- 다이브 영상 D1~D5 완료 (cd1fd5aa/eb34aa81/b625835f/cb3418ff/6b254c98), 각 22.5cr
- 연결 영상 C1~C4 완료 (1a9cd2b9/bf2b5574/1e88a179/30696e42), 각 22.5cr
- 역방향 클립 rd1~5, rc1~4 로컬 ffmpeg 생성 (크레딧 0)
- 이음새 검증: B형(연결끝→다이브첫) 2.6~6.0 사실상 완벽 / A형(다이브끝→연결첫) 13~19
  → 구도 동일, 재렌더 질감 차이만 존재. 플레이어 200ms 크로스페이드로 흡수 (재생성 불필요)
- Seedance는 start_image를 약간 리프레이밍함 → 페이지 초기 포스터를 d1_first.png로 사용
- 최종 크레딧: 500.81 → 282.31 (총 218.5 사용, 승인 범위 215~270 내)
- 로컬 서버: python -m http.server 8765 (프로젝트 루트) → http://localhost:8765/site/

## 배포 (2026-07-29)

- 호스팅: Cloudflare Pages, 프로젝트명 `letscoding`, 프로덕션 브랜치 main
- URL: https://letscoding.pages.dev (전 자산 200 응답 검증 완료)
- 배포 폴더: dist/ (site/index.html의 ../assets/ 경로를 assets/로 치환 + 필요 자산만 복사, 39MB 20파일)
- 재배포 방법: dist/ 갱신 후 `npx wrangler pages deploy dist --project-name letscoding --branch main`
- wrangler OAuth 로그인 계정: turboguy36@gmail.com
