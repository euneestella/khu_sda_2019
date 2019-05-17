## 데이터 불러오기
demog <- read.table("C:/Users/eunee/sda/data/demog.csv", sep = ",")
demog <- data.frame(t(demog))


## 데이터 정리 1
sdemog <- demog[,c("X1", "X6", "X8", "X10", "X14")]
names(sdemog) <- c("year", "cdr", "tfr", "marn", "le0")
sdemog <- sdemog[-1, ]
rownames(sdemog) <- NULL


## 데이터 정리 2
sdemog$year_n1 <- as.numeric(sdemog$year)
sdemog$year_n2 <- strtoi(sdemog$year)

sdemog$year <- as.character(sdemog$year)
sdemog$year[length(sdemog$year)] <- "2018"
sdemog$year_n3 <- strtoi(sdemog$year)

sdemog$cdr_n1 <- as.numeric(as.character(sdemog$cdr))

sdemog$marn_c <- as.character(sdemog$marn)
sdemog$marn_noc <- gsub(",","", sdemog$marn_c)
sdemog$marn_n2 <- as.numeric(sdemog$marn_noc)

sdemog$tfr_n <- as.numeric(as.character(sdemog$tfr))
sdemog$le0_n <- as.numeric(as.character(sdemog$le0))

ndemog <- sdemog[, c("year_n3", "cdr_n1", "tfr_n", "marn_n2", "le0_n")]
names(ndemog) <- c("year", "cdr", "tfr", "marn", "le0")

############################저장################################
save(ndemog, file = "C:/Users/eunee/sda/data/demog_5var.RData")
save(ndemog, file = "C:/Users/eunee/sda/data/demog_2.RData")

## 작업 공간 저장
save.image(file = "C:/Users/eunee/sda/data/demog.RData")
