import subprocess
import json

with open('/home/test_task/country_codes.json', encoding='utf-8') as data_file:
    data = json.load(data_file)

for item in data:
    try:
            subprocess.call(['psql', 'application', '-c', "insert into country (iso, name, nicename, iso3, numcode, phonecode) values ('{}','{}','{}','{}','{}','{}')".format(item["ISO3166-1-Alpha-2"],
                                                                                                                                                                        item["ISO4217-currency_country_name"],
                                                                                                                                                                        item["name"],
                                                                                                                                                                        item["ISO3166-1-Alpha-3"],
                                                                                                                                                                        item["ISO4217-currency_numeric_code"],
                                                                                                                                                                        item["Dial"])])
    except:
        pass                                                                                                                    
