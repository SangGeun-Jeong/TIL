# Amazon Rekognition

- 딥러닝 기술 사용
    - 애플리케이션에 이미지 및 비디오 분석 추가 용이

# 학습목표

- AWS Rekognition Service 개념을 설명할 수 있다.
- AWS Rekognition Service API 활용 방법을 설명할 수 있다.

# AWS Rekognition Service 개념

- AWS에서 제공하는 머신러닝 서비스(입문용)

> AWS의 딥러닝 기반 지능형 Service
> 

<img width="700" alt="스크린샷 2022-07-17 오후 9 31 26" src="https://user-images.githubusercontent.com/108352215/179398428-a13799c7-c9b8-46e2-9b03-6ee6bc8fdbeb.png">


> Amazon Rekognition 특징
> 
- 서비스의 안정성
- 서비스의 응답성(정확성)
- 서비스의 신뢰성
- Deep Learning 플랫폼을 직접 운용하는 데는 많은 전문인력과 인프라 자원이 필요
    - 위와 같은 자원을 절약할 수 있어서 소규모 기업에서 사용하기 적절.
- 직접 Model 개발이 필요 하다면 이를 위한 Ground Truth 생성이 필요
- Amazon의 컴퓨터 비전 과학자들이 Prime Photos에서 매일 수십억 개의 이미지들을 분석할 목적으로 개발하여 높은 성능이 검증
- 기계 학습 전문지식과 딥러닝 지식이 없이도 사용 가능한 Service
    - 완전 관리형, AWS Service 통합, 증명된 확장성, 안정성, 저렴한 비용

> 이미지/동영상을 시각적 분석 기능을 쉽게 제공
> 
1. Rekognition Image
    - 수 많은 이미지를 검색, 확인 및 구성 가능
    - 객체, 장면 및 얼굴을 감지하는 이미지 인식 Service 텍스트를 추출하고, 유명인사를 인식하며, 이미지에서 부적절한 콘텐츠 식별, 얼굴 검색 및 비교, 나이대 예측 가능
    - JPEG 및 PNG 이미지 형식을 지원
    - 이미지는 S3객체 또는 바이트 배열로 인식
    - S3 객체로 전달 시 최대 15MB, 이미지 바이트 배열로 전달 시 최대 5MB의 이미지 파일 크기 지원
    - 분석할 수 있는 최소 크기는 가로 또는 세로 화소가 최소 45픽셀이어야 함.
2. Rekognition Video
    - 저장된 동영상 또는 실시간 동영상 스트림에서 동작 기반 컨텍스트를 추출하고 이를 분석
    - 활동 탐지, 프레임 내 사람의 움직임 이해, AWS S3에 저장된 동영상과 실시간 동영상 스트림에서 객체, 유명인사 및 부적절한 콘텐츠 인식
    - S3 저장소를 매개로 해서 AWS 다른 서비스들과 연계될 수 있음.
    - H.264 코덱을 사용하여 인코딩 해야 함.
    - 지원되는 파일 형식은 MPEG-4 및 MOV
    - MPEG-4 및 MOV 형식 동영상 파일이 작동하지 않는 경우, 동여상을 인코딩 하는데 사용된 코덱이 H.264인지 확인하고 사용.
    - S3파일로 전달될 때 최대 8GB 파일과 최대 2시간 동영상 지원
    

> 이미지 처리
> 
- 객체 및 장면 인식
    - 신뢰도 점수(Confidence Scores)와 함께 제공
    - 신뢰도 90%이상이면 신뢰도 있다고 볼 수 있음.
- 객체 및 장면 인식을 이용하여 많은 양의 이미지 라이브러리로부터 검색, 필터링 등의 기능을 손쉽게 추가 가능.

---

# AWS Rekognition Service API 활용 방법

> AWS Rekognition API
> 
- AWS-SDK를 통한 AWS Rekognition API 사용
- AWS SDK for Java를 사용하려면 다음 조건이 충족되어야 함.
    - Java 개발 환경
    - AWS 계정 및 액세스 키
    - 환경에서 또는 공유된(AWS CLI 및 기타 SDK에 의해) 자격 증명 파일을 사용하여 설정된 AWS wkrur wmdaud (액세스 키)
