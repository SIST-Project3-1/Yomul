-- 테이블 초기화
DROP TABLE YOMUL_FILE CASCADE CONSTRAINTS;
DROP SEQUENCE YOMUL_FILE_FILENO_SEQ;

-- 업로드 된 파일 테이블. 실제로 저장된 파일 명은 ('파일 번호'_'파일 명') 식으로 저장
CREATE TABLE YOMUL_FILE(
    FILENO NUMBER(10), -- 파일 번호
    FILENAME VARCHAR2(100), -- 파일 명
    ARTICLENO VARCHAR2(10) -- 작성된 게시글 번호
);

-- 회원 번호 시퀀스 생성
CREATE SEQUENCE YOMUL_FILE_FILENO_SEQ
START WITH 1 -- 1부터 시작
INCREMENT BY 1 -- 1씩 증가
CACHE 2; -- 메모리에 미리 올려 놓을 인덱스 개수. 비정상 종료되면 LAST_NUMBER가 2씩 증가
