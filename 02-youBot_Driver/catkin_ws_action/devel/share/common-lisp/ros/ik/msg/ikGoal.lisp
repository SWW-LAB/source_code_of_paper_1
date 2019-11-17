; Auto-generated. Do not edit!


(cl:in-package ik-msg)


;//! \htmlinclude ikGoal.msg.html

(cl:defclass <ikGoal> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass ikGoal (<ikGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ikGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ikGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ik-msg:<ikGoal> is deprecated: use ik-msg:ikGoal instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <ikGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ik-msg:pose-val is deprecated.  Use ik-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ikGoal>) ostream)
  "Serializes a message object of type '<ikGoal>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ikGoal>) istream)
  "Deserializes a message object of type '<ikGoal>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ikGoal>)))
  "Returns string type for a message object of type '<ikGoal>"
  "ik/ikGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ikGoal)))
  "Returns string type for a message object of type 'ikGoal"
  "ik/ikGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ikGoal>)))
  "Returns md5sum for a message object of type '<ikGoal>"
  "f192399f711a48924df9a394d37edd67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ikGoal)))
  "Returns md5sum for a message object of type 'ikGoal"
  "f192399f711a48924df9a394d37edd67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ikGoal>)))
  "Returns full string definition for message of type '<ikGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ikGoal)))
  "Returns full string definition for message of type 'ikGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ikGoal>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ikGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'ikGoal
    (cl:cons ':pose (pose msg))
))
