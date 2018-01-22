/*
    PL/SQL
    - Procedural Language Extensions to SQL
    - 표준 SQL : 비 절차성 언어(순서가 없고, 연속적이지 않다.)
    - 표준 SQL + 절차적 기능 추가 -> 오라클 추가 SQL -> PL/SQL
    - 추가된 부분 -> 자바의 프로그래밍 기능 추가(변수, 제어문, 메소드 등..)
    - 오라클 전용 SQL
    
    - 표준 SQL <-> PL/SQL : 자료형 호환이 된다.
    - 표준 SQL : 문장 종결자 필수 X
    - PL/SQL : 문장 종결자 필수 O
    
    SQL 처리 과정 & 순서
    1. 표준 SQL
     : 클라이언트 구문 작성(SELECT 문) -> 실행(Ctrl + Enter) -> 네트워크를 통해 SQL이 DBMS 서버에게 전달 -> 구문 분석(파싱) -> 컴파일 -> 실제 실행(CPU) -> 결과 처리
     : 위에서 실행한 동일 SQL을 다시 실행 -> 위의 과정 처음부터 끝까지 다시 반복(**)
    
    2. PL/SQL
     : 클라이언트 구문 작성(SELECT 문) -> 실행(Ctrl + Enter) -> 네트워크를 통해 SQL이 DBMS 서버에게 전달 -> 구문 분석(파싱) -> 컴파일 -> 실제 실행(CPU) -> 결과 처리
        2.a 처음 실행 : 위의 과정 처음 ~ 끝까지 실행(표준 SQL과 동일한 방식)
        2.b 이후 반복 실행 : 구문 분석(파싱) ~ 컴파일 부분이 생략
         : (저장) 프로시저 -> Stored Procedure : 자바의 메소드(함수)
         
    프로시저, Procedure
    - 메소드, 함수, 서브루틴 등..특정 목적을 가지고 모인 순서대로 실행할 명령어의 집합
    1. 익명 프로시저 -> 이름없음 -> 재호출을 목적으로 하지 않는 프로시저
    2. 익명 프로시저 -> 이름없음 -> 재호출을 목적으로 하는 프로시저
*/
set serveroutput on;

BEGIN
    dbms_output.put_line('Hello'); --syso
END;