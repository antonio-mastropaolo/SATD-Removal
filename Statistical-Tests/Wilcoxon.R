library(effsize)

data<-read.csv("data/All-Models-CB.csv",header=TRUE)



#############################################################
res=list(Wilcoxon.p=c())
res$Wilcoxon.p=c(wilcox.test(data$no_pt,data$canonical,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(data$no_pt,data$canonical)
res=data.frame(res)
print(res)
##############################################################

##############################################################
res=list(Wilcoxon.p=c())
res$Wilcoxon.p=c(wilcox.test(data$canonical,data$domain,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(data$canonical,data$domain)
res=data.frame(res)
print(res)
#############################################################

##############################################################
res=list(Wilcoxon.p=c())
res$Wilcoxon.p=c(wilcox.test(data$ablation,data$domain,alternative="two.side",paired=TRUE)$p.value)
cliff.delta(data$ablation,data$domain)
res=data.frame(res)
print(res)
#############################################################


res=list(Wilcoxon.p=c(), Wilcoxon.estimate=c())

res$Wilcoxon.p=(wilcox.test(data$v1,data$domain,alternative="two.side",paired=TRUE)$p.value)
res$Wilcoxon.p=append(res$Wilcoxon.p, wilcox.test(data$v2,data$domain,alternative="two.side",paired=TRUE)$p.value)
res$Wilcoxon.p=append(res$Wilcoxon.p, wilcox.test(data$v3,data$domain,alternative="two.side",paired=TRUE)$p.value)


res$Wilcoxon.estimate=append(res$Wilcoxon.estimate, cliff.delta(data$v1,data$domain)$estimate)
res$Wilcoxon.estimate=append(res$Wilcoxon.estimate, cliff.delta(data$v2,data$domain)$estimate)
res$Wilcoxon.estimate=append(res$Wilcoxon.estimate, cliff.delta(data$v3,data$domain)$estimate)


res=data.frame(res)
res$Wilcoxon.p=p.adjust(res$Wilcoxon.p, method="holm")
print(res)

# #############################################################

