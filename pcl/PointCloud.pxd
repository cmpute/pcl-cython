from libcpp.string cimport string

from pcl._boost.smart_ptr cimport shared_ptr
from pcl._eigen cimport Vector4f, Quaternionf
from pcl.common.PCLPointCloud2 cimport PCLPointCloud2
from pcl.common.PCLPointField cimport PCLPointField

cdef dict _POINT_TYPE_MAPPING

cdef public class PointCloud[object CyPointCloud, type CyPointCloud_py]:
    cdef shared_ptr[PCLPointCloud2] _ptr
    cdef Vector4f _origin
    cdef Quaternionf _orientation
    cdef string _ptype
    cdef PCLPointCloud2* ptr(self)

cdef extern from "PointCloud.hpp" namespace "pcl":
    cdef cppclass PointCloudFused
    void CyTemplatize(PointCloud input, const PointCloudFused &output)
    void CyInstantiate(PointCloud output, PointCloudFused &input)
