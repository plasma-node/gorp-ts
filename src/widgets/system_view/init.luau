local rts = require(script.Parent.Parent.rts)

local performance = require(script.performance)
local system_query_hook = require(script.Parent.Parent.system_query_hook)
local tabs = require(script.Parent.Parent.components.tabs)
local text = require(script.Parent.Parent.components.text)
local widget = require(script.Parent.Parent.components.widget)

return function(scheduler: rts.Scheduler, index: number)
	local system = scheduler.systems[index]

	return widget {

		title = system.name,
		min_size = Vector2.new(230, 200),
		closeable = true,

		tabs {
			{
				name = "Performance",
				child = function()
					local hook = system_query_hook.new(scheduler, index)

					return performance(
						system.time,
						hook.views :: any,
						hook:enable()
					)
				end,
			},
			{
				name = "Watch",
				child = function()
					return text {
						text = "contains a panel that lets you preview the changes a system makes",

						layout = {
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							AutomaticSize = Enum.AutomaticSize.XY,
						},
					}
				end,
			},
		},
	}
end
