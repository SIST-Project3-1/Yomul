-- DB 초기화
DROP TABLE YOMUL_MEMBERS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_FAVORITE_LISTS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_TRADE_HISTORY CASCADE CONSTRAINTS;
DROP TABLE YOMUL_CHATS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_TOWN_ARTICLES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_NEAR_ARTICLES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_VENDORS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_VENDOR_NEWS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_VENDOR_CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_VENDOR_REVIEWS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_NOTICES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_FAQ_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_FAQ_ARTICLES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_QNA_CATEGORIES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_QNA_ARTICLES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_FILES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_COMMENTS CASCADE CONSTRAINTS;
DROP SEQUENCE YOMUL_FILE_FILENO_SEQ;

-- 제약 조건 명명 규칙
-- 제약조건 축약어_자기테이블_상대테이블[_속성명]

-- 테이블 생성
-- 회원
CREATE TABLE YOMUL_MEMBERS(
  EMAIL VARCHAR2(100), -- 이메일
  PW VARCHAR2(50) NOT NULL, -- 비밀번호
  NICKNAME VARCHAR2(50) NOT NULL UNIQUE, -- 별명
  HASHSLAT VARCHAR2(100) NOT NULL, -- 해쉬 솔트
  PHONE VARCHAR2(30), -- 전화번호
  GENDER VARCHAR2(5), -- 성별
  INTRO VARCHAR2(500), -- 자기소개
  KAKAO_TOKEN VARCHAR2(100) UNIQUE, -- 카카오 로그인 토큰
  CONSTRAINT PK_MEMBERS PRIMARY KEY(EMAIL)
);

-- 찜 목록
CREATE TABLE YOMUL_FAVORITE_LISTS(
  
);

-- 물건 거래 내역
-- 거래번호, 물건 번호, 판매자, 구매자, 거래 일시,
CREATE TABLE YOMUL_TRADE_HISTORY(
  NO NUMBER(10) -- 거래 번호
  PRODUCT_NO NUMBER(10), -- 물건 번호
  SELLER VARCHAR2(100)  CONSTRAINT NN_TRADE_HISTORY_SELLER NOT NULL, -- 판매자
  BUYER VARCHAR2(100) CONSTRAINT NN_TRADE_HISTORY_BUYER NOT NULL,  -- 구매자
  TRADE_DATE DATE NOT NULL, -- 거래일시
  CONSTRAINT PK_TRADE_HISTORY PRIMARY KEY(NO),
  CONSTRAINT FK_TRADE_HISTORY_PRODUCTS FOREIGN KEY(PRODUCT_NO) REFERENCES YOMUL_PRODUCTS(NO) ON DELETE CASCADE,
  CONSTRAINT FK_TRADE_MEMBERS_SELLER FOREIGN KEY(SELLER) REFERENCES YOMUL_MEMBERS(EMAIL) ON DELETE CASCADE,
  CONSTRAINT FK_TRADE_MEMBERS_BUYER FOREIGN KEY(BUYER) REFERENCES YOMUL_MEMBERS(EMAIL) ON DELETE CASCADE
);

-- 채팅
CREATE TABLE YOMUL_CHATS(
   - 번호(pk)not null, 수신자not null, 발신자not null, 내용not null, (사진?), 시간
);

-- 물건 정보
CREATE TABLE YOMUL_PRODUCTS(
  - 물건 번호, 등록 유저 , 물건 글 제목, 물건 글 내용, 가격, 물건 판매 상태, 
);

-- 동네생활 게시글
CREATE TABLE YOMUL_TOWN_ARTICLES(
  
);

-- 내 근처 게시글
CREATE TABLE YOMUL_NEAR_ARTICLES(
  NO NUMBER(10) PRIMARY KEY, --상품 게시글 번호
  TITLE VARCHAR2(50) NOT NULL, -- 상품 제목
  CATEGORY VARCHAR2(20) NOT NULL, -- 카테고리
  PRICE NUMBER(30), --가격(선택)
  HP VARCHAR2(50) , --핸드폰 번호(선택)
  CONTENT VARCHAR2(1000) NOT NULL, --본문 내용
  NDATE DATE NOT NULL, --작성 일자
  CHATCHECK NUMBER(5) DEFAULT 0    -- 채팅 금지 여부 DEFAULT 0 
);

