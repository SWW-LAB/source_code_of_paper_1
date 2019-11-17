import socket
import sys
import time

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('192.168.1.50', 29999)
sock.connect(server_address)

#off-idle-running
try:    
    data = sock.recv(128)

    sock.sendall('robotmode\n')
    data = sock.recv(128)
    if 'POWER_OFF' in data:
        sock.sendall('power on\n')
        state = sock.recv(128)
        print state

    time.sleep(6)
    sock.sendall('robotmode\n')
    data = sock.recv(128)
    if 'IDLE' in data:
        sock.sendall('brake release\n')
        state = sock.recv(128)
        print state

    time.sleep(5)
    sock.sendall('robotmode\n')
    data = sock.recv(128)
    if 'RUNNING' in data:
        print 'Robot is ready.'

finally:
    sock.close()
