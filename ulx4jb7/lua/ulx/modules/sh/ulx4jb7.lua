function ulx.makeprisoner( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_PRISONER);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to prisoners");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a prisoner",  target_ply )
end
local makeprisoner = ulx.command("Jailbreak", "ulx makeprisoner", ulx.makeprisoner, "!makeprisoner" )
makeprisoner:defaultAccess( ULib.ACCESS_ADMIN )
makeprisoner:addParam{ type=ULib.cmds.PlayerArg }
makeprisoner:help( "Makes target a prisoner." )

function ulx.makeguard( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_GUARD);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to guards");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a guard",  target_ply )
end
local makeguard = ulx.command("Jailbreak", "ulx makeguard", ulx.makeguard, "!makeguard")
makeguard:defaultAccess( ULib.ACCESS_ADMIN )
makeguard:addParam{ type=ULib.cmds.PlayerArg }
makeguard:help( "Makes target a guard." )

function ulx.makespectator( calling_ply, target_ply )
	target_ply:SetTeam(TEAM_SPECTATOR);
	target_ply:KillSilent();
	target_ply:SendNotification("Forced to spectators");
	ulx.fancyLogAdmin( calling_ply, "#A made #T a spectator",  target_ply )
end
local makespectator = ulx.command("Jailbreak", "ulx makespectator", ulx.makespectator, {"!makespectator", "!makespec"} )
makespectator:defaultAccess( ULib.ACCESS_ADMIN )
makespectator:addParam{ type=ULib.cmds.PlayerArg }
makespectator:help( "Makes target a spectator." )

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
revive:help( "Revives target(s)." )