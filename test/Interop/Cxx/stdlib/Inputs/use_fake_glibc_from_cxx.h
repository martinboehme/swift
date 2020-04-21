#include <math.h>

inline double useFakeCos() {
  return fake_cos(0.0);
}

inline double useAdditionalDeclarationFromLibcxx() {
  additionalDeclarationFromLibcxx();
}