- AWS-SDK를 통한 Rekognition API 접근
    - 사용자 추가 및 권한 설정(정책 필터를 통한 검색)
    - 권한 설정, 정책 생성도 가능.
    - 생성된 사용자와 Access Key, Secret Access Key 등 정보
        - **비밀 액세스키**
        - **비밀번호**
    - AWS CLI를 통한 AWS-SDK API 활용
        1. AWS 계정 설정 및 IAM 사용자 만들기
        2. AWS CLI 및 AWS-SDK 설정
        3. AWS CLI 및 AWS-SDK API를 사용하여 시작하기
        4. Amazon Rekognition 콘솔 사용 시작하기
- Collection 개념
    - AWS Rekognition의 기본 리소스
    - 생성되는 각각의 컬렉션에는 고유의 Amazon 리소스 이름(ARN)이 부여, 컬렉션에 얼굴을 저장하므로 ‘photo-collection’라는 이름의 Collection 생성
- mvm을 통한 New Project 생성
    - Pom.xml 파일 생성
    - ./src 디렉토리와 ./target 디렉토리 생성
- 기본 생성 pom.xml 파일 대비 변경할 부분.

# AWS Rekognition Service API 활용방법 2

> Apatch Maven 활용
> 

> Example
> 
- AWS Rekognition 콘솔(https://console.aws.amazon.com/rekognition/) 접속
- 객체 및 장면 인식 선택
    - 이미지 업로드 -Upload 버튼 클릭 후 업로드 할 이미지 선택
    - URL - Type the URL in the text box, and then choose Go

> 객체 및 장면 인식 : 동적 이미지 검색 사용 사례
> 
- AWS LAMDA : ec2를 할당받지 않고도 원하는 서비스 실행 가능.
- 활용 예시
    - 사진출력 Service : 원하는 분위기의 또는 가장 잘 나온 사진을 추천
    - 온라인 데이팅 Service : 이상형에 가까운 얼굴 추천
    - 리테일 비즈니스 : 고객의 움직임, 손님의 기분 등을 인식하여 비지니스에 활용
    - 디지털 광고 : 개인화된 광고 제공
- 이미지 상의 얼굴들을 비교하여 유사도(Similarity)를 측정
    - `CompareFaces`
    - 정확도가 신뢰할 수준으로 올라옴.

> SDK를 탑재하고, CLI 명령문을 통해서 EC2 저장소에 접근, 데이터를 JSON 형태로 전송 및 수신하여 파일 처리.
> 

---

<aside>
💡 AWS에서 제공하는 Service로서, 기계 학습 전문지식과 딥러닝 지식이 없이도 쉽게 사용 가능한 인공지능 Services는?

</aside>

`Rekognition`

<aside>
💡 AWS Rekognition Service에서 객체 및 장면을 식별한 결과를 제공할 때 함께 제공하는 정보는 무엇인가?

</aside>

`신뢰도`

<aside>
💡 Maven으로 새 프로젝트 생성시 자동으로 생성되는 resource에 해당하는 것은?

</aside>

`pom.xml`, `src 디렉토리`, `target 디렉토리`

---

# 정리하기

# 1. AWS Rekognition Service 개념

- AWS 딥러닝 기반 지능형 Service: 기계 학습 전문 지식과 딥러닝 지식이 없이도 사용 가능한 Service
- 완전 관리형, AWS Service 통합, 증명된 확장성, 안전성, 저렴한 비용 등의 장점
- 이미지/동영상 시각적 분석 기능을 쉽게 제공
- Rekognition Image를 통해 수많은 이미지를 검색, 확인 및 구성
- Rekognition Vide를 통해 저장된 동영상 또는 실시간 스트림 동영상에서 동작 기반 컨텍스트를 추출하고 이를 분석

# 2. AWS Rekognition Service API 활용 방법

- AWS-SDK를 통한 AWS Rekognition API 사용
- AWS SDK for Java를 사용하려면 다음 조건이 충족되어야 함.
    - Java 개발 환경
    - AWS 계정 및 액세스 키
    - 환경에서 또는 공유된(AWS CLI 및 기타 SDK에 의해) 자격 증명 파일을 사용하여 설정된 AWS 자격 증명(액세스 키)

---

# 학습내용 정리
[6회차 AWS Rekognition - Velog](https://velog.io/@topgeun7913/6%ED%9A%8C%EC%B0%A8-AWS-Rekognition-Service-%ED%99%9C%EC%9A%A9)
