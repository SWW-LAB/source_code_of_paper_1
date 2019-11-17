; Auto-generated. Do not edit!


(cl:in-package realsense_camera-srv)


;//! \htmlinclude get_rgb_uv-request.msg.html

(cl:defclass <get_rgb_uv-request> (roslisp-msg-protocol:ros-message)
  ((x_min_depth
    :reader x_min_depth
    :initarg :x_min_depth
    :type cl:integer
    :initform 0)
   (x_min_xy
    :reader x_min_xy
    :initarg :x_min_xy
    :type cl:integer
    :initform 0)
   (y_min_depth
    :reader y_min_depth
    :initarg :y_min_depth
    :type cl:integer
    :initform 0)
   (y_min_xy
    :reader y_min_xy
    :initarg :y_min_xy
    :type cl:integer
    :initform 0)
   (x_max_depth
    :reader x_max_depth
    :initarg :x_max_depth
    :type cl:integer
    :initform 0)
   (x_max_xy
    :reader x_max_xy
    :initarg :x_max_xy
    :type cl:integer
    :initform 0)
   (y_max_depth
    :reader y_max_depth
    :initarg :y_max_depth
    :type cl:integer
    :initform 0)
   (y_max_xy
    :reader y_max_xy
    :initarg :y_max_xy
    :type cl:integer
    :initform 0))
)

