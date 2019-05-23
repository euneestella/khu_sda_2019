satis <- read.csv("http://kpc.khu.ac.kr/sda_2019/satis.csv")
set.seed(100)
satis$sat_spo_jit <- satis$sat_spo+rnorm(length(satis$sat_spo))
attach(satis)

## 회귀 곡선
fit1 <- lm(sat_spo_jit ~ h_sat_spo)

## loess 곡선
scatter.smooth(h_sat_spo, sat_spo_jit, lpars = list(lty=2), xlab = "아내에 대한 만족도", ylab = "남편에 대한 만족도")
abline(fit1, lty = 3)
legend(0, 6.5, pch = c(1, NA, NA), lty = c(NA, 2:3), c("observed", "loess line", "regression line"), bty = "n")
