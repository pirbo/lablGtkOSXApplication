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
