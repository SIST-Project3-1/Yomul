-- 제약 조건 명명 규칙
-- '제약조건 축약어'_Y_'자기테이블 축약어'_['상대테이블 축약어']_속성명

-- DB 초기화
-- 뷰 삭제
DROP VIEW V_Y_COMMENTS;
DROP VIEW V_Y_COMMENTS_LIKE_COUNT;
DROP VIEW V_Y_COMMENTS_REPORT_COUNT;
DROP VIEW V_Y_VENDORS;
DROP VIEW V_Y_VENDORS_NEWS;
DROP VIEW V_Y_VENDORS_CUSTOMERS;
DROP VIEW V_Y_VENDORS_REVIEWS;
DROP VIEW V_Y_FAQ_ARTICLES;
DROP VIEW V_Y_QNA_ARTICLES;
DROP VIEW V_Y_QNA_FILES;
-- 테이블 삭제----------------------------------------------------------------------------------------------------------------------------------
DROP TABLE YOMUL_MEMBERS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_PRODUCTS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_FAVORITE_LISTS CASCADE CONSTRAINTS;
DROP TABLE YOMUL_TRADE_HISTORY CASCADE CONSTRAINTS;
DROP TABLE YOMUL_CHATS CASCADE CONSTRAINTS;
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
DROP TABLE YOMUL_LIKES CASCADE CONSTRAINTS;
DROP TABLE YOMUL_REPORTS CASCADE CONSTRAINTS;
-- 시퀀스 삭제----------------------------------------------------------------------------------------------------------------------------------
DROP SEQUENCE YOMUL_MEMBERS_NO_SEQ;
DROP SEQUENCE YOMUL_PRODUCTS_NO_SEQ;
DROP SEQUENCE YOMUL_TRADE_HISTORY_NO_SEQ;
DROP SEQUENCE YOMUL_CHATS_NO_SEQ;
DROP SEQUENCE YOMUL_TOWN_ARTICLES_NO_SEQ;
DROP SEQUENCE YOMUL_NEAR_ARTICLES_NO_SEQ;
DROP SEQUENCE YOMUL_VENDORS_NO_SEQ;
DROP SEQUENCE YOMUL_VENDOR_NEWS_NO_SEQ;
DROP SEQUENCE YOMUL_VENDOR_REVIEWS_NO_SEQ;
DROP SEQUENCE YOMUL_NOTICES_NO_SEQ;
DROP SEQUENCE YOMUL_FAQ_ARTICLES_NO_SEQ;
DROP SEQUENCE YOMUL_QNA_ARTICLES_NO_SEQ;
DROP SEQUENCE YOMUL_COMMENTS_NO_SEQ;
-- 테이블 생성----------------------------------------------------------------------------------------------------------------------------------
-- 회원
CREATE TABLE YOMUL_MEMBERS(
    NO VARCHAR2(10), -- 회원번호
    EMAIL VARCHAR2(100) CONSTRAINT NN_Y_M_EMAIL NOT NULL CONSTRAINT U_Y_M_EMAIL UNIQUE, -- 이메일
    PW VARCHAR2(50) CONSTRAINT NN_Y_M_PW NOT NULL, -- 비밀번호
    NICKNAME VARCHAR2(50) CONSTRAINT NN_Y_M_NICKNAME NOT NULL CONSTRAINT U_Y_M_NICKNAME UNIQUE, -- 별명
    HASHSALT VARCHAR2(100) CONSTRAINT NN_Y_M_HASHSALT NOT NULL, -- 해쉬 솔트
    PHONE VARCHAR2(30), -- 전화번호
    GENDER VARCHAR2(5) CONSTRAINT C_Y_M_GENDER CHECK (GENDER IN('F', 'M')), -- 성별
    INTRO VARCHAR2(500), -- 자기소개
    KAKAO_TOKEN VARCHAR2(100) CONSTRAINT U_Y_M_KAKAO_TOKEN UNIQUE, -- 카카오 로그인 토큰
    AUTHORITY VARCHAR2(10) DEFAULT 'USER' CONSTRAINT NN_Y_M_AUTHORITY NOT NULL CONSTRAINT C_Y_M_AUTHORITY CHECK (AUTHORITY IN('USER', 'ADMIN')), -- 권한
    WITHDRAWAL NUMBER(1) DEFAULT 0 CONSTRAINT C_Y_M_WITHDRAWAL CHECK (WITHDRAWAL IN(0, 1)) CONSTRAINT NN_Y_M_WITHDRAWAL NOT NULL, -- 탈퇴 요청 여부
    MDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_M_MDATE NOT NULL, -- 가입 일자
    SUBSCRIBE VARCHAR2(3) DEFAULT 'off' CONSTRAINT NN_Y_M_SUBSCRIBE NOT NULL CONSTRAINT C_Y_M_SUBSCRIBE CHECK (SUBSCRIBE IN ('on', 'off')), -- 구독, OFF: 구독안함, ON: 구독함
    CONSTRAINT PK_Y_M_NO PRIMARY KEY(NO)
);

