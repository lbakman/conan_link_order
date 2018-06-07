#ifndef LIBB_CLASSB_H
#define LIBB_CLASSB_H

#include <string>

namespace LibB {

class ClassB {
public:
	ClassB();
	virtual ~ClassB();

	virtual std::string toString() const;
};

}

#endif //LIBB_CLASSB_H