-- 업체 정보
CREATE TABLE YOMUL_VENDORS(
  
);

-- 업체 소식
CREATE TABLE YOMUL_VENDOR_NEWS(
  
);

-- 업체 단골
CREATE TABLE YOMUL_VENDOR_CUSTOMERS(
  
);

-- 업체 후기
CREATE TABLE YOMUL_VENDOR_REVIEWS(
  
);

-- 공지사항
CREATE TABLE YOMUL_NOTICES(
  varchar2(20) no primary key -- 글 번호
number(10) uno foreign key refferences members(no) -- 작성자(관리자) 회원 번호
date wdate not null -- 작성 날짜
varchar2(100) title not null -- 제목
varchar2(400) content not null -- 내용
);

-- FAQ 카테고리
CREATE TABLE YOMUL_FAQ_CATEGORIES(
  number(4) code primary key -- 코드
varchar2(100) content not null -- 카테고리 내용
운영정책
계정/인증
구매/판매
거래 품목
거래 매너
이벤트/초대
이용 제재
기타
비즈프로필
동네생활
지역 광고
채팅
);

-- FAQ 게시글
CREATE TABLE YOMUL_FAQ_ARTICLES(
  varchar2(20) no primary key -- 글 번호
number(4) category foreign key refferences faq_categories(code) -- 카테고리
varchar2(100) title not null -- 제목
varchar2(400) content not null -- 내용
);

-- QNA 카테고리
CREATE TABLE YOMUL_QNA_CATEGORIES(
  number(4) code primary key -- 코드
varchar2(100) content not null -- 카테고리 내용
거래 환불/분쟁 및 사기 신고
계정 문의
판매 금지/거래 품목 문의
매너평가, 매너온도, 거래후기 관련 문의
게시글 노출, 미노출 문의
채팅, 알림 문의
앱 사용/거래 방법 문의
동네 생활(커뮤니티) 문의
지역 광고 문의
비즈프로필(등록, 이용) 문의
검색 문의
기타 문의
오류 제보
개선/제안
);

-- QNA 게시글
CREATE TABLE YOMUL_QNA_ARTICLES(
  varchar2(20) no primary key -- 글 번호
number(10) uno foreign key refferences members(no) -- 작성자 회원번호
date wdate not null -- 작성 날짜
number(4) category foreign key refferences qna_categories(code) -- 유형
varchar2(100) email not null -- 작성자 이메일(답변완료 수신받을 이메일)
varchar2(100) title not null -- 제목
varchar2(400) content not null -- 내용
date rdate -- 답변 날짜
number(10) uno foreign key refferences members(no) -- 답변 작성자(관리자) 회원 번호
varchar2(400) reply -- 답변 내용
);

-- 업로드 된 파일 테이블. 실제로 저장된 파일 명은 ('파일 번호'_'파일 명') 식으로 저장
CREATE TABLE YOMUL_FILES(
    FILENO NUMBER(10), -- 파일 번호
    FILENAME VARCHAR2(100), -- 파일 명
    ARTICLENO VARCHAR2(10) -- 작성된 게시글 번호
    -글 번호(예=p-001, n-005, t-007)not null, 파일번호(pk)not null, n파일
);

-- 댓글
CREATE TABLE YOMUL_COMMENTS(
  NO NUMBER(10)  PRIMARY KEY, -- 댓글 번호 
  BOARDNAME VARCHAR2(50) NOT NULL, -- 댓글 달리는 게시판명
  NICKNAME VARCHAR2(30) NOT NULL, -- 작성자 닉네임
  CONTENT VARCHAR2(1000)  NOT NULL, -- 작성 내용
  WDATE DATE  NOT NULL, -- 작성일자
  CONSTRAINT FK_COMMENTS FOREIGN KEY(NICKNAME) REFERENCES MEMBERS(NICKNAME)
);

-- 회원 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_FILE_FILENO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가
