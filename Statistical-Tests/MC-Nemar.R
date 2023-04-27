library(exact2x2)
library(effsize)
library(xtable)

#################################################################################################
res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())
d<-"data/perfect.csv"
t<-read.csv(d)


# res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())

# m=mcnemar.exact(t$perfect_no_pretraining,t$perfect_canonical_ft)
# res$Dataset=c(res$Dataset,as.character(d))
# res$McNemar.p=c(res$McNemar.p, m$p.value)
# res$McNemar.OR=c(res$McNemar.OR,m$estimate)

# res=data.frame(res)
# print(res)


res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())

m=mcnemar.exact(t$canonical,t$domain)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

res=data.frame(res)
print(res)

res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())

m=mcnemar.exact(t$ablation,t$domain)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

res=data.frame(res)
print(res)

res=list(Dataset=c(),McNemar.p=c(),McNemar.OR=c())

m=mcnemar.exact(t$v1,t$domain)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

m=mcnemar.exact(t$v2,t$domain)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)

m=mcnemar.exact(t$v3,t$domain)
res$Dataset=c(res$Dataset,as.character(d))
res$McNemar.p=c(res$McNemar.p, m$p.value)
res$McNemar.OR=c(res$McNemar.OR,m$estimate)


res=data.frame(res)
#p-value adjustment
res$McNemar.p=p.adjust(res$McNemar.p,method="holm")
print(res)
