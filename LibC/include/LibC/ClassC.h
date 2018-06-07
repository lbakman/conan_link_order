#ifndef LIBC_CLASSC_H
#define LIBC_CLASSC_H

#include <string>

namespace LibC {

class ClassC {
public:
	ClassC();
	virtual ~ClassC();

	virtual std::string toString() const;
};

}

#endif //LIBC_CLASSC_H
