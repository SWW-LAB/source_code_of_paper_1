import socket, time

class URJoy(object):
 
    def __init__(self, hostname, port):
        self.sock = None
        self.program = None

        with open('/home/frog/husky_ws/src/universal_robot/final/freedrive_prog') as fin:
            self.program = fin.read() 
        self.sock = socket.create_connection((hostname, port))
        self.sock.sendall(self.program)
        print 'Robot is ready.'
 
if __name__ == '__main__':
    ur_joy = URJoy("192.168.1.50", 30002)

