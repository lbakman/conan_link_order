#ifndef LIBA_CLASSA_H
#define LIBA_CLASSA_H

#include <string>

namespace LibA {

class ClassA {
public:
	ClassA();
	virtual ~ClassA();

	virtual std::string toString() const;
};

}

#endif //LIBA_CLASSA_H
