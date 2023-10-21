import socket
from time import sleep

IP_SELF = '127.0.0.1'
PORT_SEND = 5201
KEEP_ALIVE = 1

if __name__ == '__main__':
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    count_iaf = 10
    while True:
        print(count_iaf)
        count_iaf = count_iaf + 1
        sock.sendto(bytes(str(count_iaf), "utf-8"), (IP_SELF, PORT_SEND))
        sleep(KEEP_ALIVE)