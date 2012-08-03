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
#include <wrappers.h>
#include <ml_gobject.h>
#include <ml_gdkpixbuf.h>
#include <gtkmacintegration/gtkosxapplication.h>

// Copy/Paste of lablgtk2.14.2 that should be avoided
#define GtkWidget_val(val) check_cast(GTK_WIDGET,val)
#define GtkMenuShell_val(val) check_cast(GTK_MENU_SHELL,val)
#define GtkMenuItem_val(val) check_cast(GTK_MENU_ITEM,val)
// End of ToDrop part

#define GtkOSXApplication_val(val) check_cast(GTK_OSX_APPLICATION,val)

#include "gtkosxapplication_tags.h"
#include "gtkosxapplication_tags.c"

CAMLprim value ml_gtk_osxapplication_init(value unit)
{       /* Since these are declared const, must force gcc to call them! */
  GType t = gtk_osxapplication_get_type();
  return Val_GType(t);
}

ML_2 (gtk_osxapplication_attention_request, GtkOSXApplication_val, Attention_type_val, Val_int)
ML_2 (gtk_osxapplication_cancel_attention_request, GtkOSXApplication_val, Int_val, Unit)
ML_1 (gtk_osxapplication_cleanup, GtkOSXApplication_val, Unit)
ML_3 (gtk_osxapplication_insert_app_menu_item, GtkOSXApplication_val, GtkWidget_val, Int_val, Unit)
ML_1 (gtk_osxapplication_ready, GtkOSXApplication_val, Unit)
ML_2 (gtk_osxapplication_set_dock_icon_pixbuf, GtkOSXApplication_val, GdkPixbuf_val, Unit)
ML_4 (gtk_osxapplication_set_dock_icon_resource, GtkOSXApplication_val, String_val, String_val, String_val, Unit)
ML_2 (gtk_osxapplication_set_dock_menu, GtkOSXApplication_val, GtkMenuShell_val, Unit)
ML_2 (gtk_osxapplication_set_help_menu, GtkOSXApplication_val, Option_val(arg2,GtkMenuItem_val,NULL) Ignore, Unit)
ML_2 (gtk_osxapplication_set_menu_bar, GtkOSXApplication_val, GtkMenuShell_val, Unit)
ML_2 (gtk_osxapplication_set_use_quartz_accelerators, GtkOSXApplication_val, Bool_val, Unit)
ML_2 (gtk_osxapplication_set_window_menu, GtkOSXApplication_val, Option_val(arg2,GtkMenuItem_val,NULL) Ignore, Unit)
ML_1 (gtk_osxapplication_sync_menubar, GtkOSXApplication_val, Unit)
ML_1 (gtk_osxapplication_use_quartz_accelerators, GtkOSXApplication_val, Val_bool)
ML_0 (quartz_application_get_bundle_path, Val_string)
ML_0 (quartz_application_get_resource_path, Val_string)
ML_0 (quartz_application_get_executable_path, Val_string)
ML_0 (quartz_application_get_bundle_id, Val_string)
ML_1 (quartz_application_get_bundle_info, String_val, Val_string)
