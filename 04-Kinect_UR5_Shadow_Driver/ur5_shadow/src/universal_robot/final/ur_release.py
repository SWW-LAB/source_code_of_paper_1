import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('192.168.1.50', 29999)
sock.connect(server_address)

#off-idle-running
try:    
    data = sock.recv(128)

    sock.sendall('safetymode\n')
    data = sock.recv(128)
    if 'PROTECTIVE_STOP' in data:
        sock.sendall('unlock protective stop\n')
        state = sock.recv(128)
        print state
finally:
    sock.close()
