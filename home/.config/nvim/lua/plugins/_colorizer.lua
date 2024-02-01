local plugin_name = "colorizer"

if not CheckPlugin(plugin_name) then
  return
end

require(plugin_name).setup()
