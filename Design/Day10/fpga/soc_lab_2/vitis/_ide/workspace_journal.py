# 2026-09-08T08:49:37.393640213
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../soc_lab_2/soc_lab_2_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.create_app_component(name="application",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_ps7_cortexa9_0")

vitis.dispose()

