#include "LibB/ClassB.h"
#include "LibC/ClassC.h"
#include "LibC/Errors.h"
#include <sstream>

namespace LibB {

ClassB::ClassB()
{

}

ClassB::~ClassB()
{

}

std::string ClassB::toString() const
{
	std::stringstream out;
	out << "ClassB[";
	out << LibC::ClassC().toString();
	out << ", ";
	out << LibC::GetErrorString(-1);
	out << "]";
	return out.str();
}

}
