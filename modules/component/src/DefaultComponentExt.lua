local RunService = game:GetService("RunService")

local Ext = {}

function Ext.ShouldConstruct(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'ShouldConstruct')
	if typeof(mainFn) == 'function' then
		if not mainFn(self) then
			return false
		end
	end
	if RunService:IsServer() then
		if typeof(comp.Server.ShouldConstruct) == 'function' then
			if not comp.Server.ShouldConstruct(self) then
				return false
			end
		end
	else
		if typeof(comp.Client.ShouldConstruct) == 'function' then
			if not comp.Client.ShouldConstruct(self) then
				return false
			end
		end
	end
	return true
end

function Ext.Constructing(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Constructing')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Constructing) == 'function' then
			comp.Server.Constructing(self)
		end
	else
		if typeof(comp.Client.Constructing) == 'function' then
			comp.Client.Constructing(self)
		end
	end
end

function Ext.Constructed(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Constructed')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Constructed) == 'function' then
			comp.Server.Constructed(self)
		end
	else
		if typeof(comp.Client.Constructed) == 'function' then
			comp.Client.Constructed(self)
		end
	end
end

function Ext.Starting(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Starting')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Starting) == 'function' then
			comp.Server.Starting(self)
		end
	else
		if typeof(comp.Client.Starting) == 'function' then
			comp.Client.Starting(self)
		end
	end
end

function Ext.Started(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Started')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Started) == 'function' then
			comp.Server.Started(self)
		end
	else
		if typeof(comp.Client.Started) == 'function' then
			comp.Client.Started(self)
		end
	end
end

function Ext.Stopping(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Stopping')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Stopping) == 'function' then
			comp.Server.Stopping(self)
		end
	else
		if typeof(comp.Client.Stopping) == 'function' then
			comp.Client.Stopping(self)
		end
	end
end

function Ext.Stopped(self)
	local comp = getmetatable(self)
	local mainFn = rawget(comp, 'Stopped')
	if typeof(mainFn) == 'function' then
		mainFn(self)
	end
	if RunService:IsServer() then
		if typeof(comp.Server.Stopped) == 'function' then
			comp.Server.Stopped(self)
		end
	else
		if typeof(comp.Client.Stopped) == 'function' then
			comp.Client.Stopped(self)
		end
	end
end

return Ext