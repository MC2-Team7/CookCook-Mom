# 👩🏻‍🍳 떡잎모함대 : CookCookMom(가제)

애플 디벨로퍼 아카데미 MC2 프로젝트 입니다.<br>
'Team 7 떡잎모함대:CookCook'의 엄마용 IOS App입니다.

<br>

## 브랜치 규칙


```
◼ main
    - 실제 배포가될 브랜치
    - repo 총 관리자가 팀원들과 협의 후 최종 병합, 배포

◼ develop
    - 개인 로컬 저장소와 중앙 저장소의 코드 동기화를 위해 사용
    - default 브랜치로 다음 기능을 개발하는 브랜치

◼ feature
    - 실제 개발이 이루어지는 브랜치
    - 개발이나 버그 픽스때마다 develop브랜치로부터 분기
    - 본인의 로컬 저장소에서 관리하는 브랜치 개발이 완료되면 develop브랜치에 병합하여 다른 사람들과 공유

    🔹 이름 규칙 : feature/기능 요약
```

<br>

## git 간단 요약

### git 초기화 

```
* 저장소 생성 및 연결
git init
git remote add origin [repo url]
git remote -v 


* 프로젝트 클론 

//터미널에서 자신이 원하는 디렉토리 이동 후 명령어 실행
git clone [repo url]


* 현재 위치 확인
git remote -v 


* 현재 상태 확인 
git status 


* 원격 저장소 파일 로컬로 가져오기
git pull origin [브랜치 이름]


* devolp 브랜치로 이동 
git switch develop

```

<br>

### 작업 수행시

```
(처음 진행 시)
1. 프로젝트 클론
git clone [해당 repo url]

2. develop 브랜치로 이동 
git switch develop

3. 개인 담당한 기능 개발을 위한 브랜치 생성 
// 브랜치 명은 브랜치 이름 규칙을 보자!
git switch -c [브랜치 명]   


(기존 진행 시)
1. 현재 브랜치 위치 확인 
git branch


2-1. 자신의 작업 브랜치가 아닐 시, 해당 브랜치로 이동 
git switch [개인 작업 브랜치] 


2-2. 자신의 작업 브랜치인 경우, 작업 수행 후 다음 진행

/* 작업 수행 */

git add .                   //작업한 모든 파일 추가
git commit -m "메세지"       //메세지는 간단하게!!
git push origin [브랜치 명]   //자신의 개별 작업 브랜치에 push 


3. 기능 개발 완료 시, develop 브랜치로 merge 요청
GUI툴이나 웹사이트에 가서 develop 브랜치로 pull request


4. 작업 브랜치 삭제 
git switch develop         //develop브랜치로 이동
git branch -D [브랜치 명]    //작업한 브랜치 삭제
```

<br>

### 다른 사람의 작업 동기화

```
git switch develop    //develop브랜치로 이동
git pull origin develop //파일 최신화
```

<br>

