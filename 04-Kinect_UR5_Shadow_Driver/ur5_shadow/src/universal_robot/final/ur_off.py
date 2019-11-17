import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('192.168.1.50', 29999)
sock.connect(server_address)

#off-idle-running
try:    
    data = sock.recv(128)

    sock.sendall('robotmode\n')
    data = sock.recv(128)
    if 'RUNNING' in data:
        sock.sendall('shutdown\n')
        state = sock.recv(128)
        print state
finally:
    sock.close()
