//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <whistle_loop_sdk/whistle_loop_sdk_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) whistle_loop_sdk_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WhistleLoopSdkPlugin");
  whistle_loop_sdk_plugin_register_with_registrar(whistle_loop_sdk_registrar);
}
