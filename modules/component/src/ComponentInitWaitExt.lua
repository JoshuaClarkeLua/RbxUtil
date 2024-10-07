local function isDestroyed(inst: Instance): boolean
	local success = pcall(function()
		if inst.Parent == nil then
			local _parent = inst.Parent
			inst.Parent = script
			inst.Parent = _parent
		else
			inst.Parent = inst.Parent
		end
	end)
	return not success
end

local INIT = {}
local Ext = {}
Ext.INIT_PROMISE = INIT

function Ext.ShouldConstruct(self)
	local comp = getmetatable(self)
	local initPromise = comp[INIT]
	if typeof(initPromise) == 'table' and typeof(initPromise.await) == 'function' then
		initPromise:await()
		if isDestroyed(self.Instance) then
			return false
		end
	end
	return true
end

return Ext