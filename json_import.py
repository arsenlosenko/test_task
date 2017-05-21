import subprocess
import json

with open('country-codes.json') as data_file:
    data = json.load(data_file)

for item in data:
    print('{}\n{}\n{}\n{}\n{}\n{}\n'.format(item["ISO3166-1-Alpha-2"],
                                        item["ISO4217-currency_country_name"],
                                        item["name"],
                                        item["ISO3166-1-Alpha-3"],
                                        item["M49"],
                                        item["Dial"]))
    subprocess.call(['psql', 'application', '-c', "insert into country (iso, name, nicename, iso3, numcode, phonecode) values ('{}','{}','{}','{}','{}','{}')".format(item["ISO3166-1-Alpha-2"],
                                                                                                                                                                        item["ISO4217-currency_country_name"],
                                                                                                                                                                        item["name"],
                                                                                                                                                                        item["ISO3166-1-Alpha-3"],
                                                                                                                                                                        item["ISO4217-currency_numeric_code"],
                                                                                                                                                                        item["Dial"])])
                                                                                                                            