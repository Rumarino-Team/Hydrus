;; Auto-generated. Do not edit!


(when (boundp 'nav_sensors::DVL_Power)
  (if (not (find-package "NAV_SENSORS"))
    (make-package "NAV_SENSORS"))
  (shadow 'DVL_Power (find-package "NAV_SENSORS")))
(unless (find-package "NAV_SENSORS::DVL_POWER")
  (make-package "NAV_SENSORS::DVL_POWER"))

(in-package "ROS")
;;//! \htmlinclude DVL_Power.msg.html


(defclass nav_sensors::DVL_Power
  :super ros::object
  :slots (_input_voltage _transmit_voltage _transmit_current ))

(defmethod nav_sensors::DVL_Power
  (:init
   (&key
    ((:input_voltage __input_voltage) 0.0)
    ((:transmit_voltage __transmit_voltage) 0.0)
    ((:transmit_current __transmit_current) 0.0)
    )
   (send-super :init)
   (setq _input_voltage (float __input_voltage))
   (setq _transmit_voltage (float __transmit_voltage))
   (setq _transmit_current (float __transmit_current))
   self)
  (:input_voltage
   (&optional __input_voltage)
   (if __input_voltage (setq _input_voltage __input_voltage)) _input_voltage)
  (:transmit_voltage
   (&optional __transmit_voltage)
   (if __transmit_voltage (setq _transmit_voltage __transmit_voltage)) _transmit_voltage)
  (:transmit_current
   (&optional __transmit_current)
   (if __transmit_current (setq _transmit_current __transmit_current)) _transmit_current)
  (:serialization-length
   ()
   (+
    ;; float32 _input_voltage
    4
    ;; float32 _transmit_voltage
    4
    ;; float32 _transmit_current
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _input_voltage
       (sys::poke _input_voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _transmit_voltage
       (sys::poke _transmit_voltage (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _transmit_current
       (sys::poke _transmit_current (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _input_voltage
     (setq _input_voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _transmit_voltage
     (setq _transmit_voltage (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _transmit_current
     (setq _transmit_current (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nav_sensors::DVL_Power :md5sum-) "aaa18c977dd8bbf8b92f654a90151667")
(setf (get nav_sensors::DVL_Power :datatype-) "nav_sensors/DVL_Power")
(setf (get nav_sensors::DVL_Power :definition-)
      "
float32 input_voltage         # volts
float32 transmit_voltage # volts
float32 transmit_current # amps
")



(provide :nav_sensors/DVL_Power "aaa18c977dd8bbf8b92f654a90151667")


