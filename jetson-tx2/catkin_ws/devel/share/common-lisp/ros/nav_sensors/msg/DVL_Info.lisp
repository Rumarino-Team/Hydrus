; Auto-generated. Do not edit!


(cl:in-package nav_sensors-msg)


;//! \htmlinclude DVL_Info.msg.html

(cl:defclass <DVL_Info> (roslisp-msg-protocol:ros-message)
  ((packet_count
    :reader packet_count
    :initarg :packet_count
    :type cl:fixnum
    :initform 0)
   (packet_id
    :reader packet_id
    :initarg :packet_id
    :type cl:fixnum
    :initform 0)
   (version
    :reader version
    :initarg :version
    :type cl:fixnum
    :initform 0)
   (system_type
    :reader system_type
    :initarg :system_type
    :type cl:fixnum
    :initform 0)
   (system_subtype
    :reader system_subtype
    :initarg :system_subtype
    :type cl:fixnum
    :initform 0)
   (fw_major_version
    :reader fw_major_version
    :initarg :fw_major_version
    :type cl:fixnum
    :initform 0)
   (fw_minor_version
    :reader fw_minor_version
    :initarg :fw_minor_version
    :type cl:fixnum
    :initform 0)
   (fw_patch_version
    :reader fw_patch_version
    :initarg :fw_patch_version
    :type cl:fixnum
    :initform 0)
   (fw_build_version
    :reader fw_build_version
    :initarg :fw_build_version
    :type cl:fixnum
    :initform 0)
   (year
    :reader year
    :initarg :year
    :type cl:fixnum
    :initform 0)
   (month
    :reader month
    :initarg :month
    :type cl:fixnum
    :initform 0)
   (day
    :reader day
    :initarg :day
    :type cl:fixnum
    :initform 0)
   (hour
    :reader hour
    :initarg :hour
    :type cl:fixnum
    :initform 0)
   (minute
    :reader minute
    :initarg :minute
    :type cl:fixnum
    :initform 0)
   (second
    :reader second
    :initarg :second
    :type cl:fixnum
    :initform 0)
   (coordinate_system
    :reader coordinate_system
    :initarg :coordinate_system
    :type cl:fixnum
    :initform 0))
)