(cl:defclass get_rgb_uv-request (<get_rgb_uv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_rgb_uv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_rgb_uv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_camera-srv:<get_rgb_uv-request> is deprecated: use realsense_camera-srv:get_rgb_uv-request instead.")))

(cl:ensure-generic-function 'x_min_depth-val :lambda-list '(m))
(cl:defmethod x_min_depth-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_min_depth-val is deprecated.  Use realsense_camera-srv:x_min_depth instead.")
  (x_min_depth m))

(cl:ensure-generic-function 'x_min_xy-val :lambda-list '(m))
(cl:defmethod x_min_xy-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_min_xy-val is deprecated.  Use realsense_camera-srv:x_min_xy instead.")
  (x_min_xy m))

(cl:ensure-generic-function 'y_min_depth-val :lambda-list '(m))
(cl:defmethod y_min_depth-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_min_depth-val is deprecated.  Use realsense_camera-srv:y_min_depth instead.")
  (y_min_depth m))

(cl:ensure-generic-function 'y_min_xy-val :lambda-list '(m))
(cl:defmethod y_min_xy-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_min_xy-val is deprecated.  Use realsense_camera-srv:y_min_xy instead.")
  (y_min_xy m))

(cl:ensure-generic-function 'x_max_depth-val :lambda-list '(m))
(cl:defmethod x_max_depth-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_max_depth-val is deprecated.  Use realsense_camera-srv:x_max_depth instead.")
  (x_max_depth m))

(cl:ensure-generic-function 'x_max_xy-val :lambda-list '(m))
(cl:defmethod x_max_xy-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_max_xy-val is deprecated.  Use realsense_camera-srv:x_max_xy instead.")
  (x_max_xy m))

(cl:ensure-generic-function 'y_max_depth-val :lambda-list '(m))
(cl:defmethod y_max_depth-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_max_depth-val is deprecated.  Use realsense_camera-srv:y_max_depth instead.")
  (y_max_depth m))

(cl:ensure-generic-function 'y_max_xy-val :lambda-list '(m))
(cl:defmethod y_max_xy-val ((m <get_rgb_uv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_max_xy-val is deprecated.  Use realsense_camera-srv:y_max_xy instead.")
  (y_max_xy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_rgb_uv-request>) ostream)
  "Serializes a message object of type '<get_rgb_uv-request>"
  (cl:let* ((signed (cl:slot-value msg 'x_min_depth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_min_xy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_min_depth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_min_xy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_max_depth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_max_xy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_max_depth)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_max_xy)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_rgb_uv-request>) istream)
  "Deserializes a message object of type '<get_rgb_uv-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_min_depth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_min_xy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_min_depth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_min_xy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_max_depth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_max_xy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_max_depth) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_max_xy) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_rgb_uv-request>)))
  "Returns string type for a service object of type '<get_rgb_uv-request>"
  "realsense_camera/get_rgb_uvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_rgb_uv-request)))
  "Returns string type for a service object of type 'get_rgb_uv-request"
  "realsense_camera/get_rgb_uvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_rgb_uv-request>)))
  "Returns md5sum for a message object of type '<get_rgb_uv-request>"
  "0eb5e9c6325d1b134d64fc42997917cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_rgb_uv-request)))
  "Returns md5sum for a message object of type 'get_rgb_uv-request"
  "0eb5e9c6325d1b134d64fc42997917cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_rgb_uv-request>)))
  "Returns full string definition for message of type '<get_rgb_uv-request>"
  (cl:format cl:nil "int32 x_min_depth~%int32 x_min_xy~%int32 y_min_depth~%int32 y_min_xy~%int32 x_max_depth~%int32 x_max_xy~%int32 y_max_depth~%int32 y_max_xy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_rgb_uv-request)))
  "Returns full string definition for message of type 'get_rgb_uv-request"
  (cl:format cl:nil "int32 x_min_depth~%int32 x_min_xy~%int32 y_min_depth~%int32 y_min_xy~%int32 x_max_depth~%int32 x_max_xy~%int32 y_max_depth~%int32 y_max_xy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_rgb_uv-request>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_rgb_uv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'get_rgb_uv-request
    (cl:cons ':x_min_depth (x_min_depth msg))
    (cl:cons ':x_min_xy (x_min_xy msg))
    (cl:cons ':y_min_depth (y_min_depth msg))
    (cl:cons ':y_min_xy (y_min_xy msg))
    (cl:cons ':x_max_depth (x_max_depth msg))
    (cl:cons ':x_max_xy (x_max_xy msg))
    (cl:cons ':y_max_depth (y_max_depth msg))
    (cl:cons ':y_max_xy (y_max_xy msg))
))
;//! \htmlinclude get_rgb_uv-response.msg.html

(cl:defclass <get_rgb_uv-response> (roslisp-msg-protocol:ros-message)
  ((x_min_uv
    :reader x_min_uv
    :initarg :x_min_uv
    :type cl:integer
    :initform 0)
   (y_min_uv
    :reader y_min_uv
    :initarg :y_min_uv
    :type cl:integer
    :initform 0)
   (x_max_uv
    :reader x_max_uv
    :initarg :x_max_uv
    :type cl:integer
    :initform 0)
   (y_max_uv
    :reader y_max_uv
    :initarg :y_max_uv
    :type cl:integer
    :initform 0))
)

(cl:defclass get_rgb_uv-response (<get_rgb_uv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_rgb_uv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_rgb_uv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_camera-srv:<get_rgb_uv-response> is deprecated: use realsense_camera-srv:get_rgb_uv-response instead.")))

(cl:ensure-generic-function 'x_min_uv-val :lambda-list '(m))
(cl:defmethod x_min_uv-val ((m <get_rgb_uv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_min_uv-val is deprecated.  Use realsense_camera-srv:x_min_uv instead.")
  (x_min_uv m))

(cl:ensure-generic-function 'y_min_uv-val :lambda-list '(m))
(cl:defmethod y_min_uv-val ((m <get_rgb_uv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_min_uv-val is deprecated.  Use realsense_camera-srv:y_min_uv instead.")
  (y_min_uv m))

(cl:ensure-generic-function 'x_max_uv-val :lambda-list '(m))
(cl:defmethod x_max_uv-val ((m <get_rgb_uv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:x_max_uv-val is deprecated.  Use realsense_camera-srv:x_max_uv instead.")
  (x_max_uv m))

(cl:ensure-generic-function 'y_max_uv-val :lambda-list '(m))
(cl:defmethod y_max_uv-val ((m <get_rgb_uv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_camera-srv:y_max_uv-val is deprecated.  Use realsense_camera-srv:y_max_uv instead.")
  (y_max_uv m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_rgb_uv-response>) ostream)
  "Serializes a message object of type '<get_rgb_uv-response>"
  (cl:let* ((signed (cl:slot-value msg 'x_min_uv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_min_uv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'x_max_uv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'y_max_uv)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_rgb_uv-response>) istream)
  "Deserializes a message object of type '<get_rgb_uv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_min_uv) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_min_uv) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_max_uv) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_max_uv) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_rgb_uv-response>)))
  "Returns string type for a service object of type '<get_rgb_uv-response>"
  "realsense_camera/get_rgb_uvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_rgb_uv-response)))
  "Returns string type for a service object of type 'get_rgb_uv-response"
  "realsense_camera/get_rgb_uvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_rgb_uv-response>)))
  "Returns md5sum for a message object of type '<get_rgb_uv-response>"
  "0eb5e9c6325d1b134d64fc42997917cc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_rgb_uv-response)))
  "Returns md5sum for a message object of type 'get_rgb_uv-response"
  "0eb5e9c6325d1b134d64fc42997917cc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_rgb_uv-response>)))
  "Returns full string definition for message of type '<get_rgb_uv-response>"
  (cl:format cl:nil "int32 x_min_uv~%int32 y_min_uv~%int32 x_max_uv~%int32 y_max_uv~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_rgb_uv-response)))
  "Returns full string definition for message of type 'get_rgb_uv-response"
  (cl:format cl:nil "int32 x_min_uv~%int32 y_min_uv~%int32 x_max_uv~%int32 y_max_uv~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_rgb_uv-response>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_rgb_uv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'get_rgb_uv-response
    (cl:cons ':x_min_uv (x_min_uv msg))
    (cl:cons ':y_min_uv (y_min_uv msg))
    (cl:cons ':x_max_uv (x_max_uv msg))
    (cl:cons ':y_max_uv (y_max_uv msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'get_rgb_uv)))
  'get_rgb_uv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'get_rgb_uv)))
  'get_rgb_uv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_rgb_uv)))
  "Returns string type for a service object of type '<get_rgb_uv>"
  "realsense_camera/get_rgb_uv")