// Generated by gencpp from file gripper_controller/floattypeResult.msg
// DO NOT EDIT!


#ifndef GRIPPER_CONTROLLER_MESSAGE_FLOATTYPERESULT_H
#define GRIPPER_CONTROLLER_MESSAGE_FLOATTYPERESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Float64.h>

namespace gripper_controller
{
template <class ContainerAllocator>
struct floattypeResult_
{
  typedef floattypeResult_<ContainerAllocator> Type;

  floattypeResult_()
    : data()  {
    }
  floattypeResult_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Float64_<ContainerAllocator>  _data_type;
  _data_type data;




  typedef boost::shared_ptr< ::gripper_controller::floattypeResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gripper_controller::floattypeResult_<ContainerAllocator> const> ConstPtr;

}; // struct floattypeResult_

typedef ::gripper_controller::floattypeResult_<std::allocator<void> > floattypeResult;

typedef boost::shared_ptr< ::gripper_controller::floattypeResult > floattypeResultPtr;
typedef boost::shared_ptr< ::gripper_controller::floattypeResult const> floattypeResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gripper_controller::floattypeResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gripper_controller::floattypeResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gripper_controller

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'roscpp': ['/opt/ros/indigo/share/roscpp/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'gripper_controller': ['/home/chao/catkin_ws_action/devel/share/gripper_controller/msg'], 'dynamixel_msgs': ['/home/chao/tools/src/dynamixel_motor/dynamixel_msgs/msg'], 'actionlib': ['/opt/ros/indigo/share/actionlib/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gripper_controller::floattypeResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gripper_controller::floattypeResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gripper_controller::floattypeResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gripper_controller::floattypeResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gripper_controller::floattypeResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gripper_controller::floattypeResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gripper_controller::floattypeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8d62201b2d01a4931eec14d19d9c5317";
  }

  static const char* value(const ::gripper_controller::floattypeResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8d62201b2d01a493ULL;
  static const uint64_t static_value2 = 0x1eec14d19d9c5317ULL;
};

template<class ContainerAllocator>
struct DataType< ::gripper_controller::floattypeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gripper_controller/floattypeResult";
  }

  static const char* value(const ::gripper_controller::floattypeResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gripper_controller::floattypeResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
std_msgs/Float64 data\n\
\n\
================================================================================\n\
MSG: std_msgs/Float64\n\
float64 data\n\
";
  }

  static const char* value(const ::gripper_controller::floattypeResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gripper_controller::floattypeResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct floattypeResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gripper_controller::floattypeResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gripper_controller::floattypeResult_<ContainerAllocator>& v)
  {
    s << indent << "data: ";
    s << std::endl;
    Printer< ::std_msgs::Float64_<ContainerAllocator> >::stream(s, indent + "  ", v.data);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRIPPER_CONTROLLER_MESSAGE_FLOATTYPERESULT_H
