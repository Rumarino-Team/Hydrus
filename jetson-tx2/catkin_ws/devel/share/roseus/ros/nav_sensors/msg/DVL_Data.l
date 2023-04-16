;; Auto-generated. Do not edit!


(when (boundp 'nav_sensors::DVL_Data)
  (if (not (find-package "NAV_SENSORS"))
    (make-package "NAV_SENSORS"))
  (shadow 'DVL_Data (find-package "NAV_SENSORS")))
(unless (find-package "NAV_SENSORS::DVL_DATA")
  (make-package "NAV_SENSORS::DVL_DATA"))

(in-package "ROS")
;;//! \htmlinclude DVL_Data.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass nav_sensors::DVL_Data
  :super ros::object
  :slots (_velocity _vel_error _position _beams _mean_bottom_range _speed_of_sound _BT_status ))

(defmethod nav_sensors::DVL_Data
  (:init
   (&key
    ((:velocity __velocity) (instance geometry_msgs::Vector3 :init))
    ((:vel_error __vel_error) 0.0)
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:beams __beams) (instance nav_sensors::DVL_Beams :init))
    ((:mean_bottom_range __mean_bottom_range) 0.0)
    ((:speed_of_sound __speed_of_sound) 0.0)
    ((:BT_status __BT_status) 0)
    )
   (send-super :init)
   (setq _velocity __velocity)
   (setq _vel_error (float __vel_error))
   (setq _position __position)
   (setq _beams __beams)
   (setq _mean_bottom_range (float __mean_bottom_range))
   (setq _speed_of_sound (float __speed_of_sound))
   (setq _BT_status (round __BT_status))
   self)
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:vel_error
   (&optional __vel_error)
   (if __vel_error (setq _vel_error __vel_error)) _vel_error)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:beams
   (&rest __beams)
   (if (keywordp (car __beams))
       (send* _beams __beams)
     (progn
       (if __beams (setq _beams (car __beams)))
       _beams)))
  (:mean_bottom_range
   (&optional __mean_bottom_range)
   (if __mean_bottom_range (setq _mean_bottom_range __mean_bottom_range)) _mean_bottom_range)
  (:speed_of_sound
   (&optional __speed_of_sound)
   (if __speed_of_sound (setq _speed_of_sound __speed_of_sound)) _speed_of_sound)
  (:BT_status
   (&optional __BT_status)
   (if __BT_status (setq _BT_status __BT_status)) _BT_status)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _velocity
    (send _velocity :serialization-length)
    ;; float32 _vel_error
    4
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; nav_sensors/DVL_Beams _beams
    (send _beams :serialization-length)
    ;; float32 _mean_bottom_range
    4
    ;; float32 _speed_of_sound
    4
    ;; int64 _BT_status
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _velocity
       (send _velocity :serialize s)
     ;; float32 _vel_error
       (sys::poke _vel_error (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; nav_sensors/DVL_Beams _beams
       (send _beams :serialize s)
     ;; float32 _mean_bottom_range
       (sys::poke _mean_bottom_range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed_of_sound
       (sys::poke _speed_of_sound (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int64 _BT_status
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _BT_status (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _BT_status) (= (length (_BT_status . bv)) 2)) ;; bignum
              (write-long (ash (elt (_BT_status . bv) 0) 0) s)
              (write-long (ash (elt (_BT_status . bv) 1) -1) s))
             ((and (class _BT_status) (= (length (_BT_status . bv)) 1)) ;; big1
              (write-long (elt (_BT_status . bv) 0) s)
              (write-long (if (>= _BT_status 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _BT_status s)(write-long (if (>= _BT_status 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; float32 _vel_error
     (setq _vel_error (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; nav_sensors/DVL_Beams _beams
     (send _beams :deserialize buf ptr-) (incf ptr- (send _beams :serialization-length))
   ;; float32 _mean_bottom_range
     (setq _mean_bottom_range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed_of_sound
     (setq _speed_of_sound (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int64 _BT_status
#+(or :alpha :irix6 :x86_64)
      (setf _BT_status (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _BT_status (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get nav_sensors::DVL_Data :md5sum-) "97ac2a86c0b276ba205c91f67abbbc93")
(setf (get nav_sensors::DVL_Data :datatype-) "nav_sensors/DVL_Data")
(setf (get nav_sensors::DVL_Data :definition-)
      "

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
")



(provide :nav_sensors/DVL_Data "97ac2a86c0b276ba205c91f67abbbc93")


