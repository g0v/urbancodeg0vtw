tpup<-function(){
    library(bitops)
    library(RCurl)
    library(XML)
    Sys.setlocale(category='LC_ALL', locale='C')
    
    get_url<-getURL("http://www.tupc.gov.taipei/lp.asp?CtNode=6308&CtUnit=4388&BaseDSD=7&mp=120021&nowPage=1&pagesize=200", encoding="utf-8")
    get_url_parse<-htmlParse(get_url, encoding="utf-8")
        
    link <- xpathSApply(get_url_parse,"//div[@class='list']/ul/li/a",xmlAttrs)
    link<-data.frame(weblink=link[1,],filename=link[2,],stringsAsFactors = FALSE)
    
    for(i in 1:nrow(link)){
        link[i,1]<-paste("http://www.tupc.gov.taipei/",link[i,1])
        
        txt<-link[i,2]
        txt<-gsub(">","",gsub("<","%",txt))
        txt<-iconv(URLdecode(txt),"utf-8","big5")
        link[i,2]<-txt            
    }
    
    write.csv(link,"tp_web_list.csv",row.names=FALSE)
}