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
    if 'RUNNING' in data:
        sock.sendall('get loaded program\n')
        state = sock.recv(128)
        if not 'freedrive' in state:
            sock.sendall('load freedrive.urp\n')
            state = sock.recv(128)
            print state
        else:
            print 'freedrive was already loaded'
        time.sleep(3)
        sock.sendall('play\n')
        state = sock.recv(128)
        print state
        raw_input("Hit <Enter> to end freedrive.")
        sock.sendall('stop\n')
        state = sock.recv(128)
        print state
finally:
    sock.close()
