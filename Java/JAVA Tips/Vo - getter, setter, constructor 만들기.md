
# VO 만들기 (Eclipse)

```java
	private int TFSEQ=0;
	private String TFOPR="";
	private String TFOPRN="";
	

	public int getTFSEQ() {
		return TFSEQ;
	}

	public void setTFSEQ(int tFSEQ) {
		TFSEQ = tFSEQ;
	}

	public String getTFOPR() {
		return TFOPR;
	}

	public void setTFOPR(String tFOPR) {
		TFOPR = tFOPR;
	}

	public String getTFOPRN() {
		return TFOPRN;
	}

	public void setTFOPRN(String tFOPRN) {
		TFOPRN = tFOPRN;
	}
```
- 다음을 예시로 먼저 VO를 활용해 객체로 만들어줄 때 안에 담아줄 변수를 생성.
- 변수위에서 우클릭 후
    - Source -
        - `Generate Getter and Setter`
        - `Generate Constructor using Fields`
