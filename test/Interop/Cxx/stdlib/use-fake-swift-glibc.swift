// RUN: %target-typecheck-verify-swift -enable-cxx-interop -I %S/Inputs -I %S/Inputs/fake_libc++ -I %S/Inputs/fake_glibc

import FakeSwiftGlibc

_ = fake_cos(5.0)

additionalDeclarationFromLibcxx();
