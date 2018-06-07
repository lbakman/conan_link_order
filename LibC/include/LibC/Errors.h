#ifndef LIBC_ERRORS_H
#define LIBC_ERRORS_H

#include <string>

namespace LibC {

std::string GetErrorString(int errcode);

}

#endif //LIBC_ERRORS_H
