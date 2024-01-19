import socket
from time import sleep

IP_SELF = '127.0.0.1'
PORT_SEND = 5201
KEEP_ALIVE = 1
M_SIZE = 1024

if __name__ == '__main__':
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind((IP_SELF, PORT_SEND))
    while True:
        message, cli_addr = sock.recvfrom(M_SIZE)
        message = message.decode(encoding='utf-8')
        print(f'Received message is [{message}]')
        sleep(KEEP_ALIVE)