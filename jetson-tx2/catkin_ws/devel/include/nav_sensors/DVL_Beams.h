// Generated by gencpp from file nav_sensors/DVL_Beams.msg
// DO NOT EDIT!


#ifndef NAV_SENSORS_MESSAGE_DVL_BEAMS_H
#define NAV_SENSORS_MESSAGE_DVL_BEAMS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nav_sensors
{
template <class ContainerAllocator>
struct DVL_Beams_
{
  typedef DVL_Beams_<ContainerAllocator> Type;

  DVL_Beams_()
    : beam1(0.0)
    , beam2(0.0)
    , beam3(0.0)
    , beam4(0.0)  {
    }
  DVL_Beams_(const ContainerAllocator& _alloc)
    : beam1(0.0)
    , beam2(0.0)
    , beam3(0.0)
    , beam4(0.0)  {
  (void)_alloc;
    }



   typedef float _beam1_type;
  _beam1_type beam1;

   typedef float _beam2_type;
  _beam2_type beam2;

   typedef float _beam3_type;
  _beam3_type beam3;

   typedef float _beam4_type;
  _beam4_type beam4;





  typedef boost::shared_ptr< ::nav_sensors::DVL_Beams_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nav_sensors::DVL_Beams_<ContainerAllocator> const> ConstPtr;

}; // struct DVL_Beams_

typedef ::nav_sensors::DVL_Beams_<std::allocator<void> > DVL_Beams;

typedef boost::shared_ptr< ::nav_sensors::DVL_Beams > DVL_BeamsPtr;
typedef boost::shared_ptr< ::nav_sensors::DVL_Beams const> DVL_BeamsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nav_sensors::DVL_Beams_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nav_sensors::DVL_Beams_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nav_sensors::DVL_Beams_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Beams_<ContainerAllocator2> & rhs)
{
  return lhs.beam1 == rhs.beam1 &&
    lhs.beam2 == rhs.beam2 &&
    lhs.beam3 == rhs.beam3 &&
    lhs.beam4 == rhs.beam4;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nav_sensors::DVL_Beams_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Beams_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nav_sensors

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Beams_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Beams_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Beams_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
{
  static const char* value()
  {
    return "546dd638b4ab134d8326eefb33315dc0";
  }

  static const char* value(const ::nav_sensors::DVL_Beams_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x546dd638b4ab134dULL;
  static const uint64_t static_value2 = 0x8326eefb33315dc0ULL;
};

template<class ContainerAllocator>
struct DataType< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_sensors/DVL_Beams";
  }

  static const char* value(const ::nav_sensors::DVL_Beams_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 beam1\n"
"float32 beam2\n"
"float32 beam3\n"
"float32 beam4\n"
;
  }

  static const char* value(const ::nav_sensors::DVL_Beams_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.beam1);
      stream.next(m.beam2);
      stream.next(m.beam3);
      stream.next(m.beam4);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DVL_Beams_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nav_sensors::DVL_Beams_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nav_sensors::DVL_Beams_<ContainerAllocator>& v)
  {
    s << indent << "beam1: ";
    Printer<float>::stream(s, indent + "  ", v.beam1);
    s << indent << "beam2: ";
    Printer<float>::stream(s, indent + "  ", v.beam2);
    s << indent << "beam3: ";
    Printer<float>::stream(s, indent + "  ", v.beam3);
    s << indent << "beam4: ";
    Printer<float>::stream(s, indent + "  ", v.beam4);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAV_SENSORS_MESSAGE_DVL_BEAMS_H
