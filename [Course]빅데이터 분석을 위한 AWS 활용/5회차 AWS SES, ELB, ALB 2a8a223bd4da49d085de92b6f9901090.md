# 5회차 AWS SES, ELB, ALB

[5회차 AWS SES, ELB, ALB.pdf](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/5%ED%9A%8C%EC%B0%A8_AWS_SES_ELB_ALB.pdf)

# Amazon Simple Email Service(SES)

![Untitled](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/Untitled.png)

개발자가 모든 애플리케이션 내에서 이메일을 보낼 수 있는 경제적이고 확장성 있는 이메일 서비스

- 트랜잭션
- 마케팅
- 대량 이메일 커뮤니 케이션

<aside>
💡 전 세계에 안전하게 대규모 이메일 발송 가능

</aside>

---

# 학습 목표

1. AWS 클라우드 SES(Simple Email Service)를 설명할 수 있다.
2. AWS 클라우드 ELB(Elastic Load Balancing)를 설명할 수 있다.
3. AWS 클라우드 ALB(Application Load Balancer)를 설명할 수 있다.

# AWS 클라우드 SES(Simple Email Service)

- 다양한 이메일 전송 방식 지원
    - AWS 콘솔
    - **SMTP 프로토콜**
    - HTTPS 프로토콜을 이용한 SES API(AWS CLI)
    - AWS SDK)(안드로이드, iOS, Java, .NET, Node.js, Python, PHP, Ruby)
- 프로덕션 액세스 권한
    - 상용화를 위해서는 권한을 받아야함.
    - 스팸 메일을 방지하기 위해서 외부로 메일을 보내려면 프로덕션 액세스 권한을 얻어야 함.
    - 프로덕션 액세스 권한을 얻었다면 초당 이메일 5통, 24시간 동안 최대 10,000통 전송 가능
- 프리티어 에서 사용 가능

> SES 사용하기
> 
- 이메일 인증하기
    - 특정 서비스를 어느 지역으로 설정해 놓았는 지 확인하기.
    - 보유한 이메일 주소 인증 `Verify a New Email Address`
    - SES는 메일을 보내기만 하는 서비스이므로 베일을 받을 수 있는 메일 주소는 따로 준비.
        
        `SES로는 메일을 받을 수 없음`
        
    - Sending Limit Increase
        - 프로덕션 액세스 권한 필요
        - Dashboard → Request Production Access
- SES로 메일 전송 테스트 `Send a Test Email`
    - 등록한 이메일에서 수신 확인하기
- SES SMTP로 메일 발송
    - SMTP → Settings → Create My SMTP Credentials (IAM 사용자, 비밀번호 생성)
    - 매뉴얼로 하지 않기 위해 SMTP 서버 연동
- SES SMTP로 메일 보내기
    - Show User Security Credentials → IAM 사용자의 액세스 키와 시크릿 키 확인
        - 복사 or Download Credentials
- Javax.mail.jar 파일 등록
    - Project 이름 → 마우스 우클릭 → Properties → Java Build Path → Library → Add External JAR
- SMTP 기반 Email 발송 소스코드
    - Email Sender using Javax.mail.jar

---

# AWS 클라우드 ELB(Elastic Load Balancing)

> ELB는 한곳에 집중되는 HTTP, TCP, SSL 트래픽을 여러 EC2인스턴스로 분산
> 

![Untitled](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/Untitled%201.png)

- ELB는 다양한 프로토콜 지원
- 서버가 정상적으로 가동 중인지 확인(Health Check)하여 일부 EC2 인스턴스가 중단되더라도 트래픽을 정상 EC2 인스턴스로 전달
- AJ(Availability Zone)

## ELB

- 프리티어에서 사용가능
- L4(OSI Layer 4) : L4 로드 밸런싱 →  IP주소와 포트번호 기준으로 트래픽 분배
- L7(OSI Layer 7) : L7 로드 밸런싱 → HTTP 헤더의 내요을 기준으로 트래픽 분배
- 로드 밸런싱 알고리즘 : ELB는 라운드 로빈(Round Robin) 알고리즘을 사용
- 헬스 체크(Health Check) : EC2 인스턴스가 정상적으로 가동 중인지 확인
- Connection Draining : 사용자 요청 처리중인 EC2 인스턴스를 바로 삭제하지 못하도록 방지
- Sticky Sessisons : 사용자의 세션을 확인하여 적절한 EC2 인스턴스로 트래픽 분배, HTTP쿠키를 이용한 세션, L7 로드 밸런싱 기능

## ELB 절차

1. 로드 밸런서 정의
2. 보안그룹 할당
3. 보안 설정 구성
4. 상태검사 구성
5. EC2 인스턴스 추가

> Classic Load Balancer
> 
- Listener : 구성한 Protocol 및 Port를 사용하여 Client 연결요청 확인
- Rule : 정의한 Rule에 따라 Load Balancer가 등록된 대상으로 요청을 라우팅
- Health Check : 대상의 상태를 체크
- 대상 : 트래픽을 분산할 대상

## ELB 소개

- ELB 로드 밸런서 생성
    - EC2인스턴스 2개를 각가 다른 가용 영역에 생성(OS 는 Amazon Linux 설치)
