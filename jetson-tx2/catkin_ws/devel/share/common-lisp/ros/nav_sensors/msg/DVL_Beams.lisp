; Auto-generated. Do not edit!


(cl:in-package nav_sensors-msg)


;//! \htmlinclude DVL_Beams.msg.html

(cl:defclass <DVL_Beams> (roslisp-msg-protocol:ros-message)
  ((beam1
    :reader beam1
    :initarg :beam1
    :type cl:float
    :initform 0.0)
   (beam2
    :reader beam2
    :initarg :beam2
    :type cl:float
    :initform 0.0)
   (beam3
    :reader beam3
    :initarg :beam3
    :type cl:float
    :initform 0.0)
   (beam4
    :reader beam4
    :initarg :beam4
    :type cl:float
    :initform 0.0))
)

(cl:defclass DVL_Beams (<DVL_Beams>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DVL_Beams>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DVL_Beams)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_sensors-msg:<DVL_Beams> is deprecated: use nav_sensors-msg:DVL_Beams instead.")))

(cl:ensure-generic-function 'beam1-val :lambda-list '(m))
(cl:defmethod beam1-val ((m <DVL_Beams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:beam1-val is deprecated.  Use nav_sensors-msg:beam1 instead.")
  (beam1 m))

(cl:ensure-generic-function 'beam2-val :lambda-list '(m))
(cl:defmethod beam2-val ((m <DVL_Beams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:beam2-val is deprecated.  Use nav_sensors-msg:beam2 instead.")
  (beam2 m))

(cl:ensure-generic-function 'beam3-val :lambda-list '(m))
(cl:defmethod beam3-val ((m <DVL_Beams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:beam3-val is deprecated.  Use nav_sensors-msg:beam3 instead.")
  (beam3 m))

(cl:ensure-generic-function 'beam4-val :lambda-list '(m))
(cl:defmethod beam4-val ((m <DVL_Beams>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:beam4-val is deprecated.  Use nav_sensors-msg:beam4 instead.")
  (beam4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DVL_Beams>) ostream)
  "Serializes a message object of type '<DVL_Beams>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beam1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beam2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beam3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'beam4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DVL_Beams>) istream)
  "Deserializes a message object of type '<DVL_Beams>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beam1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beam2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beam3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'beam4) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DVL_Beams>)))
  "Returns string type for a message object of type '<DVL_Beams>"
  "nav_sensors/DVL_Beams")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DVL_Beams)))
  "Returns string type for a message object of type 'DVL_Beams"
  "nav_sensors/DVL_Beams")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DVL_Beams>)))
  "Returns md5sum for a message object of type '<DVL_Beams>"
  "546dd638b4ab134d8326eefb33315dc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DVL_Beams)))
  "Returns md5sum for a message object of type 'DVL_Beams"
  "546dd638b4ab134d8326eefb33315dc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DVL_Beams>)))
  "Returns full string definition for message of type '<DVL_Beams>"
  (cl:format cl:nil "float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DVL_Beams)))
  "Returns full string definition for message of type 'DVL_Beams"
  (cl:format cl:nil "float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DVL_Beams>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DVL_Beams>))
  "Converts a ROS message object to a list"
  (cl:list 'DVL_Beams
    (cl:cons ':beam1 (beam1 msg))
    (cl:cons ':beam2 (beam2 msg))
    (cl:cons ':beam3 (beam3 msg))
    (cl:cons ':beam4 (beam4 msg))
))
