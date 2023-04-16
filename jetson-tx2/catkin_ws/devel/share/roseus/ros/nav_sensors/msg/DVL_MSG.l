;; Auto-generated. Do not edit!


(when (boundp 'nav_sensors::DVL_MSG)
  (if (not (find-package "NAV_SENSORS"))
    (make-package "NAV_SENSORS"))
  (shadow 'DVL_MSG (find-package "NAV_SENSORS")))
(unless (find-package "NAV_SENSORS::DVL_MSG")
  (make-package "NAV_SENSORS::DVL_MSG"))

(in-package "ROS")
;;//! \htmlinclude DVL_MSG.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass nav_sensors::DVL_MSG
  :super ros::object
  :slots (_header _is_valid _system_info _data _bit_count _bit_code _power _serial_number ))

(defmethod nav_sensors::DVL_MSG
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:is_valid __is_valid) nil)
    ((:system_info __system_info) (instance nav_sensors::DVL_Info :init))
    ((:data __data) (instance nav_sensors::DVL_Data :init))
    ((:bit_count __bit_count) 0)
    ((:bit_code __bit_code) 0)
    ((:power __power) (instance nav_sensors::DVL_Power :init))
    ((:serial_number __serial_number) (instance std_msgs::String :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _is_valid __is_valid)
   (setq _system_info __system_info)
   (setq _data __data)
   (setq _bit_count (round __bit_count))
   (setq _bit_code (round __bit_code))
   (setq _power __power)
   (setq _serial_number __serial_number)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:is_valid
   (&optional (__is_valid :null))
   (if (not (eq __is_valid :null)) (setq _is_valid __is_valid)) _is_valid)
  (:system_info
   (&rest __system_info)
   (if (keywordp (car __system_info))
       (send* _system_info __system_info)
     (progn
       (if __system_info (setq _system_info (car __system_info)))
       _system_info)))
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:bit_count
   (&optional __bit_count)
   (if __bit_count (setq _bit_count __bit_count)) _bit_count)
  (:bit_code
   (&optional __bit_code)
   (if __bit_code (setq _bit_code __bit_code)) _bit_code)
  (:power
   (&rest __power)
   (if (keywordp (car __power))
       (send* _power __power)
     (progn
       (if __power (setq _power (car __power)))
       _power)))
  (:serial_number
   (&rest __serial_number)
   (if (keywordp (car __serial_number))
       (send* _serial_number __serial_number)
     (progn
       (if __serial_number (setq _serial_number (car __serial_number)))
       _serial_number)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _is_valid
    1
    ;; nav_sensors/DVL_Info _system_info
    (send _system_info :serialization-length)
    ;; nav_sensors/DVL_Data _data
    (send _data :serialization-length)
    ;; int64 _bit_count
    8
    ;; int64 _bit_code
    8
    ;; nav_sensors/DVL_Power _power
    (send _power :serialization-length)
    ;; std_msgs/String _serial_number
    (send _serial_number :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _is_valid
       (if _is_valid (write-byte -1 s) (write-byte 0 s))
     ;; nav_sensors/DVL_Info _system_info
       (send _system_info :serialize s)
     ;; nav_sensors/DVL_Data _data
       (send _data :serialize s)
     ;; int64 _bit_count
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _bit_count (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _bit_count) (= (length (_bit_count . bv)) 2)) ;; bignum
              (write-long (ash (elt (_bit_count . bv) 0) 0) s)
              (write-long (ash (elt (_bit_count . bv) 1) -1) s))
             ((and (class _bit_count) (= (length (_bit_count . bv)) 1)) ;; big1
              (write-long (elt (_bit_count . bv) 0) s)
              (write-long (if (>= _bit_count 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _bit_count s)(write-long (if (>= _bit_count 0) 0 #xffffffff) s)))
     ;; int64 _bit_code
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _bit_code (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _bit_code) (= (length (_bit_code . bv)) 2)) ;; bignum
              (write-long (ash (elt (_bit_code . bv) 0) 0) s)
              (write-long (ash (elt (_bit_code . bv) 1) -1) s))
             ((and (class _bit_code) (= (length (_bit_code . bv)) 1)) ;; big1
              (write-long (elt (_bit_code . bv) 0) s)
              (write-long (if (>= _bit_code 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _bit_code s)(write-long (if (>= _bit_code 0) 0 #xffffffff) s)))
     ;; nav_sensors/DVL_Power _power
       (send _power :serialize s)
     ;; std_msgs/String _serial_number
       (send _serial_number :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _is_valid
     (setq _is_valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; nav_sensors/DVL_Info _system_info
     (send _system_info :deserialize buf ptr-) (incf ptr- (send _system_info :serialization-length))
   ;; nav_sensors/DVL_Data _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;; int64 _bit_count
#+(or :alpha :irix6 :x86_64)
      (setf _bit_count (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _bit_count (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _bit_code
#+(or :alpha :irix6 :x86_64)
      (setf _bit_code (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _bit_code (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; nav_sensors/DVL_Power _power
     (send _power :deserialize buf ptr-) (incf ptr- (send _power :serialization-length))
   ;; std_msgs/String _serial_number
     (send _serial_number :deserialize buf ptr-) (incf ptr- (send _serial_number :serialization-length))
   ;;
   self)
  )

(setf (get nav_sensors::DVL_MSG :md5sum-) "b8b06991dd9cca7403c624d30aeebcda")
(setf (get nav_sensors::DVL_MSG :datatype-) "nav_sensors/DVL_MSG")
(setf (get nav_sensors::DVL_MSG :definition-)
      "


std_msgs/Header header
bool is_valid
nav_sensors/DVL_Info system_info
nav_sensors/DVL_Data data
#two unknowns
int64 bit_count
int64 bit_code
nav_sensors/DVL_Power power
std_msgs/String serial_number
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: nav_sensors/DVL_Info

uint16 packet_count # number of packets
uint8 packet_id
uint8 version #
uint8 system_type # System Type (should be = 76 = 0x4c for Wayfinder DVL)
uint8 system_subtype # Variant on the system type e.g frequency or transducer type
uint8 fw_major_version
uint8 fw_minor_version
uint8 fw_patch_version
uint8 fw_build_version
uint8 year
uint8 month
uint8 day
uint8 hour
uint8 minute
uint8 second
uint8 coordinate_system
================================================================================
MSG: nav_sensors/DVL_Data


geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components
float32 vel_error

geometry_msgs/Point position

nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)
#float32 range_beam1
#float32 range_beam2
#float32 range_beam3
#float32 range_beam4

float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams
float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing
int64 BT_status # Combines amplitude/correlation erroes and three beam solution information
================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: nav_sensors/DVL_Beams
float32 beam1
float32 beam2
float32 beam3
float32 beam4
================================================================================
MSG: nav_sensors/DVL_Power

float32 input_voltage         # volts
float32 transmit_voltage # volts
float32 transmit_current # amps
================================================================================
MSG: std_msgs/String
string data

")



(provide :nav_sensors/DVL_MSG "b8b06991dd9cca7403c624d30aeebcda")