-- 물건 정보
CREATE TABLE YOMUL_PRODUCTS(
    NO VARCHAR2(10), -- 물건 번호
    SELLER VARCHAR2(10) CONSTRAINT NN_Y_P_SELLER NOT NULL, -- 등록자
    TITLE VARCHAR2(100) CONSTRAINT NN_Y_P_TITLE NOT NULL, -- 글 제목
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_P_CONTENT NOT NULL, -- 글 내용
    PRICE NUMBER(20) CONSTRAINT NN_Y_P_PRICE NOT NULL CONSTRAINT C_Y_P_PRICE CHECK (PRICE >= 0), -- 가격
    STATE VARCHAR2(20) CONSTRAINT NN_Y_P_STATE NOT NULL CONSTRAINT C_Y_P_STATE CHECK (STATE IN('SELLING', 'SOLD')), -- 물건 상태
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_P_HITS NOT NULL CONSTRAINT C_Y_P_HITS CHECK (HITS >= 0), -- 조회수
    CONSTRAINT PK_Y_P_NO PRIMARY KEY(NO),
    CONSTRAINT FK_Y_P_M_SELLER FOREIGN KEY (SELLER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 찜 목록
CREATE TABLE YOMUL_FAVORITE_LISTS(
  MEMBER_NO VARCHAR2(10) CONSTRAINT NN_Y_FL_EMAIL NOT NULL, -- 찜한 유저
  PRODUCT_NO VARCHAR2(10) CONSTRAINT NN_Y_FL_PRODUCT_NO NOT NULL, -- 찜 된 물건
  CONSTRAINT FK_Y_FL_M_EMAIL FOREIGN KEY (MEMBER_NO) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE,
  CONSTRAINT FK_Y_FL_P_NO FOREIGN KEY (PRODUCT_NO) REFERENCES YOMUL_PRODUCTS(NO) ON DELETE CASCADE
);

-- 물건 거래 내역
CREATE TABLE YOMUL_TRADE_HISTORY(
  NO VARCHAR2(10), -- 거래 번호
  PRODUCT_NO VARCHAR2(10)  CONSTRAINT NN_Y_T_H_NO NOT NULL, -- 물건 번호
  SELLER VARCHAR2(10)  CONSTRAINT NN_Y_TH_SELLER NOT NULL, -- 판매자
  BUYER VARCHAR2(10) CONSTRAINT NN_Y_TH_BUYER NOT NULL,  -- 구매자
  TRADE_DATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_TH_TDATE NOT NULL, -- 거래일시
  CONSTRAINT PK_Y_TH_NO PRIMARY KEY(NO),
  CONSTRAINT FK_Y_TH_PRODUCTS FOREIGN KEY(PRODUCT_NO) REFERENCES YOMUL_PRODUCTS(NO) ON DELETE CASCADE,
  CONSTRAINT FK_Y_TH_M_SELLER FOREIGN KEY(SELLER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE,
  CONSTRAINT FK_Y_TH_M_BUYER FOREIGN KEY(BUYER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 채팅
CREATE TABLE YOMUL_CHATS(
    NO VARCHAR2(10), -- 채팅 번호 
    CHAT_FROM VARCHAR2(10) CONSTRAINT NN_Y_C_CHAT_FROM NOT NULL, -- 채팅 발신자
    CHAT_TO VARCHAR2(10) CONSTRAINT NN_Y_C_CHAT_TO NOT NULL, -- 채팅 수신자
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_C_CONTENT NOT NULL, -- 채팅 내용
    CDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_C_CDATE NOT NULL, -- 채팅 전송 시간
    IMG VARCHAR2(100), -- 전송 이미지
    CONSTRAINT PK_Y_CH_NO PRIMARY KEY(NO) ,
    CONSTRAINT FK_Y_CH_M_CHAT_FROM FOREIGN KEY (CHAT_FROM) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE,
    CONSTRAINT FK_Y_CH_M_CHAT_TO FOREIGN KEY (CHAT_TO) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 동네생활 게시글
CREATE TABLE YOMUL_TOWN_ARTICLES(
    NO VARCHAR2(10), -- 게시글 번호
    WRITER VARCHAR2(10) CONSTRAINT NN_Y_TA_WRITER NOT NULL, -- 작성자
    CATEGORY VARCHAR2(20) CONSTRAINT NN_Y_TA_CATEGORY NOT NULL, -- 카테고리
    TITLE VARCHAR2(100) CONSTRAINT NN_Y_TA_TITLE NOT NULL, -- 제목
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_TA_CONTENT NOT NULL, -- 내용
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_TA_HITS NOT NULL CONSTRAINT C_Y_TA_HITS CHECK (HITS >= 0), -- 조회수
    TDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_TA_TDATE NOT NULL, -- 작성 일자
    CONSTRAINT PK_Y_TA_NO PRIMARY KEY(NO),
    CONSTRAINT FK_Y_TA_M_WRITER FOREIGN KEY (WRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 내 근처 게시글
CREATE TABLE YOMUL_NEAR_ARTICLES(
    NO VARCHAR2(10), --상품 게시글 번호
    WRITER VARCHAR2(10) CONSTRAINT NN_Y_NA_WRITER NOT NULL, -- 작성자
    TITLE VARCHAR2(50) CONSTRAINT NN_Y_NA_TITLE NOT NULL, -- 상품 제목
    CATEGORY VARCHAR2(20) CONSTRAINT NN_Y_NA_CATEGORY NOT NULL, -- 카테고리
    PRICE NUMBER(30) CONSTRAINT C_Y_NA_PRICE CHECK (PRICE >= 0), --가격(선택)
    HP VARCHAR2(50), --핸드폰 번호(선택)
    CONTENT VARCHAR2(1000) CONSTRAINT NN_Y_NA_CONTENT NOT NULL, --본문 내용
    NDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_NA_NDATE NOT NULL, --작성 일자
    CHATCHECK NUMBER(1) DEFAULT 0 CONSTRAINT NN_Y_NA_CHATCHECK NOT NULL CONSTRAINT C_Y_NA_CHATCHECK CHECK (CHATCHECK IN(0, 1)),  -- 채팅 금지 여부 DEFAULT 0 
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_NA_HITS NOT NULL CONSTRAINT C_Y_NA_HITS CHECK (HITS >= 0), -- 조회수
    CONSTRAINT PK_Y_NA_NO PRIMARY KEY(NO),
    CONSTRAINT FK_Y_NA_WRITER FOREIGN KEY (WRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 업체정보
CREATE TABLE YOMUL_VENDORS(
    NO VARCHAR2(10), -- 업체 번호
    OWNER VARCHAR2(10) CONSTRAINT NN_Y_V_OWNER NOT NULL CONSTRAINT U_Y_V_OWNER UNIQUE, --회원번호
    NAME VARCHAR2(50) CONSTRAINT NN_Y_V_NAME NOT NULL CONSTRAINT U_Y_V_NAME UNIQUE, --업체명
    CATEGORY VARCHAR2(20) CONSTRAINT NN_Y_V_CATEGORY NOT NULL, --카테고리 
    INFO VARCHAR2(200) CONSTRAINT NN_Y_V_INFO NOT NULL, --정보 
    TEL VARCHAR2(30) CONSTRAINT NN_Y_V_TEL NOT NULL, --전화번호 
    ADDR VARCHAR2(50) CONSTRAINT NN_Y_V_ADDR NOT NULL, --주소
    CONSTRAINT PK_Y_V_NO PRIMARY KEY (NO),
    CONSTRAINT FK_Y_V_OWNER FOREIGN KEY (OWNER) REFERENCES YOMUL_MEMBERS(NO)
);

-- 업체 소식 (업체명 이용하여 업체 프필이미지 가져오기)
CREATE TABLE YOMUL_VENDOR_NEWS(
    NO NUMBER(10), --소식 번호
    VENDOR_NO VARCHAR2(10) CONSTRAINT NN_Y_VN_VENDOR_NO NOT NULL,  --업체 번호
    CATEGORY VARCHAR2(20) CONSTRAINT NN_Y_VN_CATEGORY NOT NULL, --카테고리
    TITLE VARCHAR2(50) CONSTRAINT NN_Y_VN_TITLE NOT NULL,  --소식 타이틀
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_VN_CONTENT NOT NULL, --소식 내용
    IMG VARCHAR2(200),  --소식 이미지
    PRICE VARCHAR2(20) DEFAULT 0 CONSTRAINT NN_Y_VN_PRICE NOT NULL CONSTRAINT C_Y_VN_PRICE CHECK (PRICE >= 0),  --가격
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_VN_HITS NOT NULL CONSTRAINT C_Y_VN_HITS CHECK (HITS >= 0), --조회수
    VDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_VN_VDATE NOT NULL, --날짜
    CONSTRAINT PK_Y_VN_NO PRIMARY KEY (NO),
    CONSTRAINT FK_Y_VN_VENDOR_NO FOREIGN KEY (VENDOR_NO) REFERENCES YOMUL_VENDORS(NO)
);

-- 업체 단골 (회원번호 이용하여 단골 프필이미지, 닉네임 가져오기)
CREATE TABLE YOMUL_VENDOR_CUSTOMERS(
    VENDOR_NO VARCHAR2(10), --업체번호
    CUSTOMER_NO VARCHAR2(10), --회원번호
    CONSTRAINT PK_Y_VC PRIMARY KEY(VENDOR_NO, CUSTOMER_NO),
    CONSTRAINT FK_Y_VC_VNO FOREIGN KEY (VENDOR_NO) REFERENCES YOMUL_VENDORS(NO),
    CONSTRAINT FK_Y_VC_CNO FOREIGN KEY (CUSTOMER_NO) REFERENCES YOMUL_MEMBERS(NO)
);

-- 업체 후기 (회원번호 이용하여 단골 프필이미지, 닉네임 가져오기)
CREATE TABLE YOMUL_VENDOR_REVIEWS(
    NO NUMBER(10), --후기 번호
    VENDOR_NO VARCHAR2(10) CONSTRAINT NN_Y_VR_VENDOR_NO NOT NULL,  --업체 번호
    MEMBER_NO VARCHAR2(10)CONSTRAINT NN_Y_VR_MEMBER_NO NOT NULL, --회원번호
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_VR_CONTENT NOT NULL, --후기 내용
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_VR_HITS NOT NULL CONSTRAINT C_Y_VR_HITS CHECK (HITS >= 0), --조회수
    VDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_VR_VDATE NOT NULL, --날짜
    CONSTRAINT PK_Y_VR_NO PRIMARY KEY (NO),
    CONSTRAINT FK_Y_VR_VENDOR_NO FOREIGN KEY (VENDOR_NO) REFERENCES YOMUL_VENDORS(NO),
    CONSTRAINT FK_Y_VR_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES YOMUL_MEMBERS(NO)
);

-- 공지사항
CREATE TABLE YOMUL_NOTICES(
    NO VARCHAR2(10), -- 글 번호
    WRITER VARCHAR2(10) CONSTRAINT NN_Y_N_WRITER NOT NULL, -- 작성자
    TITLE VARCHAR2(100) CONSTRAINT NN_Y_N_TITLE NOT NULL, -- 제목
    CONTENT VARCHAR2(400) CONSTRAINT NN_Y_N_CONTENT NOT NULL, -- 내용
    NDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_N_NDATE NOT NULL, -- 작성일자
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_N_HITS NOT NULL CONSTRAINT C_Y_N_HITS CHECK (HITS >= 0), -- 조회수
    CONSTRAINT PK_Y_N_NO PRIMARY KEY(NO),
    CONSTRAINT FK_Y_N_WRITER FOREIGN KEY (WRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- FAQ 카테고리
CREATE TABLE YOMUL_FAQ_CATEGORIES(
    NO NUMBER(4), -- 카테고리 코드
    CONTENT VARCHAR2(100) CONSTRAINT NN_Y_FC_CONTENT NOT NULL, -- 카테고리 내용
    CONSTRAINT PK_Y_FC_NO PRIMARY KEY (NO)
);

-- FAQ 게시글
CREATE TABLE YOMUL_FAQ_ARTICLES(
    NO NUMBER(10), -- 글 번호
    WRITER VARCHAR2(10) CONSTRAINT NN_Y_FA_WRITER NOT NULL, -- 작성자
    CATEGORY NUMBER(4) CONSTRAINT NN_Y_FA_CATEGORY NOT NULL, -- 카테고리
    TITLE VARCHAR2(100) CONSTRAINT NN_Y_FA_TITLE NOT NULL, -- 제목
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_FAQ_ARTICLES_CONTENT NOT NULL, -- 내용
    CONSTRAINT PK_Y_FA_NO PRIMARY KEY (NO),
    CONSTRAINT FK_Y_FA_FAQ_CATEGORIES FOREIGN KEY (CATEGORY) REFERENCES YOMUL_FAQ_CATEGORIES(NO) ON DELETE CASCADE,
    CONSTRAINT FK_Y_FA_WRITER FOREIGN KEY (WRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- QNA 카테고리
CREATE TABLE YOMUL_QNA_CATEGORIES(
    NO NUMBER(4), -- 코드
    CONTENT VARCHAR2(100) CONSTRAINT NN_Y_Q_CATEGORIES NOT NULL, -- 카테고리 내용
    CONSTRAINT PK_Y_QC_NO PRIMARY KEY (NO)
);

-- QNA 게시글
CREATE TABLE YOMUL_QNA_ARTICLES(
    NO VARCHAR2(10), -- 글 번호
    NAME VARCHAR2(50) CONSTRAINT NN_Y_QA_NAME NOT NULL, -- 작성자 이름
    EMAIL VARCHAR2(100) CONSTRAINT NN_Y_QA_EMAIL NOT NULL, -- 작성자 회원번호
    PW VARCHAR2(50) CONSTRAINT NN_Y_QA_PW NOT NULL, -- 비밀번호
    HASHSALT VARCHAR2(100) CONSTRAINT NN_Y_QA_HASHSALT NOT NULL, -- 해쉬 솔트
    WDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_QA_WDATE NOT NULL, -- 작성 일자
    CATEGORY NUMBER(4) CONSTRAINT NN_Y_QA_CATEGORY NOT NULL, -- 작성 글 카테고리
    TITLE VARCHAR2(100) CONSTRAINT NN_Y_QA_TITLE NOT NULL, -- 제목
    CONTENT VARCHAR2(500) CONSTRAINT NN_Y_QA_CONTENT NOT NULL, -- 내용
    HITS NUMBER(10) DEFAULT 0 CONSTRAINT NN_Y_QA_HITS NOT NULL CONSTRAINT C_Y_QA_HITS CHECK (HITS >= 0), -- 조회수
    RDATE DATE, -- 답변 날짜
    RWRITER VARCHAR2(10), -- 답변 작성자 회원번호
    RCONTENT VARCHAR2(500), -- 답변 작성 내용
    SECRET VARCHAR2(3) DEFAULT 'off' CONSTRAINT NN_Y_QA_SECRET NOT NULL CONSTRAINT C_Y_QA_SECRET CHECK (SECRET IN ('on', 'off')), -- 구독, OFF: 구독안함, ON: 구독함
    CONSTRAINT PK_Y_QA_NO PRIMARY KEY (NO),
    CONSTRAINT FK_Y_QA_M_RWRITER FOREIGN KEY (RWRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE,
    CONSTRAINT FK_Y_QA_QC_CATEGORY FOREIGN KEY (CATEGORY) REFERENCES YOMUL_QNA_CATEGORIES(NO) ON DELETE CASCADE
);

-- 업로드 된 파일 
-- 실제로 저장된 파일 명은 ('게시글 번호'_'파일 번호'_'파일 명') 식으로 저장 ex(n001_1_example_jpg)
CREATE TABLE YOMUL_FILES(
    ARTICLE_NO VARCHAR2(50) CONSTRAINT NN_Y_F_ARTICLE_NO NOT NULL, -- 작성된 게시글 번호
    NO NUMBER(10), -- 파일 번호
    FILENAME VARCHAR2(100) CONSTRAINT NN_Y_F_FILENAME NOT NULL, -- 파일 명
    CONSTRAINT PK_Y_F_NO PRIMARY KEY (ARTICLE_NO, NO, FILENAME)
);

-- 댓글
CREATE TABLE YOMUL_COMMENTS(
  NO VARCHAR2(10), -- 댓글 번호
  ARTICLE_NO VARCHAR2(10) CONSTRAINT NN_Y_CO_ARTICLE_NO NOT NULL, -- 작성된 게시글 번호
  WRITER VARCHAR2(10) CONSTRAINT NN_Y_CO_WRITER NOT NULL, -- 작성자 회원번호
  CONTENT VARCHAR2(1000) CONSTRAINT NN_Y_CO_CONTENT NOT NULL, -- 작성 내용
  WDATE DATE DEFAULT SYSDATE CONSTRAINT NN_Y_CO_WDATE NOT NULL, -- 작성일자
  CONSTRAINT PK_Y_CO_NO PRIMARY KEY (NO),
  CONSTRAINT FK_Y_CO_M_WRITER FOREIGN KEY(WRITER) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 게시글, 댓글 좋아요 테이블
CREATE TABLE YOMUL_LIKES(
    ARTICLE_NO VARCHAR2(10), -- 좋아요 눌린 게시글 번호
    MEMBER_NO VARCHAR2(10),  -- 좋아요 누른 사람
    CONSTRAINT PK_Y_L PRIMARY KEY (ARTICLE_NO, MEMBER_NO),
    CONSTRAINT FK_Y_L_M_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);

-- 신고
CREATE TABLE YOMUL_REPORTS(
    ARTICLE_NO VARCHAR2(10), -- 신고 눌린 게시글 번호
    MEMBER_NO VARCHAR2(10), -- 신고 누른 사람
    CONSTRAINT PK_Y_R PRIMARY KEY (ARTICLE_NO, MEMBER_NO),
    CONSTRAINT FK_Y_R_M_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES YOMUL_MEMBERS(NO) ON DELETE CASCADE
);
-- 테이블 생성 끝----------------------------------------------------------------------------------------------------------------------------------

-- 뷰 생성 ---------------------------------------------------------------------------------------------------------------------------------------
-- 댓글 좋아요 수 뷰 생성
CREATE NOFORCE VIEW V_Y_COMMENTS_LIKE_COUNT
AS
SELECT C.NO, COUNT(L.ARTICLE_NO) LIKES
FROM YOMUL_COMMENTS C, YOMUL_LIKES L
WHERE C.NO = L.ARTICLE_NO(+)
GROUP BY C.NO, L.ARTICLE_NO
WITH READ ONLY;

-- 댓글 신고 수 뷰 생성
CREATE NOFORCE VIEW V_Y_COMMENTS_REPORT_COUNT
AS
SELECT C.NO, COUNT(R.ARTICLE_NO) REPORTS
FROM YOMUL_COMMENTS C, YOMUL_REPORTS R
WHERE C.NO = R.ARTICLE_NO(+)
GROUP BY C.NO, R.ARTICLE_NO
WITH READ ONLY;

-- 댓글 정보 뷰 생성(댓글 + 좋아요 수 + 신고 수 + 이미지 + 이미지)
CREATE NOFORCE VIEW V_Y_COMMENTS
AS
SELECT C.NO, C.ARTICLE_NO, C.WRITER, C.CONTENT, C.WDATE, L.LIKES, R.REPORTS, F.ARTICLE_NO||'_'||F.NO||'_'||F.FILENAME IMG
FROM YOMUL_COMMENTS C, V_Y_COMMENTS_LIKE_COUNT L, V_Y_COMMENTS_REPORT_COUNT R, YOMUL_FILES F
WHERE C.NO = L.NO AND C.NO = R.NO AND C.NO = F.ARTICLE_NO(+);

-- 업체 소식 수 뷰 생성
CREATE NOFORCE VIEW V_Y_VENDORS_NEWS
AS
SELECT V.NO, COUNT(N.VENDOR_NO) NEWS
FROM YOMUL_VENDORS V, YOMUL_VENDOR_NEWS N
WHERE V.NO = N.VENDOR_NO(+)
GROUP BY V.NO, N.VENDOR_NO
WITH READ ONLY;

-- 업체 단골 수 뷰 생성
CREATE NOFORCE VIEW V_Y_VENDORS_CUSTOMERS
AS
SELECT V.NO, COUNT(C.VENDOR_NO) CUSTOMERS
FROM YOMUL_VENDORS V, YOMUL_VENDOR_CUSTOMERS C
WHERE V.NO = C.VENDOR_NO(+)
GROUP BY V.NO, C.VENDOR_NO
WITH READ ONLY;

-- 업체 후기 수 뷰 생성
CREATE NOFORCE VIEW V_Y_VENDORS_REVIEWS
AS
SELECT V.NO, COUNT(R.VENDOR_NO) REVIEWS
FROM YOMUL_VENDORS V, YOMUL_VENDOR_REVIEWS R
WHERE V.NO = R.VENDOR_NO(+)
GROUP BY V.NO, R.VENDOR_NO
WITH READ ONLY;

-- 업체 정보 뷰 생성(업체 정보 + 소식 수 + 단골 수 + 후기 수)
CREATE NOFORCE VIEW V_Y_VENDORS
AS
SELECT V.NO, V.OWNER, V.NAME, V.CATEGORY, V.INFO, V.TEL, V.ADDR, N.NEWS, C.CUSTOMERS, R.REVIEWS
FROM YOMUL_VENDORS V, V_Y_VENDORS_NEWS N, V_Y_VENDORS_CUSTOMERS C, V_Y_VENDORS_REVIEWS R
WHERE V.NO = N.NO AND V.NO = C.NO AND V.NO = R.NO;

-- FAQ 뷰 생성(faq + 카테고리)
CREATE NOFORCE VIEW V_Y_FAQ_ARTICLES
AS
SELECT F.NO, F.WRITER, F.CATEGORY CATEGORY_NO, C.CONTENT AS CATEGORY, F.TITLE, F.CONTENT
FROM YOMUL_FAQ_ARTICLES F, YOMUL_FAQ_CATEGORIES C
WHERE F.CATEGORY = C.NO;

-- QNA 파일 수 뷰 생성
CREATE NOFORCE VIEW V_Y_QNA_FILES
AS
SELECT Q.NO, COUNT(F.ARTICLE_NO) FILES
FROM YOMUL_QNA_ARTICLES Q, YOMUL_FILES F
WHERE Q.NO = F.ARTICLE_NO(+)
GROUP BY Q.NO, F.ARTICLE_NO
WITH READ ONLY;

-- QNA 뷰 생성(qna + 카테고리 + 이미지 수)
CREATE NOFORCE VIEW V_Y_QNA_ARTICLES
AS
SELECT Q.NO, Q.NAME, Q.EMAIL, Q.PW, Q.HASHSALT, Q.WDATE, Q.CATEGORY CATEGORY_NO, C.CONTENT CATEGORY, Q.TITLE, Q.CONTENT, Q.HITS, 
	Q.RDATE, Q.RWRITER, Q.RCONTENT, Q.SECRET, F.FILES
FROM YOMUL_QNA_ARTICLES Q, YOMUL_QNA_CATEGORIES C, V_Y_QNA_FILES F
WHERE Q.CATEGORY = C.NO AND Q.NO = F.NO;

-- 뷰 생성 끝 ---------------------------------------------------------------------------------------------------------------------------------------

-- 시퀀스 생성----------------------------------------------------------------------------------------------------------------------------------
-- 회원 번호 시퀀스 생성, 1부터 시작, 1씩 증가, 메모리에 미리 올려 놓을 인덱스 개수 2
CREATE SEQUENCE YOMUL_MEMBERS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2; 

-- 물건 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_PRODUCTS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 거래 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_TRADE_HISTORY_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 채팅 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_CHATS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 동네생활 글 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_TOWN_ARTICLES_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 내 근처 게시글 시퀀스 생성
CREATE SEQUENCE YOMUL_NEAR_ARTICLES_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 업체 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_VENDORS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 업체 소식 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_VENDOR_NEWS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 업체 후기 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_VENDOR_REVIEWS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 공지사항 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_NOTICES_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- FAQ 글 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_FAQ_ARTICLES_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- QNA 글 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_QNA_ARTICLES_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;

-- 댓글 번호 시퀀스 생성, 1부터 시작, 1씩 증가 
CREATE SEQUENCE YOMUL_COMMENTS_NO_SEQ START WITH 1 INCREMENT BY 1 CACHE 2;
-- 시퀀스 생성 끝----------------------------------------------------------------------------------------------------------------------------------


-- 데이터 입력 시작----------------------------------------------------------------------------------------------------------------------------------
-- 회원 목록 조회
SELECT * FROM YOMUL_MEMBERS;

-- 이메일 중복 확인
SELECT COUNT(EMAIL) FROM YOMUL_MEMBERS WHERE LOWER(EMAIL) = LOWER('dia_changmin@naver.com');

-- 닉네임 중복 확인
SELECT COUNT(NICKNAME) FROM YOMUL_MEMBERS WHERE LOWER(NICKNAME) = LOWER('hwisaek');

-- 회원가입, 기본 비밀번호 '1234'
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE, AUTHORITY) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'admin@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '관리자', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on', 'ADMIN');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'yomul@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'yomul', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'hwisaek@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'Hwisaek', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'test@test.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'TEST', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'marin@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '해병', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'medic@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '메딕', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'ghost@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '유령', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'scv@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'SCV', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'tank@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '공성전차', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'drone@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '집게벌레', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'zergling@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '저글링', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'larva@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '라바', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'hydralisk@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '척추발사기', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'mutal@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '쓰리쿠션장인', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'probe@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '탐사정', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'zealot@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '광전사', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'dragoon@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '용기병', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'high_templar@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '고위기사', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'dark_templar@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '암흑기사', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'archon@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '집정관', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'dark_archon@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '암흑집정관', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'scout@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '정찰기', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'corsair@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '해적선', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');
INSERT INTO YOMUL_MEMBERS(NO, EMAIL, PW, NICKNAME, HASHSALT, SUBSCRIBE) VALUES('M'||YOMUL_MEMBERS_NO_SEQ.NEXTVAL, 'carrier@yomul.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', '우주모함', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 'on');

-- 로그인 
-- 프로필 정보 가져오기
SELECT NO, EMAIL, NICKNAME, PHONE, GENDER, INTRO FROM YOMUL_MEMBERS WHERE NO = 'M3'; -- 프로필 내용 가져오기
SELECT ARTICLE_NO, NO, FILENAME FROM YOMUL_FILES WHERE ARTICLE_NO = 'M3'; -- 프로필 사진 가져오기
SELECT COUNT(*) FROM YOMUL_TRADE_HISTORY WHERE SELLER = 'M3'; -- 판매 내역 수
SELECT COUNT(*) FROM YOMUL_TRADE_HISTORY WHERE BUYER = 'M3'; -- 구매 내역 수
SELECT COUNT(*) FROM YOMUL_FAVORITE_LISTS WHERE MEMBER_NO = 'M3'; -- 찜 목록 수

-- 프로필 정보 수정
UPDATE YOMUL_MEMBERS SET NICKNAME = 'Hwisaek2', PHONE = '010-1234-1234', GENDER = 'M', INTRO = '안녕하세요. 저는 Hwisaek2 입니다.' WHERE NO = 'M3'; -- 프로필 정보 수정
MERGE INTO YOMUL_FILES USING DUAL ON (ARTICLE_NO = 'M3')
			WHEN MATCHED THEN
				UPDATE SET FILENAME = '장범준.jpg' WHERE ARTICLE_NO = 'M3'
			WHEN NOT MATCHED THEN
				INSERT (ARTICLE_NO, NO, FILENAME) VALUES('M3', 0, '장범준.jpg');

-- FAQ 카테고리 데이터 생성
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(1, '운영정책');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(2, '계정');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(3, '구매/판매');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(4, '거래 매너');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(5, '이용 제재');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(6, '비즈프로필');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(7, '동네생활');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(8, '내 근처');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(9, '채팅');
INSERT INTO YOMUL_FAQ_CATEGORIES(NO, CONTENT) VALUES(10, '기타');

-- QNA 카테고리 데이터 생성
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(1, '거래 환불/분쟁 및 사기 신고');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(2, '계정 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(3, '판매 금지/거래 품목 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(4, '매너평가, 매너온도, 거래후기 관련 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(5, '게시글 노출, 미노출 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(6, '채팅, 알림 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(7, '앱 사용/거래 방법 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(8, '동네 생활(커뮤니티) 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(9, '지역 광고 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(10, '비즈프로필(등록, 이용) 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(11, '검색 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(12, '기타 문의');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(13, '오류 제보');
INSERT INTO YOMUL_QNA_CATEGORIES(NO, CONTENT) VALUES(14, '개선/제안');

-- QNA 목록 불러오기
SELECT NO, TITLE, CONTENT, TO_CHAR(WDATE, 'YYYY-MM-DD') AS WDATE, RDATE, SECRET
FROM (SELECT *
            FROM YOMUL_QNA_ARTICLES 
            ORDER BY WDATE DESC);

-- QnA 상세보기
SELECT QA.NO, NAME, QA.EMAIL, TO_CHAR(WDATE, 'YYYY-MM-DD') WDATE, CATEGORY, TITLE, CONTENT, HITS, TO_CHAR(RDATE, 'YYYY-MM-DD') RDATE, M.NICKNAME RWRITER, RCONTENT, SECRET FROM YOMUL_QNA_ARTICLES QA FULL JOIN YOMUL_MEMBERS M ON (QA.RWRITER = M.NO)  WHERE QA.NO = 'Q1';
SELECT ARTICLE_NO, NO, FILENAME FROM YOMUL_FILES WHERE ARTICLE_NO = 'Q1' ORDER BY NO;

-- QnA 비밀글 상세보기
SELECT QA.NO, NAME, QA.EMAIL, TO_CHAR(WDATE, 'YYYY-MM-DD') WDATE, CATEGORY, TITLE, CONTENT, HITS, TO_CHAR(RDATE, 'YYYY-MM-DD') RDATE, M.NICKNAME RWRITER, RCONTENT FROM YOMUL_QNA_ARTICLES QA FULL JOIN YOMUL_MEMBERS M ON (QA.RWRITER = M.NO)  WHERE QA.NO = 'Q1' AND QA.PW = 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=';
SELECT ARTICLE_NO, NO, FILENAME FROM YOMUL_FILES WHERE ARTICLE_NO = 'Q1' ORDER BY NO;

-- QnA HashSalt 가져오기
SELECT HASHSALT FROM YOMUL_QNA_ARTICLES WHERE NO = 'Q1';

-- QnA 비밀 글 비밀번호 확인
SELECT COUNT(*) FROM YOMUL_QNA_ARTICLES WHERE NO = 'Q1' AND PW ='LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=';

-- QnA 문의 내역 삭제하기
DELETE FROM YOMUL_QNA_ARTICLES WHERE NO = 'Q2' AND PW = '1234';

-- QNA 카테고리 데이터 불러오기
SELECT NO, CONTENT FROM YOMUL_QNA_CATEGORIES ORDER BY NO;

-- 다음에 작성할 문의하기 번호 가져오기
SELECT 'Q'||YOMUL_QNA_ARTICLES_NO_SEQ.NEXTVAL AS NO FROM DUAL;

-- QNA 문의하기 작성
INSERT INTO YOMUL_QNA_ARTICLES(NO, NAME, EMAIL, PW, HASHSALT, CATEGORY, TITLE, CONTENT, SECRET) VALUES('Q1', '홍길동', 'test@youml.com',  'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', 1, '문의할게 있습니다', '이게 대체 뭐여!', 'off');
INSERT INTO YOMUL_FILES (ARTICLE_NO, NO, FILENAME) VALUES('Q1', 1, '신발사진1.jpg');
INSERT INTO YOMUL_QNA_ARTICLES(NO, NAME, EMAIL, PW, HASHSALT, CATEGORY, TITLE, CONTENT, RDATE, RWRITER, RCONTENT, SECRET)  VALUES('Q2', '지나가던 사용자', 'test@test.com', 'LVQl5RjTdqE2oRywog3zjhXWnZfrI4La7JlTn7orAE4=', 'dsRPWSbFjBtmiscPw4mbph/RX9dvyI15OLs8Pq+JTKU=', '2', '문의제목', '문의내용', SYSDATE, 'M3', '답변내용입니다', 'on');

-- FAQ 데이터 생성
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 1, '제목1', '내용111');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 2, '제목2', '내용112');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 3, '제목3', '내용113');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 4, '제목4', '내용114');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 5, '제목5', '내용115');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 6, '제목6', '내용116');
INSERT INTO YOMUL_FAQ_ARTICLES(NO, WRITER, CATEGORY, TITLE, CONTENT) VALUES(YOMUL_FAQ_ARTICLES_NO_SEQ.NEXTVAL, 'M1', 7, '제목7', '내용117');

-- 공지사항 데이터 생성
INSERT INTO YOMUL_NOTICES(NO, WRITER, TITLE, CONTENT, NDATE) VALUES(CONCAT('N', YOMUL_NOTICES_NO_SEQ.NEXTVAL), 'M1', '제목1', '내용1', SYSDATE);
INSERT INTO YOMUL_NOTICES(NO, WRITER, TITLE, CONTENT, NDATE) VALUES(CONCAT('N', YOMUL_NOTICES_NO_SEQ.NEXTVAL), 'M1', '제목2', '내용2', SYSDATE);
INSERT INTO YOMUL_NOTICES(NO, WRITER, TITLE, CONTENT, NDATE) VALUES(CONCAT('N', YOMUL_NOTICES_NO_SEQ.NEXTVAL), 'M1', '제목3', '내용3', SYSDATE);
INSERT INTO YOMUL_NOTICES(NO, WRITER, TITLE, CONTENT, NDATE) VALUES(CONCAT('N', YOMUL_NOTICES_NO_SEQ.NEXTVAL), 'M1', '제목4', '내용4', SYSDATE);
INSERT INTO YOMUL_NOTICES(NO, WRITER, TITLE, CONTENT, NDATE) VALUES(CONCAT('N', YOMUL_NOTICES_NO_SEQ.NEXTVAL), 'M1', '제목5', '내용5', SYSDATE);

-- 테스트용 공지사항 파일 추가
INSERT INTO YOMUL_FILES(ARTICLE_NO, NO, FILENAME) VALUES('N1', 1, 'default.jpg');
INSERT INTO YOMUL_FILES(ARTICLE_NO, NO, FILENAME) VALUES('N1', 1, '신발사진1.jpg');

-- 공지사항 조회수 업데이트
UPDATE YOMUL_NOTICES SET HITS = HITS + 1 WHERE NO = 'N2';

-- 동네생활 글쓰기 저장
INSERT ALL
INTO YOMUL_TOWN_ARTICLES(NO,WRITER,CATEGORY,TITLE,CONTENT,HITS,TDATE) VALUES('TA'||YOMUL_TOWN_ARTICLES_NO_SEQ.NEXTVAL,'M1','우리동네질문','제목입니다','ㅈㄱㄴ',0,SYSDATE)
INTO YOMUL_FILES(ARTICLE_NO,NO,FILENAME) VALUES('TA'||YOMUL_TOWN_ARTICLES_NO_SEQ.NEXTVAL,1,'naver.png')
SELECT * FROM DUAL;

-- 업체 데이터 생성
INSERT INTO yomul_vendors(NO, OWNER, NAME, CATEGORY, info, tel, addr)
		VALUES('V'||YOMUL_VENDORS_NO_SEQ.NEXTVAL, 'M1', '요물학원', '과외/클래스', '요물학원입니다~', '010-1111-1111', '서울시 어디어디~');
INSERT INTO yomul_vendors(NO, OWNER, NAME, CATEGORY, info, tel, addr)
		VALUES('V'||YOMUL_VENDORS_NO_SEQ.NEXTVAL, 'M2', '요물학원2', '과외/클래스', '요물학원입니다~', '010-1111-1111', '서울시 어디어디~');
SELECT * FROM YOMUL_VENDORS;
-- 내 근처 게시글 생성
INSERT INTO YOMUL_NEAR_ARTICLES(NO, WRITER, TITLE, CATEGORY, PRICE, HP, CONTENT, NDATE, CHATCHECK, HITS)
VALUES(CONCAT('N', YOMUL_NEAR_ARTICLES_NO_SEQ.NEXTVAL), 'M1', '제목입니다~', '중고차', 10000, '010-1111-1111', '내용입니다~', SYSDATE, 1, 0);

-- 내 근처 게시글 상세보기
SELECT N.NO, V.NO AS VNO, V.NAME AS WRITER, N.TITLE, N.CATEGORY, N.PRICE, N.HP, N.CONTENT, N.NDATE, N.CHATCHECK, N.HITS
FROM YOMUL_NEAR_ARTICLES N, YOMUL_VENDORS V
WHERE N.WRITER = V.OWNER AND N.NO = 'N1';

-- 댓글 생성
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
values('C'||yomul_comments_no_seq.nextval,  'N1', 'M2', '댓글입니다~', sysdate);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M3', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M4', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
values('C'||yomul_comments_no_seq.nextval,  'N1', 'M5', '댓글입니다~', sysdate);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M6', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M7', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
values('C'||yomul_comments_no_seq.nextval,  'N1', 'M8', '댓글입니다~', sysdate);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
values('C'||yomul_comments_no_seq.nextval,  'N1', 'M9', '댓글입니다~', sysdate);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M10', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
VALUES('C'||yomul_comments_no_seq.nextval,  'N1', 'M11', '댓글입니다~', SYSDATE);
INSERT INTO yomul_comments(NO, article_no, writer, CONTENT, wdate)
values('C'||yomul_comments_no_seq.nextval,  'N1', 'M12', '댓글입니다~', sysdate);

-- 댓글 목록 조회
SELECT writer, CONTENT, wdate, img
FROM (SELECT ROWNUM AS rno, writer, CONTENT, wdate, img
	FROM (SELECT m.nickname AS writer, c.CONTENT, c.wdate, f.ARTICLE_NO||'_'||f.NO||'_'||f.FILENAME AS img
		FROM v_y_comments c, yomul_members m, yomul_files f
		where c.article_no = 'N1' and c.writer = m.no and m.no = f.ARTICLE_NO(+)
		ORDER BY c.NO)
	WHERE ROWNUM <= 10 * 1)
WHERE rno > 10 * (1 - 1);

-- 댓글 갯수 확인
select count(*)
FROM yomul_comments
WHERE article_no = 'N1'
GROUP BY article_no;

-- 업체 단골 등록
INSERT INTO yomul_vendor_customers(vendor_no, customer_no)
values('V1', 'M1');
INSERT INTO yomul_vendor_customers(vendor_no, customer_no)
VALUES('V1', 'M2');

-- 업체 단골 해제
DELETE FROM yomul_vendor_customers
WHERE vendor_no = 'V1' AND customer_no = 'M2';

-- 업체 단골 수 확인
SELECT count(*)
FROM yomul_vendor_customers
WHERE vendor_no = 'V1'
group by vendor_no;

-- 좋아요 추가
INSERT into yomul_likes(article_no, member_no)
values('V1', 'M2');
INSERT INTO yomul_likes(article_no, member_no)
values('C1', 'M2');

-- 좋아요 취소
DELETE FROM yomul_likes
WHERE article_no = 'V1' AND member_no = 'M2';

-- 좋아요 수 확인
select count(*)
FROM yomul_likes
WHERE article_no = 'C1'
GROUP BY article_no;

-- 신고 추가
INSERT INTO yomul_reports(article_no, MEMBER_NO)
values('C1', 'M3');
INSERT INTO yomul_reports(article_no, MEMBER_NO)
values('C1', 'M4');
INSERT INTO yomul_reports(article_no, MEMBER_NO)
values('C1', 'M5');
INSERT INTO yomul_reports(article_no, MEMBER_NO)
values('C2', 'M3');

-- 뷰로 댓글 정보 확인
select * from yomul_comments;
select * from V_Y_COMMENTS;

-- 데이터 입력 끝----------------------------------------------------------------------------------------------------------------------------------

-- 사용자 페이지 끝----------------------------------------------------------------------------------------------------------------------------------

-- 관리자 페이지 시작----------------------------------------------------------------------------------------------------------------------------------


-- 회원 검색 페이지당 10개씩
SELECT RNO, NO, EMAIL, NICKNAME, PHONE, MDATE
FROM ( SELECT ROWNUM AS RNO, M.*
            FROM ( SELECT TO_NUMBER(SUBSTR(NO, 2)) AS NO_NUM, NO, EMAIL, NICKNAME, NVL(PHONE, ' ') AS PHONE, MDATE 
                        FROM YOMUL_MEMBERS 
                        WHERE LOWER(NICKNAME) LIKE(LOWER('%hwisaek%')) OR LOWER(EMAIL) LIKE(LOWER('%HWISAEK%'))
                        ORDER BY NO_NUM DESC) M)
WHERE RNO > 10 * (1 - 1) AND RNO <= 10 * 1;

-- 검색된 회원 총 페이지 수 구하기
SELECT CEIL(COUNT(*)/10) TOTAL_PAGE FROM YOMUL_MEMBERS WHERE NICKNAME LIKE('%' || 'hwisaek' || '%') OR EMAIL LIKE('%' || 'hwisaek' || '%');

-- 회원 삭제
DELETE FROM YOMUL_MEMBERS WHERE NO = 'M24';

-- 관리자 페이지 끝----------------------------------------------------------------------------------------------------------------------------------
COMMIT;