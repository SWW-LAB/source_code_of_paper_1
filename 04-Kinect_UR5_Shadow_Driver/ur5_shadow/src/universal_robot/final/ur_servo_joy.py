import rospy
from sensor_msgs.msg import Joy
from robotiq_85_msgs.msg import GripperCmd
import time, sys, threading, math
import socket, select
import struct
import SocketServer

MSG_OUT = 1
MSG_SPEEDL = 2
MULT_jointstate = 10000.0
MULT_time = 1000000.0  
xd = [0.0]*6 

class TCPHandler(SocketServer.BaseRequestHandler):

    def recv_more(self):
        while True:
            r, _, _ = select.select([self.request], [], [], 0.2)
            if r:
                more = self.request.recv(4096)
                if not more:
                    print "EOF on recv"
                return more

    def handle(self):
        self.update_timer = rospy.Timer(rospy.Duration(0.04), self.update)
        self.socket_lock = threading.Lock()
        print "Handling a request"
        try:
            buf = self.recv_more()
            if not buf: return

            while True:
                mtype = struct.unpack_from("!i", buf, 0)[0]
                buf = buf[4:]
                if mtype == MSG_OUT:
                    i = buf.find("~")
                    while i < 0:
                        buf = buf + self.recv_more()
                        i = buf.find("~")
                    s, buf = buf[:i], buf[i+1:]
                    rospy.loginfo("Out: %s" % s)
                if not buf:
                    buf = buf + self.recv_more()
        except Exception, ex:
            print "Connection closed (command):", ex

    def update(self, event):        
        global xd    
        print xd
        self.send_speedl(888, xd, 0.032)

    def send_speedl(self, wp_id, q_actual, t):
        params = [MSG_SPEEDL, wp_id] + \
                 [MULT_jointstate * qq for qq in q_actual] + \
                 [MULT_time * t]
        buf = struct.pack("!%ii" % len(params), *params)
        with self.socket_lock:
            self.request.send(buf)

class URJoy(object):
 
    def __init__(self, hostname, port):
        self.sock = None
        self.program = None
        rospy.init_node('ur_joy')
        self.gripper_pub = rospy.Publisher('/gripper/cmd', GripperCmd, queue_size=1)

        self.gripper_cmd = GripperCmd()
        self.gripper_cmd.position = 0.085
        self.gripper_cmd.speed = 0.02
        self.gripper_cmd.force = 10.0
        rospy.sleep(0.5)
        self.gripper_pub.publish(self.gripper_cmd)
        rospy.sleep(2)

        rospy.Subscriber('/joy', Joy, self.joyCB)

        self.server = SocketServer.TCPServer(("", 50000), TCPHandler)
        self.server.allow_reuse_address = True
        self.server.timeout = 5
        self.thread_commander = threading.Thread(name="TCPHandler", target=self.server.serve_forever)
        self.thread_commander.daemon = True
        self.thread_commander.start()

        with open('/home/frog/Desktop/ur_joy/final/joy_servo_prog') as fin:
            self.program = fin.read() 
        self.sock = socket.create_connection((hostname, port))
        self.sock.sendall(self.program)
        print 'Robot is ready.'

    def joyCB(self, msg):
        kp = 0.005
        global xd

        xd[0] = msg.axes[3]*kp
        xd[1] = msg.axes[4]*kp

        if (-1 <= msg.axes[2] < 1.0 and msg.axes[5] == 1.0):
            xd[2] = (1.0 - msg.axes[2])*kp
        elif (msg.axes[2] == 1.0 and -1 <= msg.axes[5] < 1.0):
            xd[2] = (msg.axes[5] - 1.0)*kp
        else:
            xd[2] = 0

        xd[3] = msg.axes[6]*kp*3
        xd[4] = msg.axes[7]*kp*3

        if (msg.buttons[4] == 1 and msg.buttons[5] == 0):
            xd[5] = msg.buttons[4]*kp*5
        elif (msg.buttons[4] == 0 and msg.buttons[5] == 1):
            xd[5] = -msg.buttons[5]*kp*5
        else:
            xd[5] = 0

        #if msg.buttons[3] == 1:
            #xd = [0.0]*6

        #open
        if msg.buttons[1] == 1 and msg.buttons[3] == 0:
            if self.gripper_cmd.position < 0.085:
                self.gripper_cmd.position += 0.005
            else: 
                print 'max open'
                self.gripper_cmd.position = 0.085
        #close
        elif msg.buttons[3] == 1 and msg.buttons[1] == 0:
            if self.gripper_cmd.position > 0.0:
                self.gripper_cmd.position -= 0.005
            else:
                print 'min close'
                self.gripper_cmd.position = 0.0
        #print self.gripper_cmd.position
        self.gripper_pub.publish(self.gripper_cmd)


if __name__ == '__main__':
    ur_joy = URJoy("192.168.1.50", 30002)
    rospy.spin()
