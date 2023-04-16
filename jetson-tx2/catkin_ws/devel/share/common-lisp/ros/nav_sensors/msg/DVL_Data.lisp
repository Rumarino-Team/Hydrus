; Auto-generated. Do not edit!


(cl:in-package nav_sensors-msg)


;//! \htmlinclude DVL_Data.msg.html

(cl:defclass <DVL_Data> (roslisp-msg-protocol:ros-message)
  ((velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (vel_error
    :reader vel_error
    :initarg :vel_error
    :type cl:float
    :initform 0.0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (beams
    :reader beams
    :initarg :beams
    :type nav_sensors-msg:DVL_Beams
    :initform (cl:make-instance 'nav_sensors-msg:DVL_Beams))
   (mean_bottom_range
    :reader mean_bottom_range
    :initarg :mean_bottom_range
    :type cl:float
    :initform 0.0)
   (speed_of_sound
    :reader speed_of_sound
    :initarg :speed_of_sound
    :type cl:float
    :initform 0.0)
   (BT_status
    :reader BT_status
    :initarg :BT_status
    :type cl:integer
    :initform 0))
)

(cl:defclass DVL_Data (<DVL_Data>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DVL_Data>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DVL_Data)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_sensors-msg:<DVL_Data> is deprecated: use nav_sensors-msg:DVL_Data instead.")))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:velocity-val is deprecated.  Use nav_sensors-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'vel_error-val :lambda-list '(m))
(cl:defmethod vel_error-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:vel_error-val is deprecated.  Use nav_sensors-msg:vel_error instead.")
  (vel_error m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:position-val is deprecated.  Use nav_sensors-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'beams-val :lambda-list '(m))
(cl:defmethod beams-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:beams-val is deprecated.  Use nav_sensors-msg:beams instead.")
  (beams m))

(cl:ensure-generic-function 'mean_bottom_range-val :lambda-list '(m))
(cl:defmethod mean_bottom_range-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:mean_bottom_range-val is deprecated.  Use nav_sensors-msg:mean_bottom_range instead.")
  (mean_bottom_range m))

(cl:ensure-generic-function 'speed_of_sound-val :lambda-list '(m))
(cl:defmethod speed_of_sound-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:speed_of_sound-val is deprecated.  Use nav_sensors-msg:speed_of_sound instead.")
  (speed_of_sound m))

(cl:ensure-generic-function 'BT_status-val :lambda-list '(m))
(cl:defmethod BT_status-val ((m <DVL_Data>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:BT_status-val is deprecated.  Use nav_sensors-msg:BT_status instead.")
  (BT_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DVL_Data>) ostream)
  "Serializes a message object of type '<DVL_Data>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vel_error))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'beams) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'mean_bottom_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed_of_sound))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'BT_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DVL_Data>) istream)
  "Deserializes a message object of type '<DVL_Data>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vel_error) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'beams) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mean_bottom_range) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed_of_sound) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'BT_status) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DVL_Data>)))
  "Returns string type for a message object of type '<DVL_Data>"
  "nav_sensors/DVL_Data")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DVL_Data)))
  "Returns string type for a message object of type 'DVL_Data"
  "nav_sensors/DVL_Data")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DVL_Data>)))
  "Returns md5sum for a message object of type '<DVL_Data>"
  "97ac2a86c0b276ba205c91f67abbbc93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DVL_Data)))
  "Returns md5sum for a message object of type 'DVL_Data"
  "97ac2a86c0b276ba205c91f67abbbc93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DVL_Data>)))
  "Returns full string definition for message of type '<DVL_Data>"
  (cl:format cl:nil "~%~%geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components~%float32 vel_error~%~%geometry_msgs/Point position~%~%nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)~%#float32 range_beam1~%#float32 range_beam2~%#float32 range_beam3~%#float32 range_beam4~%~%float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams~%float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing~%int64 BT_status # Combines amplitude/correlation erroes and three beam solution information~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: nav_sensors/DVL_Beams~%float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DVL_Data)))
  "Returns full string definition for message of type 'DVL_Data"
  (cl:format cl:nil "~%~%geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components~%float32 vel_error~%~%geometry_msgs/Point position~%~%nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)~%#float32 range_beam1~%#float32 range_beam2~%#float32 range_beam3~%#float32 range_beam4~%~%float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams~%float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing~%int64 BT_status # Combines amplitude/correlation erroes and three beam solution information~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: nav_sensors/DVL_Beams~%float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DVL_Data>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'beams))
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DVL_Data>))
  "Converts a ROS message object to a list"
  (cl:list 'DVL_Data
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':vel_error (vel_error msg))
    (cl:cons ':position (position msg))
    (cl:cons ':beams (beams msg))
    (cl:cons ':mean_bottom_range (mean_bottom_range msg))
    (cl:cons ':speed_of_sound (speed_of_sound msg))
    (cl:cons ':BT_status (BT_status msg))
))
