AC_INIT(lablgtkosx,1.01)

AC_PROG_CC

AC_CONFIG_MACRO_DIR(m4)

AC_CONFIG_SRCDIR(src/ml_gtkosxapplication.c)

AC_PROG_OCAML
if test "$OCAMLC" = "no"; then
   AC_MSG_ERROR([OCaml compiler has not been found.])
fi
AC_SUBST(OCAMLOPT)

AC_PROG_FINDLIB
if test "$OCAMLFIND" = "no"; then
  AC_MSG_ERROR([Findlib (ocamlfind command) has not been found.])
fi

AC_CHECK_OCAML_PKG(lablgtk2)

PKG_CHECK_MODULES([GTKOSX],gtk-mac-integration)

AC_COPYRIGHT([Pierre Boutillier 2012])
AC_REVISION(1dev)

AC_CONFIG_FILES([Makefile src/Makefile example/info.plist META])
AC_OUTPUT