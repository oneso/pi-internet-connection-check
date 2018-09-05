import urllib2, time, os

def internet_on():
    try:
        urllib2.urlopen('http://172.217.22.14', timeout=1)
        return True
    except urllib2.URLError as err: 
        return False

while internet_on():
    time.sleep(15)

print "Internet Down Alert! Rebooting..."

os.system("reboot")