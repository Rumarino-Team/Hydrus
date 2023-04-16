; Auto-generated. Do not edit!


(cl:in-package nav_sensors-msg)


;//! \htmlinclude DVL_Power.msg.html

(cl:defclass <DVL_Power> (roslisp-msg-protocol:ros-message)
  ((input_voltage
    :reader input_voltage
    :initarg :input_voltage
    :type cl:float
    :initform 0.0)
   (transmit_voltage
    :reader transmit_voltage
    :initarg :transmit_voltage
    :type cl:float
    :initform 0.0)
   (transmit_current
    :reader transmit_current
    :initarg :transmit_current
    :type cl:float
    :initform 0.0))
)

(cl:defclass DVL_Power (<DVL_Power>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DVL_Power>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DVL_Power)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_sensors-msg:<DVL_Power> is deprecated: use nav_sensors-msg:DVL_Power instead.")))

(cl:ensure-generic-function 'input_voltage-val :lambda-list '(m))
(cl:defmethod input_voltage-val ((m <DVL_Power>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:input_voltage-val is deprecated.  Use nav_sensors-msg:input_voltage instead.")
  (input_voltage m))

(cl:ensure-generic-function 'transmit_voltage-val :lambda-list '(m))
(cl:defmethod transmit_voltage-val ((m <DVL_Power>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:transmit_voltage-val is deprecated.  Use nav_sensors-msg:transmit_voltage instead.")
  (transmit_voltage m))

(cl:ensure-generic-function 'transmit_current-val :lambda-list '(m))
(cl:defmethod transmit_current-val ((m <DVL_Power>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:transmit_current-val is deprecated.  Use nav_sensors-msg:transmit_current instead.")
  (transmit_current m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DVL_Power>) ostream)
  "Serializes a message object of type '<DVL_Power>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'input_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'transmit_voltage))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'transmit_current))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DVL_Power>) istream)
  "Deserializes a message object of type '<DVL_Power>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'input_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'transmit_voltage) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'transmit_current) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DVL_Power>)))
  "Returns string type for a message object of type '<DVL_Power>"
  "nav_sensors/DVL_Power")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DVL_Power)))
  "Returns string type for a message object of type 'DVL_Power"
  "nav_sensors/DVL_Power")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DVL_Power>)))
  "Returns md5sum for a message object of type '<DVL_Power>"
  "aaa18c977dd8bbf8b92f654a90151667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DVL_Power)))
  "Returns md5sum for a message object of type 'DVL_Power"
  "aaa18c977dd8bbf8b92f654a90151667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DVL_Power>)))
  "Returns full string definition for message of type '<DVL_Power>"
  (cl:format cl:nil "~%float32 input_voltage         # volts~%float32 transmit_voltage # volts~%float32 transmit_current # amps~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DVL_Power)))
  "Returns full string definition for message of type 'DVL_Power"
  (cl:format cl:nil "~%float32 input_voltage         # volts~%float32 transmit_voltage # volts~%float32 transmit_current # amps~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DVL_Power>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DVL_Power>))
  "Converts a ROS message object to a list"
  (cl:list 'DVL_Power
    (cl:cons ':input_voltage (input_voltage msg))
    (cl:cons ':transmit_voltage (transmit_voltage msg))
    (cl:cons ':transmit_current (transmit_current msg))
))
