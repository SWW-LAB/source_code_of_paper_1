; Auto-generated. Do not edit!


(cl:in-package ik-srv)


;//! \htmlinclude ik_-request.msg.html

(cl:defclass <ik_-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (jointvalue
    :reader jointvalue
    :initarg :jointvalue
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass ik_-request (<ik_-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ik_-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ik_-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ik-srv:<ik_-request> is deprecated: use ik-srv:ik_-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <ik_-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ik-srv:pose-val is deprecated.  Use ik-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'jointvalue-val :lambda-list '(m))
(cl:defmethod jointvalue-val ((m <ik_-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ik-srv:jointvalue-val is deprecated.  Use ik-srv:jointvalue instead.")
  (jointvalue m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ik_-request>) ostream)
  "Serializes a message object of type '<ik_-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'jointvalue))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'jointvalue))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ik_-request>) istream)
  "Deserializes a message object of type '<ik_-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'jointvalue) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'jointvalue)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ik_-request>)))
  "Returns string type for a service object of type '<ik_-request>"
  "ik/ik_Request")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ik_-request)))
  "Returns string type for a service object of type 'ik_-request"
  "ik/ik_Request")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ik_-request>)))
  "Returns md5sum for a message object of type '<ik_-request>"
  "1759521e875316328da2b75f3047f9a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ik_-request)))
  "Returns md5sum for a message object of type 'ik_-request"
  "1759521e875316328da2b75f3047f9a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ik_-request>)))
  "Returns full string definition for message of type '<ik_-request>"
  (cl:format cl:nil "~%geometry_msgs/Pose pose~%~%float64[] jointvalue~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ik_-request)))
  "Returns full string definition for message of type 'ik_-request"
  (cl:format cl:nil "~%geometry_msgs/Pose pose~%~%float64[] jointvalue~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ik_-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'jointvalue) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ik_-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ik_-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':jointvalue (jointvalue msg))
))
;//! \htmlinclude ik_-response.msg.html

(cl:defclass <ik_-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass ik_-response (<ik_-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ik_-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ik_-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ik-srv:<ik_-response> is deprecated: use ik-srv:ik_-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ik_-response>) ostream)
  "Serializes a message object of type '<ik_-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ik_-response>) istream)
  "Deserializes a message object of type '<ik_-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ik_-response>)))
  "Returns string type for a service object of type '<ik_-response>"
  "ik/ik_Response")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ik_-response)))
  "Returns string type for a service object of type 'ik_-response"
  "ik/ik_Response")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ik_-response>)))
  "Returns md5sum for a message object of type '<ik_-response>"
  "1759521e875316328da2b75f3047f9a8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ik_-response)))
  "Returns md5sum for a message object of type 'ik_-response"
  "1759521e875316328da2b75f3047f9a8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ik_-response>)))
  "Returns full string definition for message of type '<ik_-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ik_-response)))
  "Returns full string definition for message of type 'ik_-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ik_-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ik_-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ik_-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ik_)))
  'ik_-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ik_)))
  'ik_-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ik_)))
  "Returns string type for a service object of type '<ik_>"
  "ik/ik_")