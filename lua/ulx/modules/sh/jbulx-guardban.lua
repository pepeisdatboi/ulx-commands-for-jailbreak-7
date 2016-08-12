function ulx.guardban( calling_ply, target_ply, unban )
	if GAMEMODE_NAME == "jailbreak" then
		if unban then
			if target_ply._ulx4jb7_guardbanned then
				target_ply._ulx4jb7_guardbanned=false
				ulx.fancyLogAdmin( calling_ply, "#A unbanned #T from guards",  target_ply );
			else
				return
			end
		else
			target_ply._ulx4jb7_guardbanned=true
			ulx.fancyLogAdmin( calling_ply, "#A banned #T from guards",  target_ply );
			if target_ply:Team() == TEAM_GUARD then
				target_ply:SetTeam(TEAM_PRISONER);
				target_ply:KillSilent();
				target_ply:SendNotification("Forced to prisoners");
			end
		end
	else
		ULib.tsayError(calling_ply, "The current gamemode is not jailbreak!", true);
	end
end
local guardban = ulx.command("Jailbreak", "ulx guardban", ulx.guardban, "!guardban" )
guardban:defaultAccess( ULib.ACCESS_ADMIN )
guardban:addParam{ type=ULib.cmds.PlayerArg }
guardban:addParam{ type=ULib.cmds.BoolArg, invisible=true }
guardban:setOpposite( "ulx unguardban", { _, _, true }, {"!unguardban", "!guardunban"} )
guardban:help( "Bans target from guards." )


hook.Add( "JailBreakPlayerSwitchTeam", "ulx4jb7_JailBreakPlayerSwitchTeam", function(player, team)
	if player._ulx4jb7_guardbanned and team == TEAM_GUARD then
		player:SetTeam(TEAM_PRISONER);
		player:KillSilent();
		player:SendNotification("Forced to prisoners");
		ULib.tsayError(player, "You are banned from joining guards!")
	end
end )