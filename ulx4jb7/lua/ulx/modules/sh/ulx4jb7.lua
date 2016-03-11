function ulx.forceprisoner( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_PRISONER);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to prisoners");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a prisoner",  target_ply )
end
local forceprisoner = ulx.command("Jailbreak", "ulx forceprisoner", ulx.forceprisoner, {"!forceprisoner", "!fprisoner"} )
forceprisoner:defaultAccess( ULib.ACCESS_ADMIN )
forceprisoner:addParam{ type=ULib.cmds.PlayerArg }
forceprisoner:help( "Force a player to be a prisoner." )

function ulx.forceguard( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_GUARD);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to guards");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a guard",  target_ply )
end
local forceguard = ulx.command("Jailbreak", "ulx forceguard", ulx.forceguard, {"!forceguard", "!fguard"} )
forceguard:defaultAccess( ULib.ACCESS_ADMIN )
forceguard:addParam{ type=ULib.cmds.PlayerArg }
forceguard:help( "Force a player to be a guard." )

function ulx.forcespectator( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_SPECTATOR);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to spectators");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a spectator",  target_ply )
end
local forcespectator = ulx.command("Jailbreak", "ulx forcespectator", ulx.forcespectator, {"!forcespectator", "!forcespec", "!fspec", "!fspectator"} )
forcespectator:defaultAccess( ULib.ACCESS_ADMIN )
forcespectator:addParam{ type=ULib.cmds.PlayerArg }
forcespectator:help( "Force a player to be a spectator." )

function ulx.revive( calling_ply, target_plys )
	for k,v in pairs( target_plys ) do
		v._jb_forceRespawn=true
		v:Spawn()
	end
	ulx.fancyLogAdmin( calling_ply, "#A revived #T",  target_plys )
end
local revive = ulx.command("Jailbreak", "ulx revive", ulx.revive, "!revive")
revive:defaultAccess( ULib.ACCESS_ADMIN )
revive:addParam{ type=ULib.cmds.PlayersArg }
revive:help( "Revive a player" )