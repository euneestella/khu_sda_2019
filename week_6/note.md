두 집단 간 평균 비교를 할 때, 예를 들어 t.test(tfr~cdr_c) 처럼 사용할 수 있을까?
(여기서 cdr_c는 세 개의 범주로 이루어져 있다.)

에러 메시지가 출력된다. 반면에 tapply(tfr ~ cdr_c, t.test)는 결과를 출력한다.
tapply는 각 범주 별로 함수를 적용하는 명령어기 때문이다.
