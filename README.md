# GinkPlus

## 소개
GinkPlus는 월드 오브 워크래프트(WoW)용 유틸리티 애드온으로, 전투 상태 알림 및 다양한 메시지 출력 기능을 제공합니다.

## 주요 기능
- 전투 시작/종료 시 화면 중앙에 알림 표시
- 채팅창에 커스텀 메시지 출력
- RGB 색상 코드 변환 및 텍스트 색상 지정
- 깔끔한 텍스트 애니메이션 및 깜빡임 효과 지원

## 설치 방법
1. 본 애드온 폴더(GinkPlus)를 `World of Warcraft\_retail_\Interface\AddOns` 경로에 복사합니다.
2. 게임 내 애드온 목록에서 GinkPlus를 활성화합니다.

## 사용법
- 전투가 시작되면 "▶▶전투시작◀◀" 메시지가 화면 중앙에 표시됩니다.
- 전투가 종료되면 "▶▶전투종료◀◀" 메시지가 초록색으로 표시됩니다.
- Lua 코드에서 `GinkPlus:Print("메시지")`로 채팅창에 메시지를 출력할 수 있습니다.
- `GinkPlus:ShowText(msg, color, yOffset, fontSize, persistent, blink)`로 화면에 커스텀 텍스트를 표시할 수 있습니다.

## 파일 설명
- **GinkPlus.lua**: 공통 유틸리티 함수 및 텍스트 출력 기능 구현
- **GinkPlus_CombatState.lua**: 전투 상태 감지 및 알림 표시 기능 구현
- **GinkPlus.toc**: 애드온 메타 정보 및 파일 목록

## 저작권
- Author: Gink
- Version: 1.0.0
- All Rights Reserved