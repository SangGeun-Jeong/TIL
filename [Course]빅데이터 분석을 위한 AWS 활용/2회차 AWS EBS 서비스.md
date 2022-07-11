# 학습목표

1. AWS EBS VOLUME에 대해 설명할 수 있다.
2. AWS EBS SNAPSHOT에 대해 설명할 수 있다.

---

> EBS Volume을 생성한다는 의미는?
> 

스토어에가서 하드디스크를 새로 구매하는 것과 같음.

> EC2 인스턴스와 EBS 인스턴스의 `Availability Zone`을 같게 맞춰주어야 함.
> 

<br />

# AWS EBS

- 대규모 처리량 & 트랜잭션 집약적인 워크로드 모두 지원
- EC2에서 사용하도록 설계
- 고성능 블록 스토리지 서비스

**⇒ 클릭 몇번으로 새로운 하드디스크를 서버에 추가 가능!**

<aside>
💡 Q1 EBS 볼륨을 특정 AWS EC2 서버 인스턴스에 추가하는 작업은?

</aside>

⇒ `Attach`

<aside>
💡 EC2 인스턴스에서 /dev/sdf 장치의 EBS 볼륨을 현재 root file system의 /mnt 디렉토리에 mount 하는 방법은?

</aside>

⇒ `sudo mount /dev/sdf/mnt`

<aside>
💡 AWS 리눅스 인스턴스에서 /dev/sdf 장치에 대한 파일 시스템 생성을 위한 명령으로 올바른 것은?

</aside>

⇒ `sudo mkfs -t ext4/dev/sdf`

<br />

Cmkfs 명령어는 `super user` 권한으로 수행하여야 하므로 `sudo` 명령을 함께 사용하여야 하고, `-t 옵션`을 통해 파일시스템 type을 ext4로 지정하여야 합니다. 추가적으로 파일시스템 생성의 대상을 `/dev/sdf`로 지정하여야 합니다.

---

<br />


# 정리하기

## 1. AWS EBS Volume

- EBS 볼륨을 EC2 인스턴스에 Attach
- **Volume** : 볼륨 ID와 생성된 가용 영역을 보여줌
- **Instance** : Instance 입력 부분 클릭하면 현재 가용 영역에 생성된 EC2 인스턴스의 목록을 보여줌, 이전에 생성한 EC2 인스턴스(Example Server)를 선택.
- **Device** : EC2 인스턴스를 선택하면 자동으로 설정, 기본값 그대로 사용
- 설정이 완료되었으면 Attach 버튼을 클릭

## 2. AWS EBS Snapshot

- **Snapshot** : EBS 볼륨의 전체 내용 중 특정 시점을 파일로 저장한 형태
- EBS 볼륨에 대한 일종의 백업 파일
- 프리 티어에서 사용 가능
- Free-Tier 에서는 EBS 스냅샷 스토리지 1GB를 무료로 사용 가능
- Amazone Linux가 설치된 8GB EBS 볼륨의 스냅샷을 생성하지만, EBS 볼륨의 전체 크기가 8GB일 뿐 실제 용량은 1GB가 되지 않으므로 무료 사용 용량 안에서 실습 가능 (EBS 스냅샷은 변경된 부분만 저장)


---
# 학습 내용 정리

[2회차 AWS EBS 서비스 정리](https://velog.io/@topgeun7913/2%ED%9A%8C%EC%B0%A8-AWS-EBS-%EC%84%9C%EB%B9%84%EC%8A%A4#%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC)
