// Generated by gencpp from file nav_sensors/DVL_Data.msg
// DO NOT EDIT!


#ifndef NAV_SENSORS_MESSAGE_DVL_DATA_H
#define NAV_SENSORS_MESSAGE_DVL_DATA_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Point.h>
#include <nav_sensors/DVL_Beams.h>

namespace nav_sensors
{
template <class ContainerAllocator>
struct DVL_Data_
{
  typedef DVL_Data_<ContainerAllocator> Type;

  DVL_Data_()
    : velocity()
    , vel_error(0.0)
    , position()
    , beams()
    , mean_bottom_range(0.0)
    , speed_of_sound(0.0)
    , BT_status(0)  {
    }
  DVL_Data_(const ContainerAllocator& _alloc)
    : velocity(_alloc)
    , vel_error(0.0)
    , position(_alloc)
    , beams(_alloc)
    , mean_bottom_range(0.0)
    , speed_of_sound(0.0)
    , BT_status(0)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Vector3_<ContainerAllocator>  _velocity_type;
  _velocity_type velocity;

   typedef float _vel_error_type;
  _vel_error_type vel_error;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef  ::nav_sensors::DVL_Beams_<ContainerAllocator>  _beams_type;
  _beams_type beams;

   typedef float _mean_bottom_range_type;
  _mean_bottom_range_type mean_bottom_range;

   typedef float _speed_of_sound_type;
  _speed_of_sound_type speed_of_sound;

   typedef int64_t _BT_status_type;
  _BT_status_type BT_status;





  typedef boost::shared_ptr< ::nav_sensors::DVL_Data_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nav_sensors::DVL_Data_<ContainerAllocator> const> ConstPtr;

}; // struct DVL_Data_

typedef ::nav_sensors::DVL_Data_<std::allocator<void> > DVL_Data;

typedef boost::shared_ptr< ::nav_sensors::DVL_Data > DVL_DataPtr;
typedef boost::shared_ptr< ::nav_sensors::DVL_Data const> DVL_DataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nav_sensors::DVL_Data_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nav_sensors::DVL_Data_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nav_sensors::DVL_Data_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Data_<ContainerAllocator2> & rhs)
{
  return lhs.velocity == rhs.velocity &&
    lhs.vel_error == rhs.vel_error &&
    lhs.position == rhs.position &&
    lhs.beams == rhs.beams &&
    lhs.mean_bottom_range == rhs.mean_bottom_range &&
    lhs.speed_of_sound == rhs.speed_of_sound &&
    lhs.BT_status == rhs.BT_status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nav_sensors::DVL_Data_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Data_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nav_sensors

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Data_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Data_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Data_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Data_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nav_sensors::DVL_Data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "97ac2a86c0b276ba205c91f67abbbc93";
  }

  static const char* value(const ::nav_sensors::DVL_Data_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x97ac2a86c0b276baULL;
  static const uint64_t static_value2 = 0x205c91f67abbbc93ULL;
};

template<class ContainerAllocator>
struct DataType< ::nav_sensors::DVL_Data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_sensors/DVL_Data";
  }

  static const char* value(const ::nav_sensors::DVL_Data_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nav_sensors::DVL_Data_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
"\n"
"geometry_msgs/Vector3 velocity # Velocity in m/s of the DVL relative tothe bottom X,Y,Z and Error components\n"
"float32 vel_error\n"
"\n"
"geometry_msgs/Point position\n"
"\n"
"nav_sensors/DVL_Beams beams # Range in meters from the DVL to the bottom as determined by each Beam 1-4 (in meters)\n"
"#float32 range_beam1\n"
"#float32 range_beam2\n"
"#float32 range_beam3\n"
"#float32 range_beam4\n"
"\n"
"float32 mean_bottom_range # Calculated mean range (in meters) to bottom based on valid beams\n"
"float32 speed_of_sound # The speed of sound (in m/s) used for the doppler processing\n"
"int64 BT_status # Combines amplitude/correlation erroes and three beam solution information\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: nav_sensors/DVL_Beams\n"
"float32 beam1\n"
"float32 beam2\n"
"float32 beam3\n"
"float32 beam4\n"
;
  }

  static const char* value(const ::nav_sensors::DVL_Data_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nav_sensors::DVL_Data_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.velocity);
      stream.next(m.vel_error);
      stream.next(m.position);
      stream.next(m.beams);
      stream.next(m.mean_bottom_range);
      stream.next(m.speed_of_sound);
      stream.next(m.BT_status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DVL_Data_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nav_sensors::DVL_Data_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nav_sensors::DVL_Data_<ContainerAllocator>& v)
  {
    s << indent << "velocity: ";
    s << std::endl;
    Printer< ::geometry_msgs::Vector3_<ContainerAllocator> >::stream(s, indent + "  ", v.velocity);
    s << indent << "vel_error: ";
    Printer<float>::stream(s, indent + "  ", v.vel_error);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "beams: ";
    s << std::endl;
    Printer< ::nav_sensors::DVL_Beams_<ContainerAllocator> >::stream(s, indent + "  ", v.beams);
    s << indent << "mean_bottom_range: ";
    Printer<float>::stream(s, indent + "  ", v.mean_bottom_range);
    s << indent << "speed_of_sound: ";
    Printer<float>::stream(s, indent + "  ", v.speed_of_sound);
    s << indent << "BT_status: ";
    Printer<int64_t>::stream(s, indent + "  ", v.BT_status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAV_SENSORS_MESSAGE_DVL_DATA_H
