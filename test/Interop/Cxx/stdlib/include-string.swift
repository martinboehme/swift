// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -I %S/Inputs -o %t/include_string -Xfrontend -enable-cxx-interop -Xcc -stdlib=libc++ -Xclang-linker -stdlib=libc++
// RUN: %target-codesign %t/include_string
// RUN: %target-run %t/include_string

import IncludeString
import StdlibUnittest

var IncludeStringTestSuite = TestSuite("IncludeString")

IncludeStringTestSuite.test("CallFoo") {
  expectTrue(foo())
}

runAllTests()
