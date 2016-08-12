function ulx.revive( calling_ply, target_plys )
	for k,v in pairs( target_plys ) do
		if GAMEMODE_NAME == "jailbreak" then
			v._jb_forceRespawn=true
		end
		v:Spawn()
	end
	ulx.fancyLogAdmin( calling_ply, "#A revived #T",  target_plys )
end
local revive = ulx.command("Jailbreak", "ulx revive", ulx.revive, "!revive")
revive:defaultAccess( ULib.ACCESS_ADMIN )
revive:addParam{ type=ULib.cmds.PlayersArg }
revive:help( "Revives target(s)." )