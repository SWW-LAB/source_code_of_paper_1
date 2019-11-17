import socket
import sys
import time

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('192.168.1.50', 29999)
sock.connect(server_address)

#off-idle-running
try:    
    data = sock.recv(128)
    print data

    sock.sendall('robotmode\n')
    data = sock.recv(128)
    print data
 
finally:
    sock.close()
