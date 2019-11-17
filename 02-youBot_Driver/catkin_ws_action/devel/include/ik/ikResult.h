// Generated by gencpp from file ik/ikResult.msg
// DO NOT EDIT!


#ifndef IK_MESSAGE_IKRESULT_H
#define IK_MESSAGE_IKRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ik
{
template <class ContainerAllocator>
struct ikResult_
{
  typedef ikResult_<ContainerAllocator> Type;

  ikResult_()
    : jointresult()  {
    }
  ikResult_(const ContainerAllocator& _alloc)
    : jointresult(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _jointresult_type;
  _jointresult_type jointresult;




  typedef boost::shared_ptr< ::ik::ikResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ik::ikResult_<ContainerAllocator> const> ConstPtr;

}; // struct ikResult_

typedef ::ik::ikResult_<std::allocator<void> > ikResult;

typedef boost::shared_ptr< ::ik::ikResult > ikResultPtr;
typedef boost::shared_ptr< ::ik::ikResult const> ikResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ik::ikResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ik::ikResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ik

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'ik': ['/home/chao/catkin_ws_action/src/ik/msg', '/home/chao/catkin_ws_action/devel/share/ik/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ik::ikResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ik::ikResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ik::ikResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ik::ikResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ik::ikResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ik::ikResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ik::ikResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "71015519b9e78e4b859088d8b25e40a6";
  }

  static const char* value(const ::ik::ikResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x71015519b9e78e4bULL;
  static const uint64_t static_value2 = 0x859088d8b25e40a6ULL;
};

template<class ContainerAllocator>
struct DataType< ::ik::ikResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ik/ikResult";
  }

  static const char* value(const ::ik::ikResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ik::ikResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
float64[] jointresult\n\
";
  }

  static const char* value(const ::ik::ikResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ik::ikResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.jointresult);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ikResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ik::ikResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ik::ikResult_<ContainerAllocator>& v)
  {
    s << indent << "jointresult[]" << std::endl;
    for (size_t i = 0; i < v.jointresult.size(); ++i)
    {
      s << indent << "  jointresult[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.jointresult[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // IK_MESSAGE_IKRESULT_H
