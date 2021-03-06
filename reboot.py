import socket, time, os

def internet(host="8.8.8.8", port=53, timeout=3):
    try:
        socket.setdefaulttimeout(timeout)
        socket.socket(socket.AF_INET, socket.SOCK_STREAM).connect((host, port))
        return True
    except Exception as ex:
        print ex.message
        return False

time.sleep(20)

while internet():
    time.sleep(15)

print "Internet Down Alert! Rebooting..."

os.system("sudo shutdown -r now")