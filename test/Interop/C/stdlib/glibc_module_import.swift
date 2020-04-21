// The purpose of this test is to verify that using C standard library functions
// in an imported C module does not affect the visibility of those functions
// in the `Glibc` module.
// C standard library headers get included textually into both the `SwiftGlibc`
// module (which is re-exported by `Glibc`) and an imported C module that uses
// them. This causes the corresponding definitions to be present in all of these
// modules. Clang contains logic to deduplicate these definitions; we want to
// verify that this logic does not affect the visibility of these definitions in
// Glibc.

// Apple platforms and Windows don't have the `Glibc` module.
// UNSUPPORTED: VENDOR=apple || OS=windows-msvc

// RUN: %target-typecheck-verify-swift -I %S/Inputs -DIMPORT_GLIBC_THEN_C_MODULE
// RUN: %target-typecheck-verify-swift -I %S/Inputs -DIMPORT_C_MODULE_THEN_GLIBC
// RUN: %target-typecheck-verify-swift -I %S/Inputs -DIMPORT_ONLY_C_MODULE
// RUN: %target-typecheck-verify-swift -I %S/Inputs -DIMPORT_ONLY_C_MODULE -enable-cxx-interop -Xcc -stdlib=libc++

#if IMPORT_GLIBC_THEN_C_MODULE
import Glibc
import GlibcModuleImport
#endif

#if IMPORT_C_MODULE_THEN_GLIBC
import GlibcModuleImport
import Glibc
#endif

#if IMPORT_ONLY_C_MODULE
import GlibcModuleImport
#endif

#if !IMPORT_ONLY_C_MODULE
Glibc.fputs("Hello from Swift!\n", stdout)
#endif

// TODO: This is unfortunate. Explain.
fputs("Ooops!\n", stdout)
GlibcModuleImport.fputs("Ooops!\n", stdout)
