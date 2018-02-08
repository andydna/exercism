import datetime

def add_gigasecond(birth_date):
    if birth_date.hour == 0:
        birth_date = birth_date + datetime.timedelta(0,60*60)
    x = birth_date.timestamp()
    x = birth_date.timestamp() + 10**9
    return datetime.datetime.fromtimestamp(x)
