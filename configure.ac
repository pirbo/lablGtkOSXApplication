AC_INIT(lablgtkosx,2.01)

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

PKG_CHECK_MODULES([GTKOSX],gtk-mac-integration-gtk2 >= 2.0.0)

AC_COPYRIGHT([Pierre Boutillier 2012])
AC_REVISION(2.00)

AC_CONFIG_FILES([Makefile src/Makefile example/Info.plist META])
AC_OUTPUT
