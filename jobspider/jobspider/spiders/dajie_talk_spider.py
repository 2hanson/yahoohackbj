from scrapy.spider import BaseSpider
from scrapy.selector import HtmlXPathSelector

from jobspider.items import TalkItem

class DajieTalkSpider(BaseSpider):
    name = "dajie_talks"
    allowed_domains = ["dajie.com"]
    start_urls = [
            "http://campus.dajie.com/talk/talklist?page=%d" % (index+1) for index in xrange(24)
    ]

    def parse(self, response):
        hxs = HtmlXPathSelector(response)
        talks = hxs.select('//ul/li')
        items = []
        for talk in talks:
            item = TalkItem()
            item['title'] = talk.select('div[@class="c_info clearfix"]/h3/a/text()').extract()
            item['link'] = talk.select('div[@class="c_info clearfix"]/h3/a/@href').extract()
            item['companyLogo'] = talk.select('div[@class="c_logo first"]/a/img/@src').extract()
            moreinfos = talk.select('div[@class="c_info clearfix"]/p')
            for index, info in enumerate(moreinfos):
                if (index == 0):
                    item['dateTime'] = info.select('span/text()').extract()
                if (index == 1):
                    item['address'] = info.select('span/text()').extract()
            items.append(item)
        return items

