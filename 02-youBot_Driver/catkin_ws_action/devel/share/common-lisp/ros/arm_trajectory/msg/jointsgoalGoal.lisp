; Auto-generated. Do not edit!


(cl:in-package arm_trajectory-msg)


;//! \htmlinclude jointsgoalGoal.msg.html

(cl:defclass <jointsgoalGoal> (roslisp-msg-protocol:ros-message)
  ((jointsgoal
    :reader jointsgoal
    :initarg :jointsgoal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass jointsgoalGoal (<jointsgoalGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <jointsgoalGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'jointsgoalGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_trajectory-msg:<jointsgoalGoal> is deprecated: use arm_trajectory-msg:jointsgoalGoal instead.")))

(cl:ensure-generic-function 'jointsgoal-val :lambda-list '(m))
(cl:defmethod jointsgoal-val ((m <jointsgoalGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_trajectory-msg:jointsgoal-val is deprecated.  Use arm_trajectory-msg:jointsgoal instead.")
  (jointsgoal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <jointsgoalGoal>) ostream)
  "Serializes a message object of type '<jointsgoalGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'jointsgoal))))
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
   (cl:slot-value msg 'jointsgoal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <jointsgoalGoal>) istream)
  "Deserializes a message object of type '<jointsgoalGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'jointsgoal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'jointsgoal)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<jointsgoalGoal>)))
  "Returns string type for a message object of type '<jointsgoalGoal>"
  "arm_trajectory/jointsgoalGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'jointsgoalGoal)))
  "Returns string type for a message object of type 'jointsgoalGoal"
  "arm_trajectory/jointsgoalGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<jointsgoalGoal>)))
  "Returns md5sum for a message object of type '<jointsgoalGoal>"
  "bae294964d9345dd4934c1a21857f9e0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'jointsgoalGoal)))
  "Returns md5sum for a message object of type 'jointsgoalGoal"
  "bae294964d9345dd4934c1a21857f9e0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<jointsgoalGoal>)))
  "Returns full string definition for message of type '<jointsgoalGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%float64[] jointsgoal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'jointsgoalGoal)))
  "Returns full string definition for message of type 'jointsgoalGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%float64[] jointsgoal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <jointsgoalGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'jointsgoal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <jointsgoalGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'jointsgoalGoal
    (cl:cons ':jointsgoal (jointsgoal msg))
))
