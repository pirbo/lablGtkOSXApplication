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
#include <gtkosxapplication.h>

// Copy/Paste of lablgtk2.14.2 that should be avoided
#define GtkWidget_val(val) check_cast(GTK_WIDGET,val)
#define GtkMenuShell_val(val) check_cast(GTK_MENU_SHELL,val)
#define GtkMenuItem_val(val) check_cast(GTK_MENU_ITEM,val)
// End of ToDrop part

#define GtkosxApplication_val(val) check_cast(GTKOSX_APPLICATION,val)
#define Val_gtkosxApplication(val) (Val_GObject((GObject*)val))

#include "gtkosxapplication_tags.h"
#include "gtkosxapplication_tags.c"

CAMLprim value ml_gtkosx_application_init(value unit)
{       /* Since these are declared const, must force gcc to call them! */
  GType t = gtkosx_application_get_type();
  return Val_GType(t);
}

ML_2 (gtkosx_application_attention_request, GtkosxApplication_val, Attention_type_val, Val_int)
ML_2 (gtkosx_application_cancel_attention_request, GtkosxApplication_val, Int_val, Unit)
ML_3 (gtkosx_application_insert_app_menu_item, GtkosxApplication_val, GtkWidget_val, Int_val, Unit)
ML_1 (gtkosx_application_ready, GtkosxApplication_val, Unit)
ML_2 (gtkosx_application_set_dock_icon_pixbuf, GtkosxApplication_val, GdkPixbuf_val, Unit)
ML_4 (gtkosx_application_set_dock_icon_resource, GtkosxApplication_val, String_val, String_val, String_val, Unit)
ML_2 (gtkosx_application_set_dock_menu, GtkosxApplication_val, GtkMenuShell_val, Unit)
ML_2 (gtkosx_application_set_help_menu, GtkosxApplication_val, Option_val(arg2,GtkMenuItem_val,NULL) Ignore, Unit)
ML_2 (gtkosx_application_set_menu_bar, GtkosxApplication_val, GtkMenuShell_val, Unit)
ML_2 (gtkosx_application_set_use_quartz_accelerators, GtkosxApplication_val, Bool_val, Unit)
ML_2 (gtkosx_application_set_window_menu, GtkosxApplication_val, Option_val(arg2,GtkMenuItem_val,NULL) Ignore, Unit)
ML_1 (gtkosx_application_sync_menubar, GtkosxApplication_val, Unit)
ML_1 (gtkosx_application_use_quartz_accelerators, GtkosxApplication_val, Val_bool)
ML_0 (gtkosx_application_get, Val_gtkosxApplication)
ML_0 (gtkosx_application_get_bundle_path, Val_string)
ML_0 (gtkosx_application_get_resource_path, Val_string)
ML_0 (gtkosx_application_get_executable_path, Val_string)
ML_0 (gtkosx_application_get_bundle_id, Val_string)
ML_1 (gtkosx_application_get_bundle_info, String_val, Val_string)
