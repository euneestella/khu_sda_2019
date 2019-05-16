install.packages("gplots")
library(gplots) ## 탐색 경로에 패키지를 attach

setwd("C:/Users/eunee/sda/data")
load("demog_5var.RData")

ndemog$year_c <- floor(ndemog$year/10)-197
ndemog$tfr_c <- cut(ndemog$tfr, breaks = c(-Inf, 1.3, 2.1, Inf), labels = c("llf", "repl", "high"))
attach(ndemog)

plotmeans(tfr ~ rep(1, length(tfr))) ## 평균과 신뢰구간 그림
t.test(tfr)
plotmeans(tfr ~ rep(1, length(tfr)), xlab = "TFRs", ylab = "Mean and 95% CI", barcol = 1, n.label = FALSE, legends = "")

## 조사망률의 범주화
cdr_c <- cut(cdr, breaks = c(-Inf, 6, 7, Inf), labels = c("LT6", "6-LT7", "EToMT7"))
plotmeans(tfr ~ cdr_c)

## 변수의 값이 다른 변수의 값에 따라 변할 때, 함수의 값을 보여라 : tapply 이용
tapply(tfr, cdr_c, t.test) ## cdr_c에 따라 tfr이 변할 때 t.test 값이 어떻게 달라지는가?
plotmeans(tfr ~ cdr_c, xlab = "TFRs", ylab = "Mean and 95% CI", barcol = 1, barwidth = 2, n.label = FALSE, connect = FALSE, legends = "")
lines(c(0.97, 1.03), c(1.303, 1.303), lwd = 2) ## 하한
lines(c(0.97, 1.03), c(1.459, 1.459), lwd = 2) ## 상한
lines(c(1,1), c(1.303, 1.459), lwd = 2) ## 둘의 연결

## 세 집단 간 평균 비교
summary(aov(tfr ~ cdr_c)) ## 영가설 기각 
dev.off()
