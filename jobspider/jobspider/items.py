# Define here the models for your scraped items

from scrapy.item import Item, Field

class JobItem(Item):
    company = Field()
    companyLogo = Field()
    pubDate = Field()
    link = Field()
    city = Field()
    salary = Field()
    jobCategory = Field()
    industryCategory = Field()
    pass

class TalkItem(Item):
    title = Field()
    company = Field()
    companyLogo = Field()
    link = Field()
    dateTime = Field()
    address = Field()
    industryCategory = Field()
    applicants = Field()
    pass

