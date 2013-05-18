from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector

from jobspider.items import JobItem

class dajieJobSpider(BaseSpider):
    name = "dajie_jobs"
    allowed_domains = ["dajie.com"]
    start_urls = [
    ]

    index = 0
    while index <= 20:
        index += 1
        #c++
        start_urls.append("http://job.dajie.com/search/result?keyword=C++%20%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        #JAVA
        start_urls.append("http://job.dajie.com/search/result?keyword=JAVA%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        #php
        start_urls.append("http://job.dajie.com/search/result?keyword=PHP%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        #ios
        start_urls.append("http://job.dajie.com/search/result?keyword=ios%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        start_urls.append("http://job.dajie.com/search/result?keyword=%E6%B5%8B%E8%AF%95%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        start_urls.append("http://job.dajie.com/search/result?keyword=%E5%89%8D%E7%AB%AF%E5%B7%A5%E7%A8%8B%E5%B8%88" + "&page=" + str(index))
        #jingrong kuaiji
        start_urls.append("http://job.dajie.com/search/result?keyword=%E4%BC%9A%E8%AE%A1" + "&page=" + str(index))
        #jingrong chunan
        start_urls.append("http://job.dajie.com/search/result?keyword=%E5%87%BA%E7%BA%B3" + "&page=" + str(index))
        #falv lushi
        start_urls.append("http://job.dajie.com/search/result?keyword=%E5%BE%8B%E5%B8%88" + "&page=" + str(index))
        #falv zhuanli daili
        start_urls.append("http://job.dajie.com/search/result?keyword=%E4%B8%93%E5%88%A9%E4%BB%A3%E7%90%86" + "&page=" + str(index))

    def parse(self, response):
        hxs = HtmlXPathSelector(response)
        jobs = hxs.select('//ul[@class="job-suggest-list"]/li')
        items = []
        for job in jobs:
            item = JobItem()
            item['company'] = job.select('div[@class="search-list-con"]/a[@class="search-company"]/text()').extract()
            item['companyLogo'] = job.select('a[@class="search-company-pic"]/img/@src').extract()
            item['link'] = job.select('div[@class="search-list-con"]/div[@class="jst-title-wrap"]/h3/a/@href').extract()
            item['pubDate'] = job.select('div[@class="search-list-con"]/div[@class="jst-title-wrap"]/span[@class="update-time"]/text()').extract()
            moreinfos = job.select('div[@class="search-list-con"]/p[@class="search-more-info"]/span')
            for index, info in enumerate(moreinfos):
                if (index == 0):
                    item['city'] = info.select('text()').extract()
                if (index == 1):
                    item['salary'] = info.select('text()').extract()
                if (index == 2):
                    item['jobCategory'] = info.select('text()').extract()
                if (index == 3):
                    item['industryCategory'] = info.select('text()').extract()
            items.append(item)
        return items

