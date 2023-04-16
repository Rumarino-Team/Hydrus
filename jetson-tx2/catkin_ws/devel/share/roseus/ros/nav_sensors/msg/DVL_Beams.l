;; Auto-generated. Do not edit!


(when (boundp 'nav_sensors::DVL_Beams)
  (if (not (find-package "NAV_SENSORS"))
    (make-package "NAV_SENSORS"))
  (shadow 'DVL_Beams (find-package "NAV_SENSORS")))
(unless (find-package "NAV_SENSORS::DVL_BEAMS")
  (make-package "NAV_SENSORS::DVL_BEAMS"))

(in-package "ROS")
;;//! \htmlinclude DVL_Beams.msg.html


(defclass nav_sensors::DVL_Beams
  :super ros::object
  :slots (_beam1 _beam2 _beam3 _beam4 ))

(defmethod nav_sensors::DVL_Beams
  (:init
   (&key
    ((:beam1 __beam1) 0.0)
    ((:beam2 __beam2) 0.0)
    ((:beam3 __beam3) 0.0)
    ((:beam4 __beam4) 0.0)
    )
   (send-super :init)
   (setq _beam1 (float __beam1))
   (setq _beam2 (float __beam2))
   (setq _beam3 (float __beam3))
   (setq _beam4 (float __beam4))
   self)
  (:beam1
   (&optional __beam1)
   (if __beam1 (setq _beam1 __beam1)) _beam1)
  (:beam2
   (&optional __beam2)
   (if __beam2 (setq _beam2 __beam2)) _beam2)
  (:beam3
   (&optional __beam3)
   (if __beam3 (setq _beam3 __beam3)) _beam3)
  (:beam4
   (&optional __beam4)
   (if __beam4 (setq _beam4 __beam4)) _beam4)
  (:serialization-length
   ()
   (+
    ;; float32 _beam1
    4
    ;; float32 _beam2
    4
    ;; float32 _beam3
    4
    ;; float32 _beam4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _beam1
       (sys::poke _beam1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _beam2
       (sys::poke _beam2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _beam3
       (sys::poke _beam3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _beam4
       (sys::poke _beam4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _beam1
     (setq _beam1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _beam2
     (setq _beam2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _beam3
     (setq _beam3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _beam4
     (setq _beam4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get nav_sensors::DVL_Beams :md5sum-) "546dd638b4ab134d8326eefb33315dc0")
(setf (get nav_sensors::DVL_Beams :datatype-) "nav_sensors/DVL_Beams")
(setf (get nav_sensors::DVL_Beams :definition-)
      "float32 beam1
float32 beam2
float32 beam3
float32 beam4
")



(provide :nav_sensors/DVL_Beams "546dd638b4ab134d8326eefb33315dc0")


