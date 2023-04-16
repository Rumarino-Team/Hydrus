; Auto-generated. Do not edit!


(cl:in-package nav_sensors-msg)


;//! \htmlinclude DVL_MSG.msg.html

(cl:defclass <DVL_MSG> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (is_valid
    :reader is_valid
    :initarg :is_valid
    :type cl:boolean
    :initform cl:nil)
   (system_info
    :reader system_info
    :initarg :system_info
    :type nav_sensors-msg:DVL_Info
    :initform (cl:make-instance 'nav_sensors-msg:DVL_Info))
   (data
    :reader data
    :initarg :data
    :type nav_sensors-msg:DVL_Data
    :initform (cl:make-instance 'nav_sensors-msg:DVL_Data))
   (bit_count
    :reader bit_count
    :initarg :bit_count
    :type cl:integer
    :initform 0)
   (bit_code
    :reader bit_code
    :initarg :bit_code
    :type cl:integer
    :initform 0)
   (power
    :reader power
    :initarg :power
    :type nav_sensors-msg:DVL_Power
    :initform (cl:make-instance 'nav_sensors-msg:DVL_Power))
   (serial_number
    :reader serial_number
    :initarg :serial_number
    :type std_msgs-msg:String
    :initform (cl:make-instance 'std_msgs-msg:String)))
)

(cl:defclass DVL_MSG (<DVL_MSG>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DVL_MSG>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DVL_MSG)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_sensors-msg:<DVL_MSG> is deprecated: use nav_sensors-msg:DVL_MSG instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:header-val is deprecated.  Use nav_sensors-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'is_valid-val :lambda-list '(m))
(cl:defmethod is_valid-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:is_valid-val is deprecated.  Use nav_sensors-msg:is_valid instead.")
  (is_valid m))

(cl:ensure-generic-function 'system_info-val :lambda-list '(m))
(cl:defmethod system_info-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:system_info-val is deprecated.  Use nav_sensors-msg:system_info instead.")
  (system_info m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:data-val is deprecated.  Use nav_sensors-msg:data instead.")
  (data m))

(cl:ensure-generic-function 'bit_count-val :lambda-list '(m))
(cl:defmethod bit_count-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:bit_count-val is deprecated.  Use nav_sensors-msg:bit_count instead.")
  (bit_count m))

(cl:ensure-generic-function 'bit_code-val :lambda-list '(m))
(cl:defmethod bit_code-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:bit_code-val is deprecated.  Use nav_sensors-msg:bit_code instead.")
  (bit_code m))

(cl:ensure-generic-function 'power-val :lambda-list '(m))
(cl:defmethod power-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:power-val is deprecated.  Use nav_sensors-msg:power instead.")
  (power m))

(cl:ensure-generic-function 'serial_number-val :lambda-list '(m))
(cl:defmethod serial_number-val ((m <DVL_MSG>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:serial_number-val is deprecated.  Use nav_sensors-msg:serial_number instead.")
  (serial_number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DVL_MSG>) ostream)
  "Serializes a message object of type '<DVL_MSG>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_valid) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'system_info) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
  (cl:let* ((signed (cl:slot-value msg 'bit_count)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'bit_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'power) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'serial_number) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DVL_MSG>) istream)
  "Deserializes a message object of type '<DVL_MSG>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:slot-value msg 'is_valid) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'system_info) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bit_count) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bit_code) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'power) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'serial_number) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DVL_MSG>)))
  "Returns string type for a message object of type '<DVL_MSG>"
  "nav_sensors/DVL_MSG")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DVL_MSG)))
  "Returns string type for a message object of type 'DVL_MSG"
  "nav_sensors/DVL_MSG")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DVL_MSG>)))
  "Returns md5sum for a message object of type '<DVL_MSG>"
  "b8b06991dd9cca7403c624d30aeebcda")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DVL_MSG)))
  "Returns md5sum for a message object of type 'DVL_MSG"
  "b8b06991dd9cca7403c624d30aeebcda")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DVL_MSG>)))
  "Returns full string definition for message of type '<DVL_MSG>"
  (cl:format cl:nil "~%~%~%std_msgs/Header header~%bool is_valid~%nav_sensors/DVL_Info system_info~%nav_sensors/DVL_Data data~%#two unknowns~%int64 bit_count~%int64 bit_code~%nav_sensors/DVL_Power power~%std_msgs/String serial_number~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_sensors/DVL_Info~%~%uint16 packet_count # number of packets~%uint8 packet_id~%uint8 version #~%uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)~%uint8 system_subtype # Variant on the system type e.g frequency or transducer type~%uint8 fw_major_version~%uint8 fw_minor_version~%uint8 fw_patch_version~%uint8 fw_build_version~%uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint8 coordinate_system~%================================================================================~%MSG: nav_sensors/DVL_Data~%~%~%geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components~%float32 vel_error~%~%geometry_msgs/Point position~%~%nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)~%#float32 range_beam1~%#float32 range_beam2~%#float32 range_beam3~%#float32 range_beam4~%~%float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams~%float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing~%int64 BT_status # Combines amplitude/correlation erroes and three beam solution information~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: nav_sensors/DVL_Beams~%float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%================================================================================~%MSG: nav_sensors/DVL_Power~%~%float32 input_voltage         # volts~%float32 transmit_voltage # volts~%float32 transmit_current # amps~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DVL_MSG)))
  "Returns full string definition for message of type 'DVL_MSG"
  (cl:format cl:nil "~%~%~%std_msgs/Header header~%bool is_valid~%nav_sensors/DVL_Info system_info~%nav_sensors/DVL_Data data~%#two unknowns~%int64 bit_count~%int64 bit_code~%nav_sensors/DVL_Power power~%std_msgs/String serial_number~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: nav_sensors/DVL_Info~%~%uint16 packet_count # number of packets~%uint8 packet_id~%uint8 version #~%uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)~%uint8 system_subtype # Variant on the system type e.g frequency or transducer type~%uint8 fw_major_version~%uint8 fw_minor_version~%uint8 fw_patch_version~%uint8 fw_build_version~%uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint8 coordinate_system~%================================================================================~%MSG: nav_sensors/DVL_Data~%~%~%geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components~%float32 vel_error~%~%geometry_msgs/Point position~%~%nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)~%#float32 range_beam1~%#float32 range_beam2~%#float32 range_beam3~%#float32 range_beam4~%~%float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams~%float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing~%int64 BT_status # Combines amplitude/correlation erroes and three beam solution information~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: nav_sensors/DVL_Beams~%float32 beam1~%float32 beam2~%float32 beam3~%float32 beam4~%================================================================================~%MSG: nav_sensors/DVL_Power~%~%float32 input_voltage         # volts~%float32 transmit_voltage # volts~%float32 transmit_current # amps~%================================================================================~%MSG: std_msgs/String~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DVL_MSG>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'system_info))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'power))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'serial_number))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DVL_MSG>))
  "Converts a ROS message object to a list"
  (cl:list 'DVL_MSG
    (cl:cons ':header (header msg))
    (cl:cons ':is_valid (is_valid msg))
    (cl:cons ':system_info (system_info msg))
    (cl:cons ':data (data msg))
    (cl:cons ':bit_count (bit_count msg))
    (cl:cons ':bit_code (bit_code msg))
    (cl:cons ':power (power msg))
    (cl:cons ':serial_number (serial_number msg))
))
