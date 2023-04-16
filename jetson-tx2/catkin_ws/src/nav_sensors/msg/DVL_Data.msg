

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