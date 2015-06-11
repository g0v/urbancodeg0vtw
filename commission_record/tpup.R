tpup<-function(){
    library(bitops)
    library(RCurl)
    library(XML)
    Sys.setlocale(category='LC_ALL', locale='C')
    
    get_url<-getURL("http://www.tupc.gov.taipei/lp.asp?CtNode=6308&CtUnit=4388&BaseDSD=7&mp=120021&nowPage=1&pagesize=200", encoding="utf-8")
    get_url_parse<-htmlParse(get_url)
        
    link <- xpathSApply(get_url_parse,"//div[@class='list']/ul/li/a",xmlAttrs)
    ##link[2,]<-iconv(link[2,],"utf-8","big5")
    
    ##link[1,]<-paste("http://www.cpami.gov.tw",link[1,],sep="")
    ##link<-data.frame(weblink=link[1,],filename=link[2,],stringsAsFactors = FALSE)
    
    ##link.list<-rbind(link.list,link)
        
    ##write.csv(link.list,"link_list.csv",row.names=FALSE)    
}