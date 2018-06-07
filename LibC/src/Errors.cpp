#include "LibC/Errors.h"
#include <sstream>

namespace LibC {

std::string GetErrorString(int errcode)
{
	std::stringstream out;
	out << "Error: " << errcode;
	return out.str();
}

}