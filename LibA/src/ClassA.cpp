#include "LibA/ClassA.h"
#include "LibB/ClassB.h"
#include "LibC/ClassC.h"

#include <sstream>

namespace LibA {

ClassA::ClassA()
{

}

ClassA::~ClassA()
{

}

std::string ClassA::toString() const
{
	std::stringstream out;

	out << "ClassA[: ";
	out << LibB::ClassB().toString();
	out << ", ";
	out << LibC::ClassC().toString();
	out << "]";

	return out.str();
}

}

