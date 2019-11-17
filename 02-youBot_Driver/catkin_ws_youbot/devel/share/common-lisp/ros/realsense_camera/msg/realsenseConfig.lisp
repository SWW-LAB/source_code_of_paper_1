; Auto-generated. Do not edit!


(cl:in-package realsense_camera-msg)


;//! \htmlinclude realsenseConfig.msg.html

(cl:defclass <realsenseConfig> (roslisp-msg-protocol:ros-message)
  ((depth_raw_unit
    :reader depth_raw_unit
    :initarg :depth_raw_unit
    :type cl:float
    :initform 0.0))
)

(cl:defclass realsenseConfig (<realsenseConfig>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <realsenseConfig>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'realsenseConfig)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_camera-msg:<realsenseConfig> is deprecated: use realsense_camera-msg:realsenseConfig instead.")))

(cl:ensure-generic-function 'depth_raw_unit-val :lambda-list '(m))
(cl:defmethod depth_raw_unit-val ((m <realsenseConfig>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-msg:depth_raw_unit-val is deprecated.  Use realsense_camera-msg:depth_raw_unit instead.")
  (depth_raw_unit m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <realsenseConfig>) ostream)
  "Serializes a message object of type '<realsenseConfig>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'depth_raw_unit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <realsenseConfig>) istream)
  "Deserializes a message object of type '<realsenseConfig>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_raw_unit) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<realsenseConfig>)))
  "Returns string type for a message object of type '<realsenseConfig>"
  "realsense_camera/realsenseConfig")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'realsenseConfig)))
  "Returns string type for a message object of type 'realsenseConfig"
  "realsense_camera/realsenseConfig")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<realsenseConfig>)))
  "Returns md5sum for a message object of type '<realsenseConfig>"
  "78f677fac7365df7ab1d8244f7e2fa95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'realsenseConfig)))
  "Returns md5sum for a message object of type 'realsenseConfig"
  "78f677fac7365df7ab1d8244f7e2fa95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<realsenseConfig>)))
  "Returns full string definition for message of type '<realsenseConfig>"
  (cl:format cl:nil "~%float32 depth_raw_unit~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'realsenseConfig)))
  "Returns full string definition for message of type 'realsenseConfig"
  (cl:format cl:nil "~%float32 depth_raw_unit~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <realsenseConfig>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <realsenseConfig>))
  "Converts a ROS message object to a list"
  (cl:list 'realsenseConfig
    (cl:cons ':depth_raw_unit (depth_raw_unit msg))
))
