/* Lablgtkosxapplication */
/* Copyright (C) 2012 Pierre Boutillier */

/* This library is free software; you can redistribute it and/or */
/* modify it under the terms of the GNU Lesser General Public */
/* License as published by the Free Software Foundation; */
/* version 2.1 of the License. */

/* This library is distributed in the hope that it will be useful, */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU */
/* Lesser General Public License for more details. */

/* You should have received a copy of the GNU Lesser General Public */
/* License along with this library; if not, write to the Free Software */
/* Foundation, Inc., 51 Franklin Street, Fifth Floor, */
/* Boston, MA  02110-1301  USA */

#include <gtk/gtk.h>
#include <lablgtk2/wrappers.h>
#include <lablgtk2/ml_gobject.h>
#include <lablgtk2/ml_gdkpixbuf.h>
#include <igemacintegration/gtkosxapplication.h>

// Copy/Paste of lablgtk2.14.1 that should be avoided
#define GtkMenuShell_val(val) check_cast(GTK_MENU_SHELL,val)
// End of ToDrop part

#define GtkOSXApplication_val(val) check_cast(GTK_OSX_APPLICATION,val)

#include "gtkosxapplication_tags.h"
#include "gtkosxapplication_tags.c"

CAMLprim value ml_gtk_osxapplication_init(value unit)
{       /* Since these are declared const, must force gcc to call them! */
  GType t = gtk_osxapplication_get_type();
  return Val_GType(t);
}

ML_1 (gtk_osxapplication_ready, GtkOSXApplication_val, Unit)
ML_1 (gtk_osxapplication_cleanup, GtkOSXApplication_val, Unit)

ML_2 (gtk_osxapplication_set_use_quartz_accelerators, GtkOSXApplication_val, Bool_val, Unit)
ML_1 (gtk_osxapplication_use_quartz_accelerators, GtkOSXApplication_val, Val_bool)

ML_2 (gtk_osxapplication_set_menu_bar, GtkOSXApplication_val, GtkMenuShell_val, Unit)
ML_1 (gtk_osxapplication_sync_menubar, GtkOSXApplication_val, Unit)

ML_2 (gtk_osxapplication_set_dock_menu, GtkOSXApplication_val, GtkMenuShell_val, Unit)
ML_2 (gtk_osxapplication_set_dock_icon_pixbuf, GtkOSXApplication_val, GdkPixbuf_val, Unit)
ML_4 (gtk_osxapplication_set_dock_icon_resource, GtkOSXApplication_val, String_val, String_val, String_val, Unit)

ML_2 (gtk_osxapplication_attention_request, GtkOSXApplication_val, Attention_type_val, Val_int)
ML_2 (gtk_osxapplication_cancel_attention_request, GtkOSXApplication_val, Int_val, Unit)

ML_1 (gtk_osxapplication_get_bundle_path, GtkOSXApplication_val, Val_string)
ML_1 (gtk_osxapplication_get_resource_path, GtkOSXApplication_val, Val_string)
ML_1 (gtk_osxapplication_get_executable_path, GtkOSXApplication_val, Val_string)
ML_1 (gtk_osxapplication_get_bundle_id, GtkOSXApplication_val, Val_string)
ML_2 (gtk_osxapplication_get_bundle_info, GtkOSXApplication_val, String_val, Val_string)
