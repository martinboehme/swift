// RUN: %target-typecheck-verify-swift -I %S/Inputs

import FakeGlibc
import RejectTextualIncludes

_ = userFunction()

_ = RejectTextualIncludes.userFunction()

_ = fakeCos(0.0)

_ = FakeGlibc.fakeCos(0.0)

_ = RejectTextualIncludes.fakeCos(0.0)
