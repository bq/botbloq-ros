// Generated by gencpp from file comm_bridge/GetAccRequest.msg
// DO NOT EDIT!


#ifndef COMM_BRIDGE_MESSAGE_GETACCREQUEST_H
#define COMM_BRIDGE_MESSAGE_GETACCREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace comm_bridge
{
template <class ContainerAllocator>
struct GetAccRequest_
{
  typedef GetAccRequest_<ContainerAllocator> Type;

  GetAccRequest_()
    {
    }
  GetAccRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }






  typedef boost::shared_ptr< ::comm_bridge::GetAccRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::comm_bridge::GetAccRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetAccRequest_

typedef ::comm_bridge::GetAccRequest_<std::allocator<void> > GetAccRequest;

typedef boost::shared_ptr< ::comm_bridge::GetAccRequest > GetAccRequestPtr;
typedef boost::shared_ptr< ::comm_bridge::GetAccRequest const> GetAccRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::comm_bridge::GetAccRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::comm_bridge::GetAccRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace comm_bridge

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::comm_bridge::GetAccRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::comm_bridge::GetAccRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::comm_bridge::GetAccRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::comm_bridge::GetAccRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "comm_bridge/GetAccRequest";
  }

  static const char* value(const ::comm_bridge::GetAccRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::comm_bridge::GetAccRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct GetAccRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::comm_bridge::GetAccRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::comm_bridge::GetAccRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // COMM_BRIDGE_MESSAGE_GETACCREQUEST_H