(cl:defclass DVL_Info (<DVL_Info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DVL_Info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DVL_Info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nav_sensors-msg:<DVL_Info> is deprecated: use nav_sensors-msg:DVL_Info instead.")))

(cl:ensure-generic-function 'packet_count-val :lambda-list '(m))
(cl:defmethod packet_count-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:packet_count-val is deprecated.  Use nav_sensors-msg:packet_count instead.")
  (packet_count m))

(cl:ensure-generic-function 'packet_id-val :lambda-list '(m))
(cl:defmethod packet_id-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:packet_id-val is deprecated.  Use nav_sensors-msg:packet_id instead.")
  (packet_id m))

(cl:ensure-generic-function 'version-val :lambda-list '(m))
(cl:defmethod version-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:version-val is deprecated.  Use nav_sensors-msg:version instead.")
  (version m))

(cl:ensure-generic-function 'system_type-val :lambda-list '(m))
(cl:defmethod system_type-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:system_type-val is deprecated.  Use nav_sensors-msg:system_type instead.")
  (system_type m))

(cl:ensure-generic-function 'system_subtype-val :lambda-list '(m))
(cl:defmethod system_subtype-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:system_subtype-val is deprecated.  Use nav_sensors-msg:system_subtype instead.")
  (system_subtype m))

(cl:ensure-generic-function 'fw_major_version-val :lambda-list '(m))
(cl:defmethod fw_major_version-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:fw_major_version-val is deprecated.  Use nav_sensors-msg:fw_major_version instead.")
  (fw_major_version m))

(cl:ensure-generic-function 'fw_minor_version-val :lambda-list '(m))
(cl:defmethod fw_minor_version-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:fw_minor_version-val is deprecated.  Use nav_sensors-msg:fw_minor_version instead.")
  (fw_minor_version m))

(cl:ensure-generic-function 'fw_patch_version-val :lambda-list '(m))
(cl:defmethod fw_patch_version-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:fw_patch_version-val is deprecated.  Use nav_sensors-msg:fw_patch_version instead.")
  (fw_patch_version m))

(cl:ensure-generic-function 'fw_build_version-val :lambda-list '(m))
(cl:defmethod fw_build_version-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:fw_build_version-val is deprecated.  Use nav_sensors-msg:fw_build_version instead.")
  (fw_build_version m))

(cl:ensure-generic-function 'year-val :lambda-list '(m))
(cl:defmethod year-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:year-val is deprecated.  Use nav_sensors-msg:year instead.")
  (year m))

(cl:ensure-generic-function 'month-val :lambda-list '(m))
(cl:defmethod month-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:month-val is deprecated.  Use nav_sensors-msg:month instead.")
  (month m))

(cl:ensure-generic-function 'day-val :lambda-list '(m))
(cl:defmethod day-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:day-val is deprecated.  Use nav_sensors-msg:day instead.")
  (day m))

(cl:ensure-generic-function 'hour-val :lambda-list '(m))
(cl:defmethod hour-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:hour-val is deprecated.  Use nav_sensors-msg:hour instead.")
  (hour m))

(cl:ensure-generic-function 'minute-val :lambda-list '(m))
(cl:defmethod minute-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:minute-val is deprecated.  Use nav_sensors-msg:minute instead.")
  (minute m))

(cl:ensure-generic-function 'second-val :lambda-list '(m))
(cl:defmethod second-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:second-val is deprecated.  Use nav_sensors-msg:second instead.")
  (second m))

(cl:ensure-generic-function 'coordinate_system-val :lambda-list '(m))
(cl:defmethod coordinate_system-val ((m <DVL_Info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nav_sensors-msg:coordinate_system-val is deprecated.  Use nav_sensors-msg:coordinate_system instead.")
  (coordinate_system m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DVL_Info>) ostream)
  "Serializes a message object of type '<DVL_Info>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'packet_count)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_subtype)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_major_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_minor_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_patch_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_build_version)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'coordinate_system)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DVL_Info>) istream)
  "Deserializes a message object of type '<DVL_Info>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'packet_count)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'packet_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'system_subtype)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_major_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_minor_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_patch_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'fw_build_version)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'year)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'month)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'day)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'hour)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'minute)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'second)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'coordinate_system)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DVL_Info>)))
  "Returns string type for a message object of type '<DVL_Info>"
  "nav_sensors/DVL_Info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DVL_Info)))
  "Returns string type for a message object of type 'DVL_Info"
  "nav_sensors/DVL_Info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DVL_Info>)))
  "Returns md5sum for a message object of type '<DVL_Info>"
  "0fce5519a2786a76ac927fac228614af")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DVL_Info)))
  "Returns md5sum for a message object of type 'DVL_Info"
  "0fce5519a2786a76ac927fac228614af")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DVL_Info>)))
  "Returns full string definition for message of type '<DVL_Info>"
  (cl:format cl:nil "~%uint16 packet_count # number of packets~%uint8 packet_id~%uint8 version #~%uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)~%uint8 system_subtype # Variant on the system type e.g frequency or transducer type~%uint8 fw_major_version~%uint8 fw_minor_version~%uint8 fw_patch_version~%uint8 fw_build_version~%uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint8 coordinate_system~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DVL_Info)))
  "Returns full string definition for message of type 'DVL_Info"
  (cl:format cl:nil "~%uint16 packet_count # number of packets~%uint8 packet_id~%uint8 version #~%uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)~%uint8 system_subtype # Variant on the system type e.g frequency or transducer type~%uint8 fw_major_version~%uint8 fw_minor_version~%uint8 fw_patch_version~%uint8 fw_build_version~%uint8 year~%uint8 month~%uint8 day~%uint8 hour~%uint8 minute~%uint8 second~%uint8 coordinate_system~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DVL_Info>))
  (cl:+ 0
     2
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DVL_Info>))
  "Converts a ROS message object to a list"
  (cl:list 'DVL_Info
    (cl:cons ':packet_count (packet_count msg))
    (cl:cons ':packet_id (packet_id msg))
    (cl:cons ':version (version msg))
    (cl:cons ':system_type (system_type msg))
    (cl:cons ':system_subtype (system_subtype msg))
    (cl:cons ':fw_major_version (fw_major_version msg))
    (cl:cons ':fw_minor_version (fw_minor_version msg))
    (cl:cons ':fw_patch_version (fw_patch_version msg))
    (cl:cons ':fw_build_version (fw_build_version msg))
    (cl:cons ':year (year msg))
    (cl:cons ':month (month msg))
    (cl:cons ':day (day msg))
    (cl:cons ':hour (hour msg))
    (cl:cons ':minute (minute msg))
    (cl:cons ':second (second msg))
    (cl:cons ':coordinate_system (coordinate_system msg))
))
