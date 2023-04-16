// Generated by gencpp from file nav_sensors/DVL_Beam.msg
// DO NOT EDIT!


#ifndef NAV_SENSORS_MESSAGE_DVL_BEAM_H
#define NAV_SENSORS_MESSAGE_DVL_BEAM_H


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
struct DVL_Beam_
{
  typedef DVL_Beam_<ContainerAllocator> Type;

  DVL_Beam_()
    : data()  {
    }
  DVL_Beam_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::nav_sensors::DVL_Beam_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nav_sensors::DVL_Beam_<ContainerAllocator> const> ConstPtr;

}; // struct DVL_Beam_

typedef ::nav_sensors::DVL_Beam_<std::allocator<void> > DVL_Beam;

typedef boost::shared_ptr< ::nav_sensors::DVL_Beam > DVL_BeamPtr;
typedef boost::shared_ptr< ::nav_sensors::DVL_Beam const> DVL_BeamConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nav_sensors::DVL_Beam_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nav_sensors::DVL_Beam_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nav_sensors::DVL_Beam_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Beam_<ContainerAllocator2> & rhs)
{
  return lhs.data == rhs.data;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nav_sensors::DVL_Beam_<ContainerAllocator1> & lhs, const ::nav_sensors::DVL_Beam_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nav_sensors

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nav_sensors::DVL_Beam_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nav_sensors::DVL_Beam_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nav_sensors::DVL_Beam_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
{
  static const char* value()
  {
    return "420cd38b6b071cd49f2970c3e2cee511";
  }

  static const char* value(const ::nav_sensors::DVL_Beam_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x420cd38b6b071cd4ULL;
  static const uint64_t static_value2 = 0x9f2970c3e2cee511ULL;
};

template<class ContainerAllocator>
struct DataType< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_sensors/DVL_Beam";
  }

  static const char* value(const ::nav_sensors::DVL_Beam_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] data\n"
;
  }

  static const char* value(const ::nav_sensors::DVL_Beam_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DVL_Beam_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nav_sensors::DVL_Beam_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nav_sensors::DVL_Beam_<ContainerAllocator>& v)
  {
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // NAV_SENSORS_MESSAGE_DVL_BEAM_H
