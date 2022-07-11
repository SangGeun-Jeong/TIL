# Amazon SNS(Simple Notification Service)

![AmazonSNS](https://user-images.githubusercontent.com/108352215/177717544-abcf9836-e439-471c-8024-88c38de8de28.PNG)


- 여러가지 프로토콜을 사용하여 논리적 액세스 지원

# 학습 목표

1. AWS 클라우드 SNS의 개념 및 사용 방법을 설명할 수 있다.
2. AWS 클라우드 S3 Storage의 개념 및 사용 방법을 설명할 수 있다.

---

# AWS 클라우드 SNS 1

- 이메일, SMS, SQS 큐 메시지 전송 하는 등 다양하게 활용 가능.
- 프리티어 가능
- 모바일 장치에 푸시 알림.

> SNS 토픽을 통해 메시지를 전달.
> 
- 수신자는 토픽에 가입되어 있는 사용자들
- 애플리케이션은 다양함.(Ios, Android, kindle fire, http 등)

> SNS 토픽 생성 방법
> 
1. SNS 메인에서 Create New Topic 클릭
2. SNS Topic 내용 입력
3. SNS 구독의 엔드포인트 인증 (Email)
4. SNS 토픽에 메시지 보내기 (토픽을 선택하고 Publish 클릭)
5. 이메일이나, APNS, GCM, ADM 애플리케이션을 등록하면 각 장치에 푸시알림 전송 가능.

---

# AWS 클라우드 SNS 2

- 보편적으로 많이 사용 되는 GCM

> SNS로 Google Android에 푸시 알림 보내기
> 
- Gmail 필요
- 프로젝트 번호는 모바일 장치의 Registration ID를 생성할때 필요함.
- APIs & auth → APIs에서 Google clooud Messaging for Android → enable
    - Credentials → Create new Key
- 액세스 키 선택 → server key
- Google API 서버 키 설정 창 → Create
- 생성한 서버 키로 SNS 애플리케이션 생성
- Push notification → GCM으로 설정
- 안드로이드 모바일 장치의 Registration ID를 생성한 후 Add

> Android 앱개발 환경 세팅
> 
- AWS에서 제공하는 예제 애플리케이션 활용
    
    (https://s3.amazonaws.com/codesamples/sns/latest/snsmobilepush.zip)
    
- Package Explorer에서 res → values → strings.xml 파일 → **프로젝트 번호 입력(중요)**

> 앱개발 환경에서 GCM SDK 추가
> 
- ADT의 아이콘 목록 중 Android SDK Maager
- Google Play services 선택 → Install 1 package
- Java build Path → Libraries → Add External JARs → google-play-services.jar 추가

**=⇒ 안드로이드 앱에서 AWS의 SNS 메시지를 송수신 할 수 있게 됨.**

> Order and Export
> 
- 생성한 Registration ID로 SNS 애플리케이션에 엔드포인트 추가
- 애플리케이션이 실행되면 현재 안드로이드 모바일 장치의 Registration ID가 화면에 표시
- SNS 애플리케이션에 엔드포인트를 추가
- SNS Application의 엔드포인트에 Push 메시지 보내기.

---

# AWS 클라우드 S3 Storage

> Simple Storage Service
> 
- 인터넷 Storage Service
- 용량에 관계없이 파일저장가능
- 웹(HTTP 프로토콜) - 파일 업/다운로드 (Ative x 설치 안함)
- 프리티어에서 사용 가능.

> S3 Service
> 
- 객체(Object) : S3에 데이터가 저장되는 최소 단위
    - 기본적으로 키-벨류 형태
- 버킷(bucket) : S3에서 생성할 수 있는 최상위 폴더(디렉터리)
    - 저장 가능한 객체의 개수 / 저장 가능한 용량 무제한
    

> S3 Process
> 
- 버킷 생성하기
    - S3 → Create Bucket → name, region
    - add files : 경로 안에 원하는 파일 업로드
    
- 접근 권한 설정
    - Grant me full control : 자신의 계정에 모든 제어 권한을 부여하는 옵션, 기본값 그대로 사용
    - Make everything public : 올리는 모든 파일을 인터넷에 공개하는 옵션, 기본값 그대로 사용
    - Figure out content types automatically : 파일 확장자에 따라 HTTP Content-Type을 자동으로 설정하는 옵션, 기본값 그대로 사용
    
- 업로드 상황 확인
- 다운로드 시 접근권한 변경 가능.
- Property 설정을 통해 공유 가능.
- S3 객체 권한 설정
    - S3에 올라간 파일을 객체라 하며, 객체마다 각각의 접근 권한 설정 가능.

> 웹 브라우저에 S3 객체의 링크 내용 표시
> 
- Grantee : 권한을 부여할 대상
- Open / Download : 파일을 열고 다운로드 할 수 있는 권한
- View Permission : 권한 내역을 볼 수 있는 권한
- Edit Permissions : 권한을 수정할 수 있는 권한

> 버킷 정책 편집기(Bucket Policy Editor) 표시 - (ACL 액세스 제어 목록)
> 
- JSON형태로 정책의 접근 권한 설정
    - Select Type of Policy
    - Effect
    - Principal
    - AWS Service

**객체에 대한 권한이 public 이어도 버킷이 아니면 제한됨. 버킷도 전체 공개 설정하기.*

---

> 1. AWS에서 서버측에서 특정 Topic에 관심있는 사용자에게 Notification Service를 제공하기 위한 방법은?
> 
- Push

> SNS Service에 대한 설명
> 
- SNS는 구독 중인 endpoint 또는 클라이언트에 메시지 전달 또는 전송을 조정 및 관리하는 웹 Service이다.
- SNS 게시자는 주제에 대한 메시지를 생산 및 발송함으로써 구독자와 비동시적으로 통신할 수 있다.
- SNS Service를 통해 Google Android에 푸시 알림을 보낼 수 있다.

> S3를 통해 수행할 수 있는 작업에 대한 설명
> 
- S3에 업로드 된 파일의 URL을 전달함으로써 제 3자와 파일 공유
- IoT 사물인터넷 환경에서 생성하는 파일/로그 정보를 S3 Storage에 업로드/저장
- 버킷을 생성하여 객체 저장

---

# 정리하기

## 1. AWS 클라우드 SNS

- iPhone, iPad, Android, Kindle Fire와 같은 모바일 장치에 푸시 알림을 보낼 수 있는 Service
- 이메일, SMS, SQS 큐 메시지 전송 가능
- 프리 티어 가능
- 모바일 장치에 푸시 알림을 보내려면 서버를 구축하고 APNS(Apple Push Notification Service),
    
    GCM(Google Cloud Messaging), ADM(Amazon Device Messaging)애 각각 전송 요청
    

## 2. AWS 클라우드 S3 Storage

- 인터넷 Storage Service
- 용량에 관계 없이 파일을 저장 가능
- 웹(HTTP 프로토콜)에서 파일에 접근 가능
- 프리 티어에서 사용 가능
- 객체(Object) : S3에 데이터가 저장되는 최소 단위임
- 버킷(Bucket) : S3에서 생성할 수 있는 최상위 폴더(디렉터리)

---
# 학습내용정리
[3회차 S3 Storage 및 SNS 푸시 알람](https://velog.io/@topgeun7913/3%ED%9A%8C%EC%B0%A8-S3-Storage-%EB%B0%8F-SNS-%ED%91%B8%EC%8B%9C-%EC%95%8C%EB%9E%8C)