- ELB Configuration
    
    ![Untitled](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/Untitled%202.png)
    
    EC2 페이지 → ELB 로드 밸런서 목록(NETWORK & SECURITY → Load Balancers) → Create Load Balancer
    
    - Enable Connection Draining : Connection Draining 사용 옵션 설정
    - Enable Cross-Zone Load Balancing : 여러 가용 영역에 있는 대상에 부하를 분산하는 옵션
    
    ![Untitled](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/Untitled%203.png)
    
    전체 들어오는 양은 60으로 똑같은데 로드밸런싱을 `ON` 했을 때와 `Off` 했을 때의 부하차이가 발생.
    

- Health Check Configuration
    
    ![Untitled](5%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%20AWS%20SES,%20ELB,%20ALB%202a8a223bd4da49d085de92b6f9901090/Untitled%204.png)
    
    헬스 체크를 어느 정도 주기로 할 것인지 설정. (적절한 횟수로 조정)
    
- ELB 서버 Configuration
    - Ping Protocol : 헬스 체크를 할때 사용할 프로토콜 HTTP, HTTPS, TCP, SSL 선택가능
    - Ping Port : 헬스 체크를 할 때 사용할 포트번호
    - Ping Path : 헬스 체크를 할때 접속할 경로
    - Response Time out : 헬스 체크 응답 시간, 이 시간이 지나도 응답이 없으면 EC2 인스턴스 가동 확인에 실패한 것으로 판단
    - Health Check Interval  : 헬스 체크 주기
    - Unhealthy Threshold : 연속으로 설정한 값만큼 가동 확인에 실패했을 때 가동이 중단된 것으로 판단
    - Healthy Threshold : 가동이 중단 되어 트래픽 분산에서 제외되었을 때 연속으로 설정된 값 만큼 가동 확인에 성공하면 다시 포함
    
- ELB 로드 밸런서의 Security Group 생성
    - ELB가 로드 밸런싱 하기 위해 프로토콜 접근 허용
    
- 앞에서 생성한 EC2 인스턴스 2개를 선택하여 ELB 로드 밸런서에 연결

---

# AWS 클라우드 ALB (Application Load Balancer)

- 호스트 헤더에 지정된 도메인 이름을 기반으로 들어오는 트래픽 라우팅하는 Application Load Balancer 규칙

## ALB 장점

- 규칙기반 라우팅 수행으로 프록시 서버가 불필요
- 호스트와 경로 모두에서 라우팅 할 수 있으므로, 개별 Amazon EC2 Container Service 콘테이너에서 실행되는 마이크로 서비스 기반 애플리케이션 구축 및 확장 가능

## ALB 소개

- Load Balancing Console 관련 리스너, View/Edit Rules
- 기본규칙 : web-target-production 으로 모두 전송
- 규칙추가 : + 아이콘 클릭하여 위치를 선택, 규칙은 표시된 순서대로 처리
    - Insert Rule을 클릭하여 새 규칙을 정의
        - *API 관련 요청은 API 서버로 전송*
        - *그 외 다른 요청은 Web 서버 타겟 프로덕션으로 전송*
- 호스트 기반 라우팅 규칙(2개) 추가
    - 개발자가 Web 상황에 맞는 ELB 규칙을 생성하여 Rule Based 라우팅을 해줄 수 있음.
- 경로 기반 라우팅 규칙 추가
    - URL의 경로에 따라 지정한 위치로 전송
- 추가된 규칙 집합
    - 호스트 헤더 규칙에는 최대 3개의 “*”(0자 이상 일치) 또는 “?”(1자 일치) 와일드 카드 사용가능
    

---

<aside>
💡 AWS EC2 서버 인스턴스에 발생하는 부하를 분산시키기 위한 AWS 서비스는?

</aside>

- `ELB`

<aside>
💡 AWS 로드 밸런싱에서 헬스체크 시 선택 가능한 프로토콜에 해당하지 않는 것은?

</aside>

- `FTP`

<aside>
💡 ALB 로드밸런싱 Rule 정의 시 호스트 헤더 규칙에는 최대 3개의 ()를 사용할 수 있다. 빈 칸에 들어갈 문자로 알맞은 것은?

</aside>

- `*`

---

# 정리하기

## 1. AWS 클라우드 SES(Simple Email Service)

- 다양한 이메일 전송 방식 지원
- 스팸 메일을 방지하기 위해서 외부로 메일을 보내려면 프로덕션 액세스 권한을 얻어야 함.
- 프로덕션 액세스 권한을 얻었다면 초당 이메일 5통, 24시간 동안 최대 10,000통 전송 가능
- 프리티어에서 무료로 사용 가능
- EC2, Elastic Beanstalk을 통해 SES를 사용했을 때 매일 2,000통 무료로 전송 가능

## 2. AWS 클라우드 ELB(Elastic Load Balancing)

- 한 곳에 집중되는 HTTP,TCP,SSL 트래픽을 여러 EC2 인스턴스로 분산
- 프리 티어에서 무료로 사용

## 3. AWS 클라우드 ALB(Application Load Balancer)

- 규칙 기반 라우팅 수행으로 프록시 서버가 더 이상 필요하지 않음
- 포트 맵핑, 상태 점검 및 서비스 검색 등 콘테이너 응용 프로그램을 지원하는 몇 가지 기능을 제공
- 호스트와 경로 모두에서 라우팅 할 수 있으므로, 개별 Amazon EC2 Container Service 콘테이너에서 실행되는 마이크로 서비스 기반 애플리케이션을 구축 및 확장 가능